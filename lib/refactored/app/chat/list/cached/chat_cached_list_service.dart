import 'package:fedi/refactored/app/chat/chat_model.dart';
import 'package:fedi/refactored/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatCachedListService extends DisposableOwner
    implements IPleromaCachedListBloc<IChat> {
  static IChatCachedListService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IChatCachedListService>(context, listen: listen);

  Stream<List<IChat>> watchLocalItemsNewerThanItem(IChat item);
}