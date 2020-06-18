import 'package:fedi/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class IConversationMessagesHomeTabBloc extends DisposableOwner {
  static IConversationMessagesHomeTabBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IConversationMessagesHomeTabBloc>(context, listen: listen);

  ScrollController get nestedScrollController;

  INestedScrollControllerBloc get nestedScrollControllerBloc;
  IFediNestedScrollViewBloc get fediNestedScrollViewBloc;

  void scrollToTop();
}