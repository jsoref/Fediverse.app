import 'package:fedi/refactored/mastodon/emoji/mastodon_emoji_model.dart';
import 'package:fedi/refactored/mastodon/field/mastodon_field_model.dart';

abstract class IMastodonAccount {
  String get username;

  String get url;

  int get statusesCount;

  String get note;

  bool get bot;

  bool get locked;

  String get id;

  String get headerStatic;

  String get header;

  int get followingCount;

  int get followersCount;

  List<IMastodonField> get fields;

  List<IMastodonEmoji> get emojis;

  String get displayName;

  DateTime get createdAt;

  String get avatarStatic;

  String get avatar;

  String get acct;

  DateTime get lastStatusAt;
}

abstract class IMastodonAccountRelationship {
  bool blocking;

  bool get domainBlocking;

  bool get endorsed;

  bool get followedBy;

  bool following;

  String get id;

  bool muting;

  bool get mutingNotifications;

  bool get requested;

  bool get showingReblogs;

  bool get subscribing;
}

abstract class IMastodonAccountIdentityProof {
  String get provider;

  String get providerUsername;

  DateTime get updatedAt;

  String get proofUrl;

  String get profileUrl;
}

abstract class IMastodonAccountReportRequest {
  /// ID of the account to report
  String get accountId;

  /// Array of Statuses to attach to the report, for context
  List<String> get statusIds;

  /// Reason for the report (default max 1000 characters)
  String get comment;

  /// If the account is remote, should the report be forwarded to the remote admin?
  bool get forward;
}