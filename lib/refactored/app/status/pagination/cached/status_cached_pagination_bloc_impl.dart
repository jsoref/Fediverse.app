import 'package:fedi/refactored/app/pagination/cached/cached_pleroma_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/status/list/cached/status_cached_list_service.dart';
import 'package:fedi/refactored/app/status/pagination/cached/status_cached_pagination_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatusCachedPaginationBloc extends CachedPleromaPaginationBloc<IStatus>
    implements IStatusCachedPaginationBloc {
  final IStatusCachedListService statusListService;

  StatusCachedPaginationBloc(
      {@required this.statusListService,
      @required int itemsCountPerPage,
      @required int maximumCachedPagesCount})
      : super(
            maximumCachedPagesCount: maximumCachedPagesCount,
            itemsCountPerPage: itemsCountPerPage);

  @override
  IPleromaApi get pleromaApi => statusListService.pleromaApi;

  @override
  Future<List<IStatus>> loadLocalItems(
          {@required int pageIndex,
          @required int itemsCountPerPage,
          @required CachedPaginationPage<IStatus> olderPage,
          @required CachedPaginationPage<IStatus> newerPage}) =>
      statusListService.loadLocalItems(
        limit: itemsCountPerPage,
        newerThan: olderPage?.items?.first,
        olderThan: newerPage?.items?.last,
      );

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int pageIndex,
      @required int itemsCountPerPage,
      @required CachedPaginationPage<IStatus> olderPage,
      @required CachedPaginationPage<IStatus> newerPage}) async {
    await statusListService.preRefreshAllAction();

    // can't refresh not first page without actual items bounds
    assert(!(pageIndex > 0 && olderPage == null && newerPage == null));

    return statusListService.refreshItemsFromRemoteForPage(
      limit: itemsCountPerPage,
      newerThan: olderPage?.items?.first,
      olderThan: newerPage?.items?.last,
    );
  }

  static StatusCachedPaginationBloc createFromContext(BuildContext context,
          {int itemsCountPerPage = 20, int maximumCachedPagesCount}) =>
      StatusCachedPaginationBloc(
          statusListService:
              Provider.of<IStatusCachedListService>(context, listen: false),
          itemsCountPerPage: itemsCountPerPage,
          maximumCachedPagesCount: maximumCachedPagesCount);
}
