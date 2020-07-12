import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_filled_button.dart';
import 'package:fedi/collapsible/collapsible_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToggleCollapsibleOverlayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var collapsibleBloc = ICollapsibleBloc.of(context, listen: true);

    return StreamBuilder<bool>(
        stream: collapsibleBloc.isAtLeastOneVisibleItemExpandedStream,
        initialData: collapsibleBloc.isAtLeastOneVisibleItemExpanded,
        builder: (context, snapshot) {
          var isAtLeastOneVisibleItemExpanded = snapshot.data;

          if (isAtLeastOneVisibleItemExpanded) {
            return FediIconInCircleFilledButton(
              Icons.keyboard_arrow_up,
              onPressed: collapsibleBloc.collapseAllVisibleItems,
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }

  const ToggleCollapsibleOverlayWidget();
}