import 'package:flutter/cupertino.dart';

class UnfocusOnScrollAreaWidget extends StatelessWidget {
  final Widget child;


  UnfocusOnScrollAreaWidget({@required this.child});

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanDown: (_) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: child);

}