import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_bloc.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model_adapter.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository_impl.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc_impl.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:moor/ffi.dart';

import '../../../rxdart/rxdart_test_helper.dart';
import '../chat_test_helper.dart';
import 'chat_message_bloc_impl_test.mocks.dart';
import 'chat_message_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
@GenerateMocks([
  IUnifediApiChatService,
  IUnifediApiAccountService,
  IMyAccountBloc,
])
void main() {
  late IPleromaChat chat;
  late IPleromaChatMessage chatMessage;
  late IPleromaChatMessageBloc chatMessageBloc;
  late MockIUnifediApiChatService unifediApiChatServiceMock;
  late MockIUnifediApiAccountService unifediApiAccountServiceMock;
  late AppDatabase database;
  late IAccountRepository accountRepository;
  late IPleromaChatRepository chatRepository;
  late IPleromaChatMessageRepository chatMessageRepository;
  late MockIMyAccountBloc myAccountBloc;

  setUp(
    () async {
      database = AppDatabase(VmDatabase.memory());
      accountRepository = AccountRepository(appDatabase: database);

      chatMessageRepository = PleromaChatMessageRepository(
        appDatabase: database,
        accountRepository: accountRepository,
      );
      chatRepository = PleromaChatRepository(
        appDatabase: database,
        accountRepository: accountRepository,
        chatMessageRepository: chatMessageRepository,
      );

      myAccountBloc = MockIMyAccountBloc();
      unifediApiChatServiceMock = MockIUnifediApiChatService();
      unifediApiAccountServiceMock = MockIUnifediApiAccountService();

      chat = await ChatMockHelper.createTestChat(seed: 'seed1');
      chatMessage = await ChatMessageMockHelper.createTestChatMessage(
        seed: 'seed1',
        chatRemoteId: chat.remoteId,
      );

      await accountRepository.upsertChatRemoteAccount(
        chatMessage.account!.toUnifediApiAccount(),
        chatRemoteId: chatMessage.chatRemoteId,
        batchTransaction: null,
      );

      chatMessageBloc = PleromaChatMessageBloc(
        chatMessage: chatMessage,
        pleromaApiChatService: unifediApiChatServiceMock,
        chatMessageRepository: chatMessageRepository,
        delayInit: false,
        isNeedWatchLocalRepositoryForUpdates: true,
        accountRepository: accountRepository,
        unifediApiAccountService: unifediApiAccountServiceMock,
        pleromaChatBloc: PleromaChatBloc(
          unifediApiChatService: unifediApiChatServiceMock,
          myAccountBloc: myAccountBloc,
          chatRepository: chatRepository,
          chatMessageRepository: chatMessageRepository,
          accountRepository: accountRepository,
          chat: chat,
          lastChatMessage: null,
          delayInit: false,
        ),
      );
    },
  );

  tearDown(() async {
    await chatMessageBloc.dispose();
    await chatMessageRepository.dispose();
    await accountRepository.dispose();
    await database.close();
  });

  Future _update(IPleromaChatMessage chatMessage) async {
    await chatMessageRepository.upsertInRemoteType(
      chatMessage.toUnifediApiChatMessage(),
    );
    await RxDartMockHelper.waitToExecuteRxCallbacks();
  }

  test('chatMessage', () async {
    ChatMessageMockHelper.expectChatMessage(
      chatMessageBloc.chatMessage,
      chatMessage,
    );

    var newValue = await ChatMessageMockHelper.createTestChatMessage(
      seed: 'seed2',
      remoteId: chatMessage.remoteId,
    );
    await accountRepository.upsertChatRemoteAccount(
      newValue.account!.toUnifediApiAccount(),
      chatRemoteId: newValue.chatRemoteId,
      batchTransaction: null,
    );

    var listened;

    var subscription = chatMessageBloc.chatMessageStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);
    ChatMessageMockHelper.expectChatMessage(listened, chatMessage);

    await _update(newValue);

    ChatMessageMockHelper.expectChatMessage(
      chatMessageBloc.chatMessage,
      newValue,
    );
    ChatMessageMockHelper.expectChatMessage(listened, newValue);
    await subscription.cancel();
  });

  test('content', () async {
    expect(chatMessageBloc.content, chatMessage.content);

    var newValue = 'newContent';

    var listened;

    var subscription = chatMessageBloc.contentStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);
    expect(listened, chatMessage.content);

    await _update(chatMessage.copyWith(content: newValue));

    expect(chatMessageBloc.content, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });

  test('contentHtmlWithEmojis', () async {
    var newValue = 'newContent :emoji: :emoji1: :emoji2:';

    var listened;

    var subscription =
        chatMessageBloc.contentWithEmojisStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);

    // same if emojis is empty or null
    await _update(
      chatMessage.copyWith(content: newValue, emojis: <UnifediApiEmoji>[]),
    );

    expect(
      chatMessageBloc.contentWithEmojis,
      EmojiText(
        text: newValue,
        emojis: null,
      ),
    );
    expect(
      listened,
      EmojiText(
        text: newValue,
        emojis: null,
      ),
    );

    // same if emojis is empty or null
    await _update(
      chatMessage.copyWith(
        content: newValue,
        emojis: [
          UnifediApiEmoji(
            name: 'emoji1',
            url: 'https://fedi.app/emoji1.png',
            tags: null,
            staticUrl: null,
            visibleInPicker: null,
          ),
          UnifediApiEmoji(
            name: 'emoji2',
            url: 'https://fedi.app/emoji2.png',
            tags: null,
            staticUrl: null,
            visibleInPicker: null,
          ),
        ],
      ),
    );

    expect(
      chatMessageBloc.contentWithEmojis,
      EmojiText(
        text: 'newContent :emoji: :emoji1: :emoji2:',
        emojis: [
          UnifediApiEmoji(
            name: 'emoji1',
            url: 'https://fedi.app/emoji1.png',
            staticUrl: null,
            visibleInPicker: null,
            tags: null,
          ),
          UnifediApiEmoji(
            name: 'emoji2',
            url: 'https://fedi.app/emoji2.png',
            staticUrl: null,
            visibleInPicker: null,
            tags: null,
          ),
        ],
      ),
    );
    expect(
      listened,
      EmojiText(
        text: 'newContent :emoji: :emoji1: :emoji2:',
        emojis: [
          UnifediApiEmoji(
            name: 'emoji1',
            url: 'https://fedi.app/emoji1.png',
            staticUrl: null,
            visibleInPicker: null,
            tags: null,
          ),
          UnifediApiEmoji(
            name: 'emoji2',
            url: 'https://fedi.app/emoji2.png',
            staticUrl: null,
            visibleInPicker: null,
            tags: null,
          ),
        ],
      ),
    );

    await subscription.cancel();
  });

  test('createdAt', () async {
    expect(chatMessageBloc.createdAt, chatMessage.createdAt);

    var newValue = DateTime(1990);

    var listened;

    var subscription = chatMessageBloc.createdAtStream.listen((newValue) {
      listened = newValue;
    });

    listened = null;
    await RxDartMockHelper.waitForData(() => listened);
    expect(listened, chatMessage.createdAt);

    await _update(chatMessage.copyWith(createdAt: newValue));

    expect(chatMessageBloc.createdAt, newValue);
    expect(listened, newValue);
    await subscription.cancel();
  });

