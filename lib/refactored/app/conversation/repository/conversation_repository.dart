import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository_model.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:fedi/refactored/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationRepository
    implements
        IReadIdListRepository<DbConversationWrapper, int>,
        IWriteIdListRepository<DbConversation, int>,
        Disposable {
  static IConversationRepository of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationRepository>(context, listen: listen);

  Future<DbConversationWrapper> findByRemoteId(String remoteId);

  Future upsertRemoteConversations(
      List<IPleromaConversation> remoteConversations);

  Stream<DbConversationWrapper> watchByRemoteId(String remoteId);

  Future upsertRemoteConversation(IPleromaConversation remoteConversation);

  Future<List<DbConversationWrapper>> getConversations(
      {@required IConversation olderThan,
      @required IConversation newerThan,
      @required int limit,
      @required int offset,
      @required ConversationOrderingTermData orderingTermData});

  Stream<List<DbConversationWrapper>> watchConversations(
      {@required IConversation olderThan,
      @required IConversation newerThan,
      @required int limit,
      @required int offset,
      @required ConversationOrderingTermData orderingTermData});

  Future<DbConversationWrapper> getConversation(
      {@required IConversation olderThan,
      @required IConversation newerThan,
      @required ConversationOrderingTermData orderingTermData});

  Stream<DbConversationWrapper> watchConversation(
      {@required IConversation olderThan,
      @required IConversation newerThan,
      @required ConversationOrderingTermData orderingTermData});

  Future updateLocalConversationByRemoteConversation(
      {@required IConversation oldLocalConversation,
      @required IPleromaConversation newRemoteConversation});
}