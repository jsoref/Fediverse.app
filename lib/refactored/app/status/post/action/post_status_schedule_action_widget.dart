import 'package:fedi/refactored/app/status/post/post_status_bloc.dart';
import 'package:fedi/refactored/app/status/post/schedule/post_status_schedule_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostStatusScheduleActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var postStatusBloc = IPostStatusBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: postStatusBloc.isScheduledStream,
        initialData: postStatusBloc.isScheduled,
        builder: (context, snapshot) {
          var isScheduled = snapshot.data;

          Null Function() onPressed;
          onPressed = () {
            showPostStatusScheduleDialog(context, postStatusBloc);
          };

          return IconButton(
            icon: Icon(
              Icons.schedule,
              color: isScheduled ? Colors.blue : null,
            ),
            onPressed: onPressed,
          );
        });
  }
}