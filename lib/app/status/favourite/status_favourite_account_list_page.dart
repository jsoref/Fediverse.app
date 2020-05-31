import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/details/account_details_page.dart';
import 'package:fedi/app/account/pagination/cached/account_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_widget.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/app/status/favourite/status_favourite_account_cached_list_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusFavouriteAccountListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title:
            tr("app.status.favourited_by.title"),
      ),
      body: SafeArea(
        child: AccountPaginationListWidget(
          accountSelectedCallback: (account) =>
              goToAccountDetailsPage(context, account),
          key: PageStorageKey("StatusFavouriteAccountListPage"),
        ),
      ),
    );
  }

  const StatusFavouriteAccountListPage();
}

void goToStatusFavouriteAccountListPage(BuildContext context, IStatus status) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) =>
            DisposableProvider<IPleromaCachedListBloc<IAccount>>(
                create: (context) =>
                    StatusFavouriteAccountCachedListBloc.createFromContext(
                        context,
                        status: status),
                child: DisposableProvider<
                    IPaginationBloc<PaginationPage<IAccount>, IAccount>>(
                  create: (context) =>
                      AccountCachedPaginationBloc.createFromContext(context),
                  child: DisposableProvider<IAccountPaginationListBloc>(
                    create: (context) =>
                        AccountPaginationListBloc.createFromContext(context),
                    child: const StatusFavouriteAccountListPage(),
                  ),
                ))),
  );
}
