// Mocks generated by Mockito 5.0.5 from annotations
// in fedi/test/app/account/my/my_account_bloc_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:fedi/disposable/disposable.dart' as _i11;
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_model.dart'
    as _i3;
import 'package:fedi/pleroma/api/account/my/pleroma_api_my_account_service_impl.dart'
    as _i5;
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart' as _i4;
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart'
    as _i10;
import 'package:fedi/pleroma/api/pleroma_api_service.dart' as _i7;
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart'
    as _i2;
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart' as _i9;
import 'package:flutter/src/widgets/editable_text.dart' as _i12;
import 'package:flutter/src/widgets/focus_manager.dart' as _i14;
import 'package:flutter/src/widgets/scroll_controller.dart' as _i13;
import 'package:http/src/response.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:rxdart/src/subjects/subject.dart' as _i15;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeIPleromaApiAuthRestService extends _i1.Fake
    implements _i2.IPleromaApiAuthRestService {}

class _FakeIPleromaApiMyAccount extends _i1.Fake
    implements _i3.IPleromaApiMyAccount {}

class _FakeIPleromaApiAccountRelationship extends _i1.Fake
    implements _i4.IPleromaApiAccountRelationship {}

/// A class which mocks [PleromaApiMyAccountService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPleromaApiMyAccountService extends _i1.Mock
    implements _i5.PleromaApiMyAccountService {
  MockPleromaApiMyAccountService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get verifyProfileRelativeUrlPath =>
      (super.noSuchMethod(Invocation.getter(#verifyProfileRelativeUrlPath),
          returnValue: '') as String);
  @override
  String get editProfileRelativeUrlPath =>
      (super.noSuchMethod(Invocation.getter(#editProfileRelativeUrlPath),
          returnValue: '') as String);
  @override
  _i2.IPleromaApiAuthRestService get restService =>
      (super.noSuchMethod(Invocation.getter(#restService),
              returnValue: _FakeIPleromaApiAuthRestService())
          as _i2.IPleromaApiAuthRestService);
  @override
  _i6.Stream<_i7.PleromaApiState> get pleromaApiStateStream =>
      (super.noSuchMethod(Invocation.getter(#pleromaApiStateStream),
              returnValue: Stream<_i7.PleromaApiState>.empty())
          as _i6.Stream<_i7.PleromaApiState>);
  @override
  _i7.PleromaApiState get pleromaApiState =>
      (super.noSuchMethod(Invocation.getter(#pleromaApiState),
          returnValue: _i7.PleromaApiState.validAuth) as _i7.PleromaApiState);
  @override
  bool get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected), returnValue: false)
          as bool);
  @override
  _i6.Stream<bool> get isConnectedStream =>
      (super.noSuchMethod(Invocation.getter(#isConnectedStream),
          returnValue: Stream<bool>.empty()) as _i6.Stream<bool>);
  @override
  bool get isDisposed =>
      (super.noSuchMethod(Invocation.getter(#isDisposed), returnValue: false)
          as bool);
  @override
  set isDisposed(bool? _isDisposed) =>
      super.noSuchMethod(Invocation.setter(#isDisposed, _isDisposed),
          returnValueForMissingStub: null);
  @override
  _i3.IPleromaApiMyAccount parseMyAccountResponse(_i8.Response? httpResponse) =>
      (super.noSuchMethod(
              Invocation.method(#parseMyAccountResponse, [httpResponse]),
              returnValue: _FakeIPleromaApiMyAccount())
          as _i3.IPleromaApiMyAccount);
  @override
  _i4.IPleromaApiAccountRelationship parseAccountRelationshipResponse(
          _i8.Response? httpResponse) =>
      (super.noSuchMethod(
          Invocation.method(#parseAccountRelationshipResponse, [httpResponse]),
          returnValue:
              _FakeIPleromaApiAccountRelationship()) as _i4
          .IPleromaApiAccountRelationship);
  @override
  List<_i9.IPleromaApiStatus> parseStatusListResponse(
          _i8.Response? httpResponse) =>
      (super.noSuchMethod(
              Invocation.method(#parseStatusListResponse, [httpResponse]),
              returnValue: <_i9.IPleromaApiStatus>[])
          as List<_i9.IPleromaApiStatus>);
  @override
  List<_i4.IPleromaApiAccount> parseAccountListResponse(
          _i8.Response? httpResponse) =>
      (super.noSuchMethod(
              Invocation.method(#parseAccountListResponse, [httpResponse]),
              returnValue: <_i4.IPleromaApiAccount>[])
          as List<_i4.IPleromaApiAccount>);
  @override
  List<String> parseStringListResponse(_i8.Response? httpResponse) => (super
      .noSuchMethod(Invocation.method(#parseStringListResponse, [httpResponse]),
          returnValue: <String>[]) as List<String>);
  @override
  _i6.Future<_i3.IPleromaApiMyAccount> updateCredentials(
          _i3.IPleromaApiMyAccountEdit? data) =>
      (super.noSuchMethod(Invocation.method(#updateCredentials, [data]),
              returnValue: Future<_i3.IPleromaApiMyAccount>.value(
                  _FakeIPleromaApiMyAccount()))
          as _i6.Future<_i3.IPleromaApiMyAccount>);
  @override
  _i6.Future<_i3.IPleromaApiMyAccount> updateFiles(
          _i3.PleromaApiMyAccountFilesRequest? accountFiles) =>
      (super.noSuchMethod(Invocation.method(#updateFiles, [accountFiles]),
              returnValue: Future<_i3.IPleromaApiMyAccount>.value(
                  _FakeIPleromaApiMyAccount()))
          as _i6.Future<_i3.IPleromaApiMyAccount>);
  @override
  _i6.Future<_i3.IPleromaApiMyAccount> verifyCredentials() =>
      (super.noSuchMethod(Invocation.method(#verifyCredentials, []),
              returnValue: Future<_i3.IPleromaApiMyAccount>.value(
                  _FakeIPleromaApiMyAccount()))
          as _i6.Future<_i3.IPleromaApiMyAccount>);
  @override
  _i6.Future<List<_i9.IPleromaApiStatus>> getBookmarks(
          {_i10.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
              Invocation.method(#getBookmarks, [], {#pagination: pagination}),
              returnValue: Future<List<_i9.IPleromaApiStatus>>.value(
                  <_i9.IPleromaApiStatus>[]))
          as _i6.Future<List<_i9.IPleromaApiStatus>>);
  @override
  _i6.Future<List<_i9.IPleromaApiStatus>> getFavourites(
          {_i10.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
              Invocation.method(#getFavourites, [], {#pagination: pagination}),
              returnValue: Future<List<_i9.IPleromaApiStatus>>.value(
                  <_i9.IPleromaApiStatus>[]))
          as _i6.Future<List<_i9.IPleromaApiStatus>>);
  @override
  _i6.Future<List<_i4.IPleromaApiAccount>> getFollowRequests(
          {_i10.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
          Invocation.method(#getFollowRequests, [], {#pagination: pagination}),
          returnValue: Future<List<_i4.IPleromaApiAccount>>.value(
              <_i4.IPleromaApiAccount>[])) as _i6
          .Future<List<_i4.IPleromaApiAccount>>);
  @override
  _i6.Future<dynamic> dispose() =>
      (super.noSuchMethod(Invocation.method(#dispose, []),
          returnValue: Future<dynamic>.value(null)) as _i6.Future<dynamic>);
  @override
  _i6.Future<_i4.IPleromaApiAccountRelationship> acceptFollowRequest(
          {String? accountRemoteId}) =>
      (super.noSuchMethod(
          Invocation.method(
              #acceptFollowRequest, [], {#accountRemoteId: accountRemoteId}),
          returnValue: Future<_i4.IPleromaApiAccountRelationship>.value(
              _FakeIPleromaApiAccountRelationship())) as _i6
          .Future<_i4.IPleromaApiAccountRelationship>);
  @override
  _i6.Future<_i4.IPleromaApiAccountRelationship> rejectFollowRequest(
          {String? accountRemoteId}) =>
      (super.noSuchMethod(
          Invocation.method(
              #rejectFollowRequest, [], {#accountRemoteId: accountRemoteId}),
          returnValue: Future<_i4.IPleromaApiAccountRelationship>.value(
              _FakeIPleromaApiAccountRelationship())) as _i6
          .Future<_i4.IPleromaApiAccountRelationship>);
  @override
  _i6.Future<List<String>> getDomainBlocks(
          {_i10.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
          Invocation.method(#getDomainBlocks, [], {#pagination: pagination}),
          returnValue:
              Future<List<String>>.value(<String>[])) as _i6
          .Future<List<String>>);
  @override
  _i6.Future<List<_i4.IPleromaApiAccount>> getAccountBlocks(
          {_i10.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
          Invocation.method(#getAccountBlocks, [], {#pagination: pagination}),
          returnValue: Future<List<_i4.IPleromaApiAccount>>.value(
              <_i4.IPleromaApiAccount>[])) as _i6
          .Future<List<_i4.IPleromaApiAccount>>);
  @override
  _i6.Future<List<_i4.IPleromaApiAccount>> getAccountMutes(
          {_i10.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
          Invocation.method(#getAccountMutes, [], {#pagination: pagination}),
          returnValue: Future<List<_i4.IPleromaApiAccount>>.value(
              <_i4.IPleromaApiAccount>[])) as _i6
          .Future<List<_i4.IPleromaApiAccount>>);
  @override
  void addDisposable(
          {_i11.IDisposable? disposable,
          _i6.StreamSubscription<dynamic>? streamSubscription,
          _i12.TextEditingController? textEditingController,
          _i13.ScrollController? scrollController,
          _i14.FocusNode? focusNode,
          _i15.Subject<dynamic>? subject,
          _i6.StreamController<dynamic>? streamController,
          _i6.Timer? timer,
          _i6.FutureOr<dynamic>? Function()? custom}) =>
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
