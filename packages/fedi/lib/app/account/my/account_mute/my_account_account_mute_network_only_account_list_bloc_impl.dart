import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/list/network_only/account_network_only_list_bloc.dart';
import 'package:fedi/app/account/list/network_only/account_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi/app/account/my/account_mute/my_account_account_mute_network_only_account_list_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MyAccountAccountMuteNetworkOnlyAccountListBloc extends DisposableOwner
    implements IMyAccountAccountMuteNetworkOnlyAccountListBloc {
  final IUnifediApiAccountService pleromaAuthAccountService;
  final IUnifediApiMyAccountService unifediApiMyAccountService;
  final IAccountRepository accountRepository;

  MyAccountAccountMuteNetworkOnlyAccountListBloc({
    required this.pleromaAuthAccountService,
    required this.unifediApiMyAccountService,
    required this.accountRepository,
  });

  @override
  Future<void> removeAccountMute({required IAccount? account}) async {
    var accountRelationship = await pleromaAuthAccountService.unMuteAccount(
      accountId: account!.remoteId,
    );

    var unifediApiAccount = account
        .copyWithTemp(
          relationship: accountRelationship,
        )
        .toUnifediApiAccount();

    // ignore: avoid-ignoring-return-values
    await accountRepository.upsertInRemoteType(
      unifediApiAccount,
    );
  }

  @override
  Future<void> addAccountMute({required IAccount account}) async {
    var accountRelationship = await pleromaAuthAccountService.muteAccount(
      accountId: account.remoteId,
      notifications: false,
      expireIn: null,
    );

    var unifediApiAccount = account
        .copyWithTemp(
          relationship: accountRelationship,
        )
        .toUnifediApiAccount();

    // ignore: avoid-ignoring-return-values
    await accountRepository.upsertInRemoteType(
      unifediApiAccount,
    );
  }

  @override
  Future<List<IAccount>> loadItemsFromRemoteForPage({
    required int pageIndex,
    int? itemsCountPerPage,
    String? minId,
    String? maxId,
  }) async {
    var remoteAccounts = await unifediApiMyAccountService.getMyAccountMutes(
      pagination: UnifediApiPagination(
        minId: minId,
        maxId: maxId,
        limit: itemsCountPerPage,
      ),
      withRelationship: false,
    );

    await accountRepository.upsertAllInRemoteType(
      remoteAccounts,
      // dont need batch because we have only one transaction
      batchTransaction: null,
    );

    return remoteAccounts.toDbAccountPopulatedWrappers();
  }

  @override
  IUnifediApiService get unifediApi => unifediApiMyAccountService;

  static MyAccountAccountMuteNetworkOnlyAccountListBloc createFromContext(
    BuildContext context,
  ) =>
      MyAccountAccountMuteNetworkOnlyAccountListBloc(
        unifediApiMyAccountService: Provider.of<IUnifediApiMyAccountService>(
          context,
          listen: false,
        ),
        accountRepository: IAccountRepository.of(
          context,
          listen: false,
        ),
        pleromaAuthAccountService: Provider.of<IUnifediApiAccountService>(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<IMyAccountAccountMuteNetworkOnlyAccountListBloc>(
        create:
            MyAccountAccountMuteNetworkOnlyAccountListBloc.createFromContext,
        child: ProxyProvider<IMyAccountAccountMuteNetworkOnlyAccountListBloc,
            IAccountNetworkOnlyListBloc>(
          update: (context, value, previous) => value,
          child: AccountNetworkOnlyListBlocProxyProvider(
            child: ProxyProvider<
                IMyAccountAccountMuteNetworkOnlyAccountListBloc,
                INetworkOnlyListBloc<IAccount>>(
              update: (context, value, previous) => value,
              child: child,
            ),
          ),
        ),
      );

  @override
  Future<void> changeAccountMute({
    required IAccount? account,
    required bool notifications,
    required Duration? duration,
  }) async {
    // ignore: avoid-ignoring-return-values
    await pleromaAuthAccountService.unMuteAccount(
      accountId: account!.remoteId,
    );

    var accountRelationship = await pleromaAuthAccountService.muteAccount(
      accountId: account.remoteId,
      notifications: notifications,
      expireIn: duration,
    );

    var unifediApiAccount = account
        .copyWithTemp(
          relationship: accountRelationship,
        )
        .toUnifediApiAccount();

    // ignore: avoid-ignoring-return-values
    await accountRepository.upsertInRemoteType(
      unifediApiAccount,
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}