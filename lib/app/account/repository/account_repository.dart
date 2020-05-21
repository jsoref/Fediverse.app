import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/repository/account_repository_model.dart';
import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/conversation/conversation_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/repository/repository.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountRepository
    implements
        Disposable,
        IReadIdListRepository<IAccount, int>,
        IWriteIdListRepository<DbAccount, int> {
  static IAccountRepository of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountRepository>(context, listen: listen);

  Future<IAccount> findByRemoteId(String remoteId);

  Stream<IAccount> watchByRemoteId(String remoteId);

  Future upsertRemoteAccounts(List<IPleromaAccount> remoteAccounts,
      {@required String conversationRemoteId, @required String chatRemoteId});

  Future upsertRemoteAccount(IPleromaAccount remoteAccount,
      {@required conversationRemoteId, @required String chatRemoteId});

  Future updateAccountFollowings(
      String accountRemoteId, List<PleromaAccount> followings);

  Future updateAccountFollowers(
      String accountRemoteId, List<PleromaAccount> followers);

  Future updateStatusRebloggedBy(
      {@required String statusRemoteId,
      @required List<PleromaAccount> rebloggedByAccounts});

  Future updateStatusFavouritedBy(
      {@required String statusRemoteId,
      @required List<PleromaAccount> favouritedByAccounts});

  Future updateLocalAccountByRemoteAccount(
      {@required IAccount oldLocalAccount,
      @required IPleromaAccount newRemoteAccount});

  Future<List<IAccount>> getAccounts(
      {@required IAccount olderThanAccount,
      @required IAccount newerThanAccount,
      @required IConversation onlyInConversation,
      @required IChat onlyInChat,
      @required IStatus onlyInStatusRebloggedBy,
      @required IStatus onlyInStatusFavouritedBy,
      @required IAccount onlyInAccountFollowers,
      @required IAccount onlyInAccountFollowing,
      @required String searchQuery,
      @required int limit,
      @required int offset,
      @required AccountOrderingTermData orderingTermData});

  Stream<List<IAccount>> watchAccounts(
      {@required IAccount olderThanAccount,
      @required IAccount newerThanAccount,
      @required IConversation onlyInConversation,
      @required IChat onlyInChat,
      @required IStatus onlyInStatusRebloggedBy,
      @required IStatus onlyInStatusFavouritedBy,
      @required IAccount onlyInAccountFollowers,
      @required IAccount onlyInAccountFollowing,
      @required String searchQuery,
      @required int limit,
      @required int offset,
      @required AccountOrderingTermData orderingTermData});

  Future<IAccount> getAccount(
      {@required IAccount olderThanAccount,
      @required IAccount newerThanAccount,
      @required IConversation onlyInConversation,
      @required IChat onlyInChat,
      @required IStatus onlyInStatusRebloggedBy,
      @required IStatus onlyInStatusFavouritedBy,
      @required IAccount onlyInAccountFollowers,
      @required IAccount onlyInAccountFollowing,
      @required String searchQuery,
      @required AccountOrderingTermData orderingTermData});

  Stream<IAccount> watchAccount(
      {@required IAccount olderThanAccount,
      @required IAccount newerThanAccount,
      @required IConversation onlyInConversation,
      @required IChat onlyInChat,
      @required IStatus onlyInStatusRebloggedBy,
      @required IStatus onlyInStatusFavouritedBy,
      @required IAccount onlyInAccountFollowers,
      @required IAccount onlyInAccountFollowing,
      @required String searchQuery,
      @required AccountOrderingTermData orderingTermData});

  Future<List<IAccount>> getConversationAccounts(
      {@required IConversation conversation});

  Stream<List<IAccount>> watchConversationAccounts(
      {@required IConversation conversation});

  Future<List<IAccount>> getChatAccounts({@required IChat chat});

  Stream<List<IAccount>> watchChatAccounts({@required IChat chat});
}