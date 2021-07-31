import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/statuses/account_statuses_network_only_list_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

abstract class AccountStatusesMediaOnlyNetworkOnlyListBloc
    extends AccountStatusesNetworkOnlyListBloc {
  AccountStatusesMediaOnlyNetworkOnlyListBloc({
    required IAccount? account,
    required IPleromaApiAccountService pleromaAccountService,
  }) : super(account: account, pleromaAccountService: pleromaAccountService);

  @override
  IPleromaApi get pleromaApi => pleromaAccountService;

  @override
  Future<List<IStatus>> loadItemsFromRemoteForPage({
    int? pageIndex,
    int? itemsCountPerPage,
    String? minId,
    String? maxId,
  }) async {
    var pleromaStatuses = await pleromaAccountService.getAccountStatuses(
      onlyWithMedia: true,
      accountRemoteId: account!.remoteId,
      pagination: PleromaApiPaginationRequest(
        sinceId: minId,
        maxId: maxId,
        limit: itemsCountPerPage,
      ),
    );

    return pleromaStatuses
        .map(
          (pleromaStatus) => pleromaStatus.toDbStatusPopulatedWrapper(),
        )
        .toList();
  }
}
