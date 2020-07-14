import 'package:fedi/app/chat/accounts/chat_accounts_page.dart';
import 'package:fedi/app/chat/avatar/chat_avatar_widget.dart';
import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/chat_bloc_impl.dart';
import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/chat_widget.dart';
import 'package:fedi/app/chat/current/current_chat_bloc.dart';
import 'package:fedi/app/chat/post/chat_post_message_bloc_impl.dart';
import 'package:fedi/app/chat/title/chat_title_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_custom_app_bar.dart';
import 'package:fedi/app/ui/spacer/fedi_big_horizontal_spacer.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var chatBloc = IChatBloc.of(context, listen: false);

    return FediDarkStatusBarStyleArea(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              FediSubPageCustomAppBar(
                leading: FediBackIconButton(),
                child: buildChatAccountsWidget(context, chatBloc),
              ),
              Expanded(child: ChatWidget())
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatAccountsWidget(BuildContext context, IChatBloc chatBloc) {
    return InkWell(
      onTap: () {
        goToChatAccountsPage(context, chatBloc.chat);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ChatAvatarWidget(baseAvatarSize: 36),
          const FediBigHorizontalSpacer(),
          const ChatTitleWidget(
            textStyle: FediTextStyles.bigShortBoldDarkGrey,
          ),
        ],
      ),
    );
  }
}

void goToChatPage(BuildContext context, {@required IChat chat}) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DisposableProvider<IChatBloc>(
            create: (context) {
              var chatBloc = ChatBloc.createFromContext(context, chat: chat);

              // we don't need to await
              chatBloc.markAsRead();

              var currentChatBloc = ICurrentChatBloc.of(context, listen: false);

              currentChatBloc.onChatOpened(chat);

              chatBloc.addDisposable(disposable: CustomDisposable(() {
                currentChatBloc.onChatClosed(chat);
              }));

              return chatBloc;
            },
            child: ChatPostMessageBloc.provideToContext(
              context,
              chatRemoteId: chat.remoteId,
              child: ChatPage(),
            ))),
  );
}
