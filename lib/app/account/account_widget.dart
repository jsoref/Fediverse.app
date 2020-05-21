import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/action/account_action_list_widget.dart';
import 'package:fedi/app/account/field/account_field_grid_widget.dart';
import 'package:fedi/app/account/info/account_info_widget.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/note/account_note_widget.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);
    var myAccountBloc = IMyAccountBloc.of(context, listen: false);
    return Container(
      child: Column(
        children: <Widget>[
          const AccountInfoWidget(),
          if (!myAccountBloc.checkAccountIsMe(accountBloc.account))
            Container(
              color: Colors.blue[100],
              child: const AccountActionListWidget(),
            ),
          const AccountNoteWidget(),
          const AccountFieldGridWidget(),
        ],
      ),
    );
  }

  const AccountWidget();
}