import 'package:fedi/refactored/app/account/my/my_account_model.dart';
import 'package:fedi/refactored/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:flutter/widgets.dart';

Future<MyAccountRemoteWrapper> createTestMyAccount(
    {@required String seed, String remoteId}) async {
  return MyAccountRemoteWrapper(
      remoteAccount: PleromaMyAccount(
    id: remoteId ?? seed + "remoteId1",
    username: seed + "username1",
    url: seed + "url1",
    note: seed + "note1",
    locked: true,
    headerStatic: seed + "headerStatic1",
    header: seed + "header1",
    followingCount: seed.hashCode + 11,
    followersCount: seed.hashCode + 12,
    statusesCount: seed.hashCode + 13,
    displayName: seed + "displayName1",
    createdAt: DateTime(11),
    avatarStatic: seed + "avatarStatic1",
    avatar: seed + "avatar1",
    acct: seed + "acct1",
    lastStatusAt: DateTime(12),
    bot: false,
    fields: null,
    emojis: null,
    pleroma: PleromaMyAccountPleromaPart(
      tags: null,
      relationship: null,
      isAdmin: true,
      isModerator: false,
      confirmationPending: true,
      hideFavorites: false,
      hideFollowers: true,
      hideFollows: false,
      hideFollowersCount: true,
      hideFollowsCount: false,
      deactivated: false,
      allowFollowingMove: true,
      skipThreadContainment: true,
    ),
  ));
}