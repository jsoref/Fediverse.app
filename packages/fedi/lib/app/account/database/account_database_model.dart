import 'package:fedi/app/moor/moor_converters.dart';
import 'package:fedi/moor/moor_json_type_converter.dart';
import 'package:moor/moor.dart';

// todo: add foreign keys
@DataClassName('DbAccount')
class DbAccounts extends Table {
  // integer ids works better in SQLite
  IntColumn get id => integer().nullable().autoIncrement()();

  TextColumn get remoteId => text().customConstraint('UNIQUE NOT NULL')();

  TextColumn get username => text()();

  TextColumn get url => text()();

  TextColumn get note => text().nullable()();

  BoolColumn get locked => boolean().nullable()();

  TextColumn get headerStatic => text().nullable()();

  TextColumn get header => text().nullable()();

  IntColumn get followingCount => integer().nullable()();

  IntColumn get followersCount => integer().nullable()();

  IntColumn get statusesCount => integer().nullable()();

  TextColumn get displayName => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  BoolColumn get bot => boolean().nullable()();

  TextColumn get avatarStatic => text()();

  TextColumn get avatar => text()();

  TextColumn get acct => text()();

  DateTimeColumn get lastStatusAt => dateTime().nullable()();

  TextColumn get fields => text()
      .nullable()
      .map(const UnifediApiFieldListDatabaseConverter())
      .nullable()();

  TextColumn get emojis => text()
      .nullable()
      .map(const UnifediApiEmojiListDatabaseConverter())
      .nullable()();

  TextColumn get backgroundImage =>
      text().named('unifedi_background_image').nullable()();

  TextColumn get tags => text()
      .named('unifedi_tags')
      .nullable()
      .map(const UnifediApiTagListDatabaseConverter())
      .nullable()();

  TextColumn get relationship => text()
      .named('unifedi_relationship')
      .nullable()
      .map(const UnifediApiAccountRelationshipDatabaseConverter())
      .nullable()();

  BoolColumn get isAdmin => boolean().named('unifedi_is_admin').nullable()();

  BoolColumn get isModerator =>
      boolean().named('unifedi_is_moderator').nullable()();

  BoolColumn get confirmationPending =>
      boolean().named('unifedi_confirmation_pending').nullable()();

  BoolColumn get hideFavorites =>
      boolean().named('unifedi_hide_favorites').nullable()();

  BoolColumn get hideFollowers =>
      boolean().named('unifedi_hide_followers').nullable()();

  BoolColumn get hideFollows =>
      boolean().named('unifedi_hide_follows').nullable()();

  BoolColumn get hideFollowersCount =>
      boolean().named('unifedi_hide_followers_count').nullable()();

  BoolColumn get hideFollowsCount =>
      boolean().named('unifedi_hide_follows_count').nullable()();

  BoolColumn get deactivated =>
      boolean().named('unifedi_deactivated').nullable()();

  BoolColumn get allowFollowingMove =>
      boolean().named('unifedi_allow_following_move').nullable()();

  BoolColumn get skipThreadContainment =>
      boolean().named('unifedi_skip_thread_containment').nullable()();

  BoolColumn get acceptsChatMessages =>
      boolean().named('unifedi_accepts_chat_messages').nullable()();

  BoolColumn get suspended => boolean().nullable()();

  BoolColumn get isConfirmed => boolean().nullable()();

  DateTimeColumn get muteExpiresAt => dateTime().nullable()();

  TextColumn get fqn => text().nullable()();

  TextColumn get favicon => text().nullable()();

  TextColumn get apId => text().nullable()();

  TextColumn get alsoKnownAs =>
      text().nullable().map(const StringListDatabaseConverter()).nullable()();
}
