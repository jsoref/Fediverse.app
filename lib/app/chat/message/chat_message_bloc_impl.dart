import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/message/chat_message_bloc.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

abstract class ChatMessageBloc extends DisposableOwner
    implements IChatMessageBloc {
  BehaviorSubject<IChatMessage> get _chatMessageSubject;

  final bool isNeedWatchLocalRepositoryForUpdates;

  ChatMessageBloc({
//for better performance we don't update
    // account too often
    @required bool needRefreshFromNetworkOnInit, // todo: remove hack. Don't
    // init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    @required bool delayInit,
    @required this.isNeedWatchLocalRepositoryForUpdates,
  }) {
    assert(needRefreshFromNetworkOnInit != null);
    assert(isNeedWatchLocalRepositoryForUpdates != null);
    if (delayInit) {
      Future.delayed(Duration(seconds: 1), () {
        _init(needRefreshFromNetworkOnInit);
      });
    } else {
      _init(needRefreshFromNetworkOnInit);
    }
  }

  void _init(bool needRefreshFromNetworkOnInit) {
    if (!disposed) {
      if (isNeedWatchLocalRepositoryForUpdates) {
        watchLocalRepositoryChanges();
      }
      if (needRefreshFromNetworkOnInit) {
        refreshFromNetwork();
      }
    }
  }

  @override
  IPleromaMediaAttachment get mediaAttachment => chatMessage.mediaAttachment;

  @override
  Stream<IPleromaMediaAttachment> get mediaAttachmentStream =>
      chatMessageStream.map((chatMessage) => chatMessage.mediaAttachment);

  @override
  IPleromaCard get card => chatMessage.card;

  @override
  Stream<IPleromaCard> get cardStream =>
      chatMessageStream.map((chatMessage) => chatMessage.card);

  @override
  IChatMessage get chatMessage => _chatMessageSubject.value;

  @override
  Stream<IChatMessage> get chatMessageStream =>
      _chatMessageSubject.stream.distinct();

  @override
  IAccount get account => chatMessage?.account;

  @override
  Stream<IAccount> get accountStream =>
      chatMessageStream.map((chatMessage) => chatMessage.account).distinct();

  @override
  DateTime get createdAt => chatMessage?.createdAt;

  @override
  Stream<DateTime> get createdAtStream =>
      chatMessageStream.map((chatMessage) => chatMessage?.createdAt).distinct();

  @override
  String get remoteId => chatMessage.remoteId;

  @override
  String get content => chatMessage?.content;

  @override
  Stream<String> get contentStream =>
      chatMessageStream.map((chatMessage) => chatMessage?.content).distinct();

  @override
  String get accountAvatar => account?.avatar;

  @override
  Stream<String> get accountAvatarStream =>
      accountStream.map((account) => account.avatar).distinct();

  @override
  EmojiText get contentWithEmojis =>
      EmojiText(text: chatMessage.content, emojis: chatMessage.emojis);

  @override
  Stream<EmojiText> get contentWithEmojisStream => chatMessageStream
      .map(
        (chatMessage) =>
            EmojiText(text: chatMessage.content, emojis: chatMessage.emojis),
      )
      .distinct();

  void watchLocalRepositoryChanges();
}
