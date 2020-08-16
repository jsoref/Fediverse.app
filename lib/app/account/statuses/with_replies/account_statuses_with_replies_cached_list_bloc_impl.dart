import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/account/statuses/account_statuses_cached_list_bloc_impl.dart';
import 'package:fedi/app/chat/chat_new_messages_handler_bloc.dart';
import 'package:fedi/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/app/notification/repository/notification_repository.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';

var _logger = Logger("account_statuses_with_replies_cached_list_bloc_impl.dart");

class AccountStatusesWithRepliesCachedListBloc
    extends AccountStatusesCachedListBloc {
  AccountStatusesWithRepliesCachedListBloc({
    @required IAccount account,
    @required IPleromaAccountService pleromaAccountService,
    @required IStatusRepository statusRepository,
    @required INotificationRepository notificationRepository,
    @required IConversationRepository conversationRepository,
    @required IPleromaWebSocketsService pleromaWebSocketsService,
    @required bool listenWebSocketsChanges,
    @required IChatNewMessagesHandlerBloc chatNewMessagesHandlerBloc,
  }) : super(
            account: account,
            pleromaAccountService: pleromaAccountService,
            statusRepository: statusRepository,
            notificationRepository: notificationRepository,
            conversationRepository: conversationRepository,
            pleromaWebSocketsService: pleromaWebSocketsService,
            listenWebSocketsChanges: listenWebSocketsChanges,
            chatNewMessagesHandlerBloc: chatNewMessagesHandlerBloc);

  @override
  IPleromaApi get pleromaApi => pleromaAccountService;

  static AccountStatusesWithRepliesCachedListBloc createFromContext(
      BuildContext context,
      {@required IAccount account}) {
    return AccountStatusesWithRepliesCachedListBloc(
      account: account,
      pleromaAccountService: IPleromaAccountService.of(context, listen: false),
      statusRepository: IStatusRepository.of(context, listen: false),
      conversationRepository:
          IConversationRepository.of(context, listen: false),
      listenWebSocketsChanges: IMyAccountSettingsBloc.of(context, listen: false)
          .isRealtimeWebSocketsEnabledFieldBloc
          .currentValue,
      notificationRepository:
          INotificationRepository.of(context, listen: false),
      pleromaWebSocketsService:
          IPleromaWebSocketsService.of(context, listen: false),
      chatNewMessagesHandlerBloc:
          IChatNewMessagesHandlerBloc.of(context, listen: false),
    );
  }

  @override
  Future<List<IStatus>> loadLocalItems(
      {@required int limit,
      @required IStatus newerThan,
      @required IStatus olderThan}) async {
    var statuses = await statusRepository.getStatuses(
        onlyInListWithRemoteId: null,
        onlyWithHashtag: null,
        onlyFromAccountsFollowingByAccount: null,
        onlyLocal: null,
        onlyWithMedia: false,
        onlyNotMuted: false,
        excludeVisibilities: null,
        olderThanStatus: olderThan,
        newerThanStatus: newerThan,
        onlyNoNsfwSensitive: false,
        onlyNoReplies: false,
        onlyFromAccount: account,
        limit: limit,
        offset: null,
        orderingTermData: StatusOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: StatusOrderByType.remoteId),
        onlyInConversation: null,
        isFromHomeTimeline: null);

    return statuses;
  }

  @override
  Stream<List<IStatus>> watchLocalItemsNewerThanItem(IStatus item) {
    return statusRepository.watchStatuses(
        onlyInListWithRemoteId: null,
        onlyWithHashtag: null,
        onlyFromAccountsFollowingByAccount: null,
        onlyLocal: null,
        onlyWithMedia: false,
        onlyNotMuted: false,
        excludeVisibilities: null,
        olderThanStatus: null,
        newerThanStatus: item,
        onlyNoNsfwSensitive: false,
        onlyNoReplies: false,
        onlyFromAccount: account,
        limit: null,
        offset: null,
        orderingTermData: StatusOrderingTermData(
            orderingMode: OrderingMode.desc,
            orderByType: StatusOrderByType.remoteId),
        onlyInConversation: null,
        isFromHomeTimeline: null);
  }

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IStatus newerThan,
      @required IStatus olderThan}) async {
    _logger.finest(() => "refreshItemsFromRemoteForPage \n"
        "\t limit=$limit"
        "\t newerThan=$newerThan"
        "\t olderThan=$olderThan");

    try {
      var remoteStatuses = await pleromaAccountService.getAccountStatuses(
          accountRemoteId: account.remoteId,
          limit: limit,
          sinceId: newerThan?.remoteId,
          maxId: olderThan?.remoteId);

      if (remoteStatuses != null) {
        await statusRepository.upsertRemoteStatuses(remoteStatuses,
            listRemoteId: null, conversationRemoteId: null);

        return true;
      } else {
        _logger.severe(() => "error during refreshItemsFromRemoteForPage: "
            "statuses is null");
        return false;
      }
    } catch (e, stackTrace) {
      _logger.severe(
          () => "error during refreshItemsFromRemoteForPage", e, stackTrace);
      return false;
    }
  }

  @override
  Stream<bool> get settingsChangedStream => Stream.empty();

  static Widget provideToContext(BuildContext context,
      {@required IAccount account, @required Widget child}) {
    return DisposableProvider<IStatusCachedListBloc>(
      create: (context) =>
          AccountStatusesWithRepliesCachedListBloc.createFromContext(context,
              account: account),
      child: child,
    );
  }
}