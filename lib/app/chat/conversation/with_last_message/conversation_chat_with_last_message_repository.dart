import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository_model.dart';
import 'package:fedi/app/chat/conversation/with_last_message/conversation_chat_with_last_message_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatWithLastMessageRepository
    implements IDisposable {
  static IConversationChatWithLastMessageRepository of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationChatWithLastMessageRepository>(context,
          listen: listen);

  Future<List<IConversationChatWithLastMessage>>
      getConversationsWithLastMessage({
    @required IConversationChat olderThan,
    @required IConversationChat newerThan,
    @required int limit,
    @required int offset,
    @required ConversationChatOrderingTermData orderingTermData,
  });

  Stream<List<IConversationChatWithLastMessage>>
      watchConversationsWithLastMessage({
    @required IConversationChat olderThan,
    @required IConversationChat newerThan,
    @required int limit,
    @required int offset,
    @required ConversationChatOrderingTermData orderingTermData,
  });
}
