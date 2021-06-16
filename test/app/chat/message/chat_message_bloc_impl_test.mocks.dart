// Mocks generated by Mockito 5.0.9 from annotations
// in fedi/test/app/chat/message/chat_message_bloc_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i12;

import 'package:fedi/app/account/account_model.dart' as _i10;
import 'package:fedi/app/account/my/local_preferences/my_account_local_preference_bloc.dart'
    as _i6;
import 'package:fedi/app/account/my/my_account_bloc_impl.dart' as _i23;
import 'package:fedi/app/account/my/my_account_model.dart' as _i24;
import 'package:fedi/app/account/repository/account_repository.dart' as _i8;
import 'package:fedi/app/auth/instance/auth_instance_model.dart' as _i9;
import 'package:fedi/app/chat/message/chat_message_model.dart' as _i28;
import 'package:fedi/app/instance/location/instance_location_model.dart'
    as _i25;
import 'package:fedi/app/status/status_model.dart' as _i26;
import 'package:fedi/disposable/disposable.dart' as _i15;
import 'package:fedi/pleroma/api/account/auth/pleroma_api_auth_account_service_impl.dart'
    as _i20;
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_model.dart'
    as _i27;
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_service.dart'
    as _i7;
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart' as _i5;
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart' as _i3;
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_service_impl.dart'
    as _i11;
import 'package:fedi/pleroma/api/list/pleroma_api_list_model.dart' as _i21;
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart'
    as _i14;
import 'package:fedi/pleroma/api/pleroma_api_service.dart' as _i13;
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart'
    as _i2;
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart' as _i22;
import 'package:fedi/rest/rest_service.dart' as _i4;
import 'package:flutter/src/widgets/editable_text.dart' as _i16;
import 'package:flutter/src/widgets/focus_manager.dart' as _i18;
import 'package:flutter/src/widgets/scroll_controller.dart' as _i17;
import 'package:mockito/mockito.dart' as _i1;
import 'package:rxdart/src/subjects/subject.dart' as _i19;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeIPleromaApiAuthRestService extends _i1.Fake
    implements _i2.IPleromaApiAuthRestService {}

class _FakeIPleromaApiChat extends _i1.Fake implements _i3.IPleromaApiChat {}

class _FakeIPleromaApiChatMessage extends _i1.Fake
    implements _i3.IPleromaApiChatMessage {}

class _FakeIRestService extends _i1.Fake implements _i4.IRestService {}

class _FakeIPleromaApiAccountRelationship extends _i1.Fake
    implements _i5.IPleromaApiAccountRelationship {}

class _FakeIPleromaApiAccount extends _i1.Fake
    implements _i5.IPleromaApiAccount {}

class _FakeIMyAccountLocalPreferenceBloc extends _i1.Fake
    implements _i6.IMyAccountLocalPreferenceBloc {}

class _FakeIPleromaApiMyAccountService extends _i1.Fake
    implements _i7.IPleromaApiMyAccountService {}

class _FakeIAccountRepository extends _i1.Fake
    implements _i8.IAccountRepository {}

class _FakeAuthInstance extends _i1.Fake implements _i9.AuthInstance {}

class _FakeIAccount extends _i1.Fake implements _i10.IAccount {}

