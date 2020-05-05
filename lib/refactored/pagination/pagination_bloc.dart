import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

abstract class IPaginationBloc<TPage extends PaginationPage<TItem>, TItem>
    implements DisposableOwner {
  static final int undefinedPageIndex = -1;

  int get loadedPagesMinimumIndex;

  Stream<int> get loadedPagesMinimumIndexStream;

  int get loadedPagesMaximumIndex;

  Stream<int> get loadedPagesMaximumIndexStream;

  bool get isLoadedPagesInSequence;

  Stream<bool> get isLoadedPagesInSequenceStream;

  List<int> get loadedPageIndexesSortedByIndex;

  Stream<List<int>> get loadedPageIndexesSortedByIndexStream;

  List<TPage> get loadedPagesSortedByIndex;

  Stream<List<TPage>> get loadedPagesSortedByIndexStream;

  int get itemsCountPerPage;

  Future<TPage> refresh();

  Future<TPage> requestPage(
      {@required int pageIndex, @required bool forceToSkipCache});
}