//  test('refreshFromNetwork', () async {
//    ChatMessageMockHelper.expectChatMessage(chatMessageBloc.chatMessage, chatMessage);
//
//    var id = await chatMessageRepository.upsertRemoteChatMessage(
//        mapLocalChatMessageToRemoteChatMessage(chatMessage),
//        listRemoteId: null,
//        conversationRemoteId: null);
//    chatMessage = chatMessage.copyWith(id: id);
//
//    var newValue = await ChatMessageMockHelper.createTestChatMessage(
//        seed: 'seed2', remoteId: chatMessage.remoteId);
//
//    var listened;
//
//    var subscription = chatMessageBloc.chatMessageStream.listen((newValue) {
//      listened = newValue;
//    });
//
//    listened = null;
//     await RxDartMockHelper.waitForData(() => listened);
//    ChatMessageMockHelper.expectChatMessage(listened, chatMessage);
//
//    when(unifediApiChatServiceMock.getChatMessage(
//            chatMessageRemoteId: chatMessage.remoteId))
//        .thenAnswer(
//            (_) async => mapLocalChatMessageToRemoteChatMessage(newValue));
//
//    await chatMessageBloc.refreshFromNetwork();
//
//    listened = null;
//     await RxDartMockHelper.waitForData(() => listened);
//
//    ChatMessageMockHelper.expectChatMessage(listened, newValue);
//    await subscription.cancel();
//  });
}