/// A class which mocks [PleromaApiChatService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPleromaApiChatService extends _i1.Mock
    implements _i11.PleromaApiChatService {
  MockPleromaApiChatService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get v1ChatRelativeUrlPath =>
      (super.noSuchMethod(Invocation.getter(#v1ChatRelativeUrlPath),
          returnValue: '') as String);
  @override
  String get v2ChatRelativeUrlPath =>
      (super.noSuchMethod(Invocation.getter(#v2ChatRelativeUrlPath),
          returnValue: '') as String);
  @override
  _i2.IPleromaApiAuthRestService get restService =>
      (super.noSuchMethod(Invocation.getter(#restService),
              returnValue: _FakeIPleromaApiAuthRestService())
          as _i2.IPleromaApiAuthRestService);
  @override
  _i2.IPleromaApiAuthRestService get restApiAuthService =>
      (super.noSuchMethod(Invocation.getter(#restApiAuthService),
              returnValue: _FakeIPleromaApiAuthRestService())
          as _i2.IPleromaApiAuthRestService);
  @override
  bool get isPleroma =>
      (super.noSuchMethod(Invocation.getter(#isPleroma), returnValue: false)
          as bool);
  @override
  bool get isMastodon =>
      (super.noSuchMethod(Invocation.getter(#isMastodon), returnValue: false)
          as bool);
  @override
  _i12.Stream<_i13.PleromaApiState> get pleromaApiStateStream =>
      (super.noSuchMethod(Invocation.getter(#pleromaApiStateStream),
              returnValue: Stream<_i13.PleromaApiState>.empty())
          as _i12.Stream<_i13.PleromaApiState>);
  @override
  _i13.PleromaApiState get pleromaApiState =>
      (super.noSuchMethod(Invocation.getter(#pleromaApiState),
          returnValue: _i13.PleromaApiState.validAuth) as _i13.PleromaApiState);
  @override
  _i12.Stream<bool> get isConnectedStream =>
      (super.noSuchMethod(Invocation.getter(#isConnectedStream),
          returnValue: Stream<bool>.empty()) as _i12.Stream<bool>);
  @override
  bool get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected), returnValue: false)
          as bool);
  @override
  bool get isDisposed =>
      (super.noSuchMethod(Invocation.getter(#isDisposed), returnValue: false)
          as bool);
  @override
  set isDisposed(bool? _isDisposed) =>
      super.noSuchMethod(Invocation.setter(#isDisposed, _isDisposed),
          returnValueForMissingStub: null);
  @override
  _i12.Future<List<_i3.IPleromaApiChat>> getChats(
          {_i14.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
              Invocation.method(#getChats, [], {#pagination: pagination}),
              returnValue: Future<List<_i3.IPleromaApiChat>>.value(
                  <_i3.IPleromaApiChat>[]))
          as _i12.Future<List<_i3.IPleromaApiChat>>);
  @override
  _i12.Future<List<_i3.IPleromaApiChatMessage>> getChatMessages(
          {String? chatId, _i14.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
          Invocation.method(
              #getChatMessages, [], {#chatId: chatId, #pagination: pagination}),
          returnValue: Future<List<_i3.IPleromaApiChatMessage>>.value(
              <_i3.IPleromaApiChatMessage>[])) as _i12
          .Future<List<_i3.IPleromaApiChatMessage>>);
  @override
  _i12.Future<_i3.IPleromaApiChat> markChatAsRead(
          {String? chatId, String? lastReadChatMessageId}) =>
      (super.noSuchMethod(
              Invocation.method(#markChatAsRead, [], {
                #chatId: chatId,
                #lastReadChatMessageId: lastReadChatMessageId
              }),
              returnValue:
                  Future<_i3.IPleromaApiChat>.value(_FakeIPleromaApiChat()))
          as _i12.Future<_i3.IPleromaApiChat>);
  @override
  _i12.Future<_i3.IPleromaApiChat> getOrCreateChatByAccountId(
          {String? accountId}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #getOrCreateChatByAccountId, [], {#accountId: accountId}),
              returnValue:
                  Future<_i3.IPleromaApiChat>.value(_FakeIPleromaApiChat()))
          as _i12.Future<_i3.IPleromaApiChat>);
  @override
  _i12.Future<_i3.IPleromaApiChat> getChat({String? id}) =>
      (super.noSuchMethod(Invocation.method(#getChat, [], {#id: id}),
              returnValue:
                  Future<_i3.IPleromaApiChat>.value(_FakeIPleromaApiChat()))
          as _i12.Future<_i3.IPleromaApiChat>);
  @override
  _i12.Future<_i3.IPleromaApiChatMessage> sendMessage(
          {String? chatId, _i3.IPleromaApiChatMessageSendData? data}) =>
      (super.noSuchMethod(
          Invocation.method(#sendMessage, [], {#chatId: chatId, #data: data}),
          returnValue: Future<_i3.IPleromaApiChatMessage>.value(
              _FakeIPleromaApiChatMessage())) as _i12
          .Future<_i3.IPleromaApiChatMessage>);
  @override
  _i12.Future<dynamic> deleteChatMessage(
          {String? chatMessageRemoteId, String? chatId}) =>
      (super.noSuchMethod(
          Invocation.method(#deleteChatMessage, [],
              {#chatMessageRemoteId: chatMessageRemoteId, #chatId: chatId}),
          returnValue: Future<dynamic>.value()) as _i12.Future<dynamic>);
  @override
  _i12.Future<dynamic> dispose() =>
      (super.noSuchMethod(Invocation.method(#dispose, []),
          returnValue: Future<dynamic>.value()) as _i12.Future<dynamic>);
  @override
  void addDisposable(
          {_i15.IDisposable? disposable,
          _i12.StreamSubscription<dynamic>? streamSubscription,
          _i16.TextEditingController? textEditingController,
          _i17.ScrollController? scrollController,
          _i18.FocusNode? focusNode,
          _i19.Subject<dynamic>? subject,
          _i12.StreamController<dynamic>? streamController,
          _i12.Timer? timer,
          _i12.FutureOr<dynamic>? Function()? custom}) =>
      super.noSuchMethod(
          Invocation.method(#addDisposable, [], {
            #disposable: disposable,
            #streamSubscription: streamSubscription,
            #textEditingController: textEditingController,
            #scrollController: scrollController,
            #focusNode: focusNode,
            #subject: subject,
            #streamController: streamController,
            #timer: timer,
            #custom: custom
          }),
          returnValueForMissingStub: null);
}

/// A class which mocks [PleromaApiAuthAccountService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPleromaApiAuthAccountService extends _i1.Mock
    implements _i20.PleromaApiAuthAccountService {
  MockPleromaApiAuthAccountService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get accountReportRelativeUrlPath =>
      (super.noSuchMethod(Invocation.getter(#accountReportRelativeUrlPath),
          returnValue: '') as String);
  @override
  _i2.IPleromaApiAuthRestService get authRestService =>
      (super.noSuchMethod(Invocation.getter(#authRestService),
              returnValue: _FakeIPleromaApiAuthRestService())
          as _i2.IPleromaApiAuthRestService);
  @override
  _i2.IPleromaApiAuthRestService get restApiAuthService =>
      (super.noSuchMethod(Invocation.getter(#restApiAuthService),
              returnValue: _FakeIPleromaApiAuthRestService())
          as _i2.IPleromaApiAuthRestService);
  @override
  bool get isPleroma =>
      (super.noSuchMethod(Invocation.getter(#isPleroma), returnValue: false)
          as bool);
  @override
  bool get isMastodon =>
      (super.noSuchMethod(Invocation.getter(#isMastodon), returnValue: false)
          as bool);
  @override
  _i4.IRestService get restService =>
      (super.noSuchMethod(Invocation.getter(#restService),
          returnValue: _FakeIRestService()) as _i4.IRestService);
  @override
  _i12.Stream<_i13.PleromaApiState> get pleromaApiStateStream =>
      (super.noSuchMethod(Invocation.getter(#pleromaApiStateStream),
              returnValue: Stream<_i13.PleromaApiState>.empty())
          as _i12.Stream<_i13.PleromaApiState>);
  @override
  _i13.PleromaApiState get pleromaApiState =>
      (super.noSuchMethod(Invocation.getter(#pleromaApiState),
          returnValue: _i13.PleromaApiState.validAuth) as _i13.PleromaApiState);
  @override
  _i12.Stream<bool> get isConnectedStream =>
      (super.noSuchMethod(Invocation.getter(#isConnectedStream),
          returnValue: Stream<bool>.empty()) as _i12.Stream<bool>);
  @override
  bool get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected), returnValue: false)
          as bool);
  @override
  bool get isDisposed =>
      (super.noSuchMethod(Invocation.getter(#isDisposed), returnValue: false)
          as bool);
  @override
  String get accountRelativeUrlPath =>
      (super.noSuchMethod(Invocation.getter(#accountRelativeUrlPath),
          returnValue: '') as String);
  @override
  String get pleromaAccountRelativeUrlPath =>
      (super.noSuchMethod(Invocation.getter(#pleromaAccountRelativeUrlPath),
          returnValue: '') as String);
  @override
  set isDisposed(bool? _isDisposed) =>
      super.noSuchMethod(Invocation.setter(#isDisposed, _isDisposed),
          returnValueForMissingStub: null);
  @override
  _i12.Future<List<_i5.IPleromaApiAccountRelationship>>
      getRelationshipWithAccounts({List<String>? remoteAccountIds}) => (super
              .noSuchMethod(
                  Invocation.method(#getRelationshipWithAccounts, [], {
                    #remoteAccountIds: remoteAccountIds
                  }),
                  returnValue:
                      Future<List<_i5.IPleromaApiAccountRelationship>>.value(
                          <_i5.IPleromaApiAccountRelationship>[]))
          as _i12.Future<List<_i5.IPleromaApiAccountRelationship>>);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> blockAccount(
          {String? accountRemoteId}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #blockAccount, [], {#accountRemoteId: accountRemoteId}),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> followAccount(
          {String? accountRemoteId}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #followAccount, [], {#accountRemoteId: accountRemoteId}),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> muteAccount(
          {String? accountRemoteId,
          bool? notifications,
          int? expireDurationInSeconds}) =>
      (super.noSuchMethod(
              Invocation.method(#muteAccount, [], {
                #accountRemoteId: accountRemoteId,
                #notifications: notifications,
                #expireDurationInSeconds: expireDurationInSeconds
              }),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> pinAccount(
          {String? accountRemoteId}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #pinAccount, [], {#accountRemoteId: accountRemoteId}),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> unBlockAccount(
          {String? accountRemoteId}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #unBlockAccount, [], {#accountRemoteId: accountRemoteId}),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> unFollowAccount(
          {String? accountRemoteId}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #unFollowAccount, [], {#accountRemoteId: accountRemoteId}),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> unMuteAccount(
          {String? accountRemoteId}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #unMuteAccount, [], {#accountRemoteId: accountRemoteId}),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> unPinAccount(
          {String? accountRemoteId}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #unPinAccount, [], {#accountRemoteId: accountRemoteId}),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<List<_i5.IPleromaApiAccountIdentityProof>>
      getAccountIdentifyProofs({String? accountRemoteId}) =>
          (super.noSuchMethod(
                  Invocation.method(#getAccountIdentifyProofs, [],
                      {#accountRemoteId: accountRemoteId}),
                  returnValue:
                      Future<List<_i5.IPleromaApiAccountIdentityProof>>.value(
                          <_i5.IPleromaApiAccountIdentityProof>[]))
              as _i12.Future<List<_i5.IPleromaApiAccountIdentityProof>>);
  @override
  _i12.Future<List<_i21.IPleromaApiList>> getListsWithAccount(
          {String? accountRemoteId}) =>
      (super.noSuchMethod(
          Invocation.method(
              #getListsWithAccount, [], {#accountRemoteId: accountRemoteId}),
          returnValue: Future<List<_i21.IPleromaApiList>>.value(
              <_i21.IPleromaApiList>[])) as _i12
          .Future<List<_i21.IPleromaApiList>>);
  @override
  _i12.Future<List<_i5.IPleromaApiAccount>> search(
          {String? query,
          bool? resolve,
          bool? following,
          _i14.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
              Invocation.method(#search, [], {
                #query: query,
                #resolve: resolve,
                #following: following,
                #pagination: pagination
              }),
              returnValue: Future<List<_i5.IPleromaApiAccount>>.value(
                  <_i5.IPleromaApiAccount>[]))
          as _i12.Future<List<_i5.IPleromaApiAccount>>);
  @override
  _i12.Future<dynamic> reportAccount(
          {_i5.IPleromaApiAccountReportRequest? reportRequest}) =>
      (super.noSuchMethod(
          Invocation.method(
              #reportAccount, [], {#reportRequest: reportRequest}),
          returnValue: Future<dynamic>.value()) as _i12.Future<dynamic>);
  @override
  _i12.Future<dynamic> blockDomain({String? domain}) => (super.noSuchMethod(
      Invocation.method(#blockDomain, [], {#domain: domain}),
      returnValue: Future<dynamic>.value()) as _i12.Future<dynamic>);
  @override
  _i12.Future<dynamic> unBlockDomain({String? domain}) => (super.noSuchMethod(
      Invocation.method(#unBlockDomain, [], {#domain: domain}),
      returnValue: Future<dynamic>.value()) as _i12.Future<dynamic>);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> subscribeAccount(
          {String? accountRemoteId}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #subscribeAccount, [], {#accountRemoteId: accountRemoteId}),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> unSubscribeAccount(
          {String? accountRemoteId}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #unSubscribeAccount, [], {#accountRemoteId: accountRemoteId}),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<dynamic> dispose() =>
      (super.noSuchMethod(Invocation.method(#dispose, []),
          returnValue: Future<dynamic>.value()) as _i12.Future<dynamic>);
  @override
  _i12.Future<List<_i5.IPleromaApiAccount>> getAccountFollowings(
          {String? accountRemoteId,
          bool? withRelationship,
          _i14.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
              Invocation.method(#getAccountFollowings, [], {
                #accountRemoteId: accountRemoteId,
                #withRelationship: withRelationship,
                #pagination: pagination
              }),
              returnValue: Future<List<_i5.IPleromaApiAccount>>.value(
                  <_i5.IPleromaApiAccount>[]))
          as _i12.Future<List<_i5.IPleromaApiAccount>>);
  @override
  _i12.Future<List<_i5.IPleromaApiAccount>> getAccountFollowers(
          {String? accountRemoteId,
          bool? withRelationship,
          _i14.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
              Invocation.method(#getAccountFollowers, [], {
                #accountRemoteId: accountRemoteId,
                #withRelationship: withRelationship,
                #pagination: pagination
              }),
              returnValue: Future<List<_i5.IPleromaApiAccount>>.value(
                  <_i5.IPleromaApiAccount>[]))
          as _i12.Future<List<_i5.IPleromaApiAccount>>);
  @override
  _i12.Future<List<_i22.IPleromaApiStatus>> getAccountStatuses(
          {String? accountRemoteId,
          String? tagged,
          bool? pinned,
          bool? excludeReplies,
          bool? excludeReblogs,
          List<String>? excludeVisibilities,
          bool? withMuted,
          bool? onlyWithMedia,
          _i14.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
              Invocation.method(#getAccountStatuses, [], {
                #accountRemoteId: accountRemoteId,
                #tagged: tagged,
                #pinned: pinned,
                #excludeReplies: excludeReplies,
                #excludeReblogs: excludeReblogs,
                #excludeVisibilities: excludeVisibilities,
                #withMuted: withMuted,
                #onlyWithMedia: onlyWithMedia,
                #pagination: pagination
              }),
              returnValue: Future<List<_i22.IPleromaApiStatus>>.value(
                  <_i22.IPleromaApiStatus>[]))
          as _i12.Future<List<_i22.IPleromaApiStatus>>);
  @override
  _i12.Future<List<_i22.IPleromaApiStatus>> getAccountFavouritedStatuses(
          {String? accountRemoteId,
          _i14.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
              Invocation.method(#getAccountFavouritedStatuses, [],
                  {#accountRemoteId: accountRemoteId, #pagination: pagination}),
              returnValue: Future<List<_i22.IPleromaApiStatus>>.value(
                  <_i22.IPleromaApiStatus>[]))
          as _i12.Future<List<_i22.IPleromaApiStatus>>);
  @override
  _i12.Future<_i5.IPleromaApiAccount> getAccount(
          {String? accountRemoteId, bool? withRelationship}) =>
      (super.noSuchMethod(
              Invocation.method(#getAccount, [], {
                #accountRemoteId: accountRemoteId,
                #withRelationship: withRelationship
              }),
              returnValue: Future<_i5.IPleromaApiAccount>.value(
                  _FakeIPleromaApiAccount()))
          as _i12.Future<_i5.IPleromaApiAccount>);
  @override
  void addDisposable(
          {_i15.IDisposable? disposable,
          _i12.StreamSubscription<dynamic>? streamSubscription,
          _i16.TextEditingController? textEditingController,
          _i17.ScrollController? scrollController,
          _i18.FocusNode? focusNode,
          _i19.Subject<dynamic>? subject,
          _i12.StreamController<dynamic>? streamController,
          _i12.Timer? timer,
          _i12.FutureOr<dynamic>? Function()? custom}) =>
      super.noSuchMethod(
          Invocation.method(#addDisposable, [], {
            #disposable: disposable,
            #streamSubscription: streamSubscription,
            #textEditingController: textEditingController,
            #scrollController: scrollController,
            #focusNode: focusNode,
            #subject: subject,
            #streamController: streamController,
            #timer: timer,
            #custom: custom
          }),
          returnValueForMissingStub: null);
}

/// A class which mocks [MyAccountBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockMyAccountBloc extends _i1.Mock implements _i23.MyAccountBloc {
  MockMyAccountBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.IMyAccountLocalPreferenceBloc get myAccountLocalPreferenceBloc =>
      (super.noSuchMethod(Invocation.getter(#myAccountLocalPreferenceBloc),
              returnValue: _FakeIMyAccountLocalPreferenceBloc())
          as _i6.IMyAccountLocalPreferenceBloc);
  @override
  _i7.IPleromaApiMyAccountService get pleromaMyAccountService =>
      (super.noSuchMethod(Invocation.getter(#pleromaMyAccountService),
              returnValue: _FakeIPleromaApiMyAccountService())
          as _i7.IPleromaApiMyAccountService);
  @override
  _i8.IAccountRepository get accountRepository =>
      (super.noSuchMethod(Invocation.getter(#accountRepository),
          returnValue: _FakeIAccountRepository()) as _i8.IAccountRepository);
  @override
  _i9.AuthInstance get instance =>
      (super.noSuchMethod(Invocation.getter(#instance),
          returnValue: _FakeAuthInstance()) as _i9.AuthInstance);
  @override
  bool get isLocalCacheExist =>
      (super.noSuchMethod(Invocation.getter(#isLocalCacheExist),
          returnValue: false) as bool);
  @override
  _i12.Stream<_i24.IMyAccount?> get myAccountStream =>
      (super.noSuchMethod(Invocation.getter(#myAccountStream),
              returnValue: Stream<_i24.IMyAccount?>.empty())
          as _i12.Stream<_i24.IMyAccount?>);
  @override
  _i12.Stream<_i10.IAccount> get accountStream =>
      (super.noSuchMethod(Invocation.getter(#accountStream),
              returnValue: Stream<_i10.IAccount>.empty())
          as _i12.Stream<_i10.IAccount>);
  @override
  _i10.IAccount get account => (super.noSuchMethod(Invocation.getter(#account),
      returnValue: _FakeIAccount()) as _i10.IAccount);
  @override
  _i5.IPleromaApiAccountRelationship get relationship =>
      (super.noSuchMethod(Invocation.getter(#relationship),
              returnValue: _FakeIPleromaApiAccountRelationship())
          as _i5.IPleromaApiAccountRelationship);
  @override
  _i12.Stream<_i5.IPleromaApiAccountRelationship> get relationshipStream =>
      (super.noSuchMethod(Invocation.getter(#relationshipStream),
              returnValue: Stream<_i5.IPleromaApiAccountRelationship>.empty())
          as _i12.Stream<_i5.IPleromaApiAccountRelationship>);
  @override
  _i25.InstanceLocation get instanceLocation =>
      (super.noSuchMethod(Invocation.getter(#instanceLocation),
          returnValue: _i25.InstanceLocation.local) as _i25.InstanceLocation);
  @override
  bool get isDisposed =>
      (super.noSuchMethod(Invocation.getter(#isDisposed), returnValue: false)
          as bool);
  @override
  set isDisposed(bool? _isDisposed) =>
      super.noSuchMethod(Invocation.setter(#isDisposed, _isDisposed),
          returnValueForMissingStub: null);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> toggleBlock() =>
      (super.noSuchMethod(Invocation.method(#toggleBlock, []),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> toggleFollow() =>
      (super.noSuchMethod(Invocation.method(#toggleFollow, []),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<dynamic> refreshFromNetwork({bool? isNeedPreFetchRelationship}) =>
      (super.noSuchMethod(
          Invocation.method(#refreshFromNetwork, [],
              {#isNeedPreFetchRelationship: isNeedPreFetchRelationship}),
          returnValue: Future<dynamic>.value()) as _i12.Future<dynamic>);
  @override
  bool checkAccountIsMe(_i10.IAccount? account) =>
      (super.noSuchMethod(Invocation.method(#checkAccountIsMe, [account]),
          returnValue: false) as bool);
  @override
  bool checkIsStatusFromMe(_i26.IStatus? status) =>
      (super.noSuchMethod(Invocation.method(#checkIsStatusFromMe, [status]),
          returnValue: false) as bool);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> togglePin() =>
      (super.noSuchMethod(Invocation.method(#togglePin, []),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> toggleBlockDomain() =>
      (super.noSuchMethod(Invocation.method(#toggleBlockDomain, []),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<dynamic> updateMyAccountByMyPleromaAccount(
          _i27.IPleromaApiMyAccount? pleromaMyAccount) =>
      (super.noSuchMethod(
          Invocation.method(
              #updateMyAccountByMyPleromaAccount, [pleromaMyAccount]),
          returnValue: Future<dynamic>.value()) as _i12.Future<dynamic>);
  @override
  _i12.Future<dynamic> updateMyAccountByMyAccount(_i24.IMyAccount? myAccount) =>
      (super.noSuchMethod(
          Invocation.method(#updateMyAccountByMyAccount, [myAccount]),
          returnValue: Future<dynamic>.value()) as _i12.Future<dynamic>);
  @override
  _i12.Future<dynamic> decreaseFollowingRequestCount() =>
      (super.noSuchMethod(Invocation.method(#decreaseFollowingRequestCount, []),
          returnValue: Future<dynamic>.value()) as _i12.Future<dynamic>);
  @override
  bool checkIsChatMessageFromMe(_i28.IChatMessage? chatMessage) => (super
      .noSuchMethod(Invocation.method(#checkIsChatMessageFromMe, [chatMessage]),
          returnValue: false) as bool);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> mute(
          {bool? notifications, Duration? duration}) =>
      (super.noSuchMethod(
          Invocation.method(
              #mute, [], {#notifications: notifications, #duration: duration}),
          returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
              _FakeIPleromaApiAccountRelationship())) as _i12
          .Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> unMute() =>
      (super.noSuchMethod(Invocation.method(#unMute, []),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> subscribe() =>
      (super.noSuchMethod(Invocation.method(#subscribe, []),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> toggleMute() =>
      (super.noSuchMethod(Invocation.method(#toggleMute, []),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> toggleSubscribe() =>
      (super.noSuchMethod(Invocation.method(#toggleSubscribe, []),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i12.Future<_i5.IPleromaApiAccountRelationship> unSubscribe() =>
      (super.noSuchMethod(Invocation.method(#unSubscribe, []),
              returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
                  _FakeIPleromaApiAccountRelationship()))
          as _i12.Future<_i5.IPleromaApiAccountRelationship>);
  @override
  void addDisposable(
          {_i15.IDisposable? disposable,
          _i12.StreamSubscription<dynamic>? streamSubscription,
          _i16.TextEditingController? textEditingController,
          _i17.ScrollController? scrollController,
          _i18.FocusNode? focusNode,
          _i19.Subject<dynamic>? subject,
          _i12.StreamController<dynamic>? streamController,
          _i12.Timer? timer,
          _i12.FutureOr<dynamic>? Function()? custom}) =>
      super.noSuchMethod(
          Invocation.method(#addDisposable, [], {
            #disposable: disposable,
            #streamSubscription: streamSubscription,
            #textEditingController: textEditingController,
            #scrollController: scrollController,
            #focusNode: focusNode,
            #subject: subject,
            #streamController: streamController,
            #timer: timer,
            #custom: custom
          }),
          returnValueForMissingStub: null);
  @override
  _i12.Future<dynamic> dispose() =>
      (super.noSuchMethod(Invocation.method(#dispose, []),
          returnValue: Future<dynamic>.value()) as _i12.Future<dynamic>);
}