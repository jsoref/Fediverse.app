// Mocks generated by Mockito 5.0.10 from annotations
// in fedi/test/app/chat/chat_bloc_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;

import 'package:base_fediverse_api/src/rest/rest_service.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:pleroma_fediverse_api/src/pleroma/api/account/my/pleroma_api_my_account_model.dart'
    as _i4;
import 'package:pleroma_fediverse_api/src/pleroma/api/account/my/pleroma_api_my_account_service.dart'
    as _i10;
import 'package:pleroma_fediverse_api/src/pleroma/api/account/pleroma_api_account_model.dart'
    as _i5;
import 'package:pleroma_fediverse_api/src/pleroma/api/chat/pleroma_api_chat_model.dart'
    as _i3;
import 'package:pleroma_fediverse_api/src/pleroma/api/chat/pleroma_api_chat_service.dart'
    as _i6;
import 'package:pleroma_fediverse_api/src/pleroma/api/pagination/pleroma_api_pagination_model.dart'
    as _i9;
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart'
    as _i8;
import 'package:pleroma_fediverse_api/src/pleroma/api/status/pleroma_api_status_model.dart'
    as _i11;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeIRestService extends _i1.Fake implements _i2.IRestService {}

class _FakeIPleromaApiChat extends _i1.Fake implements _i3.IPleromaApiChat {}

class _FakeIPleromaApiChatMessage extends _i1.Fake
    implements _i3.IPleromaApiChatMessage {}

class _FakeIPleromaApiMyAccount extends _i1.Fake
    implements _i4.IPleromaApiMyAccount {}

class _FakeIPleromaApiAccountRelationship extends _i1.Fake
    implements _i5.IPleromaApiAccountRelationship {}

/// A class which mocks [IPleromaApiChatService].
///
/// See the documentation for Mockito's code generation for more information.
class MockIPleromaApiChatService extends _i1.Mock
    implements _i6.IPleromaApiChatService {
  MockIPleromaApiChatService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isPleroma =>
      (super.noSuchMethod(Invocation.getter(#isPleroma), returnValue: false)
          as bool);
  @override
  bool get isMastodon =>
      (super.noSuchMethod(Invocation.getter(#isMastodon), returnValue: false)
          as bool);
  @override
  _i2.IRestService get restService =>
      (super.noSuchMethod(Invocation.getter(#restService),
          returnValue: _FakeIRestService()) as _i2.IRestService);
  @override
  _i7.Stream<_i8.PleromaApiState> get pleromaApiStateStream =>
      (super.noSuchMethod(Invocation.getter(#pleromaApiStateStream),
              returnValue: Stream<_i8.PleromaApiState>.empty())
          as _i7.Stream<_i8.PleromaApiState>);
  @override
  _i8.PleromaApiState get pleromaApiState =>
      (super.noSuchMethod(Invocation.getter(#pleromaApiState),
          returnValue: _i8.PleromaApiState.validAuth) as _i8.PleromaApiState);
  @override
  _i7.Stream<bool> get isConnectedStream =>
      (super.noSuchMethod(Invocation.getter(#isConnectedStream),
          returnValue: Stream<bool>.empty()) as _i7.Stream<bool>);
  @override
  bool get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected), returnValue: false)
          as bool);
  @override
  bool get isDisposed =>
      (super.noSuchMethod(Invocation.getter(#isDisposed), returnValue: false)
          as bool);
  @override
  _i7.Future<List<_i3.IPleromaApiChat>> getChats(
          {_i9.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
              Invocation.method(#getChats, [], {#pagination: pagination}),
              returnValue: Future<List<_i3.IPleromaApiChat>>.value(
                  <_i3.IPleromaApiChat>[]))
          as _i7.Future<List<_i3.IPleromaApiChat>>);
  @override
  _i7.Future<List<_i3.IPleromaApiChatMessage>> getChatMessages(
          {String? chatId, _i9.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
          Invocation.method(
              #getChatMessages, [], {#chatId: chatId, #pagination: pagination}),
          returnValue: Future<List<_i3.IPleromaApiChatMessage>>.value(
              <_i3.IPleromaApiChatMessage>[])) as _i7
          .Future<List<_i3.IPleromaApiChatMessage>>);
  @override
  _i7.Future<_i3.IPleromaApiChat> markChatAsRead(
          {String? chatId, String? lastReadChatMessageId}) =>
      (super.noSuchMethod(
              Invocation.method(#markChatAsRead, [], {
                #chatId: chatId,
                #lastReadChatMessageId: lastReadChatMessageId
              }),
              returnValue:
                  Future<_i3.IPleromaApiChat>.value(_FakeIPleromaApiChat()))
          as _i7.Future<_i3.IPleromaApiChat>);
  @override
  _i7.Future<_i3.IPleromaApiChat> getChat({String? id}) =>
      (super.noSuchMethod(Invocation.method(#getChat, [], {#id: id}),
              returnValue:
                  Future<_i3.IPleromaApiChat>.value(_FakeIPleromaApiChat()))
          as _i7.Future<_i3.IPleromaApiChat>);
  @override
  _i7.Future<_i3.IPleromaApiChat> getOrCreateChatByAccountId(
          {String? accountId}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #getOrCreateChatByAccountId, [], {#accountId: accountId}),
              returnValue:
                  Future<_i3.IPleromaApiChat>.value(_FakeIPleromaApiChat()))
          as _i7.Future<_i3.IPleromaApiChat>);
  @override
  _i7.Future<_i3.IPleromaApiChatMessage> sendMessage(
          {String? chatId, _i3.IPleromaApiChatMessageSendData? data}) =>
      (super.noSuchMethod(
          Invocation.method(#sendMessage, [], {#chatId: chatId, #data: data}),
          returnValue: Future<_i3.IPleromaApiChatMessage>.value(
              _FakeIPleromaApiChatMessage())) as _i7
          .Future<_i3.IPleromaApiChatMessage>);
  @override
  _i7.Future<dynamic> deleteChatMessage(
          {String? chatMessageRemoteId, String? chatId}) =>
      (super.noSuchMethod(
          Invocation.method(#deleteChatMessage, [],
              {#chatMessageRemoteId: chatMessageRemoteId, #chatId: chatId}),
          returnValue: Future<dynamic>.value()) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> dispose() =>
      (super.noSuchMethod(Invocation.method(#dispose, []),
          returnValue: Future<dynamic>.value()) as _i7.Future<dynamic>);
}

/// A class which mocks [IPleromaApiMyAccountService].
///
/// See the documentation for Mockito's code generation for more information.
class MockIPleromaApiMyAccountService extends _i1.Mock
    implements _i10.IPleromaApiMyAccountService {
  MockIPleromaApiMyAccountService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IRestService get restService =>
      (super.noSuchMethod(Invocation.getter(#restService),
          returnValue: _FakeIRestService()) as _i2.IRestService);
  @override
  _i7.Stream<_i8.PleromaApiState> get pleromaApiStateStream =>
      (super.noSuchMethod(Invocation.getter(#pleromaApiStateStream),
              returnValue: Stream<_i8.PleromaApiState>.empty())
          as _i7.Stream<_i8.PleromaApiState>);
  @override
  _i8.PleromaApiState get pleromaApiState =>
      (super.noSuchMethod(Invocation.getter(#pleromaApiState),
          returnValue: _i8.PleromaApiState.validAuth) as _i8.PleromaApiState);
  @override
  _i7.Stream<bool> get isConnectedStream =>
      (super.noSuchMethod(Invocation.getter(#isConnectedStream),
          returnValue: Stream<bool>.empty()) as _i7.Stream<bool>);
  @override
  bool get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected), returnValue: false)
          as bool);
  @override
  bool get isDisposed =>
      (super.noSuchMethod(Invocation.getter(#isDisposed), returnValue: false)
          as bool);
  @override
  _i7.Future<_i4.IPleromaApiMyAccount> updateCredentials(
          _i4.IPleromaApiMyAccountEdit? accountEditData) =>
      (super.noSuchMethod(
              Invocation.method(#updateCredentials, [accountEditData]),
              returnValue: Future<_i4.IPleromaApiMyAccount>.value(
                  _FakeIPleromaApiMyAccount()))
          as _i7.Future<_i4.IPleromaApiMyAccount>);
  @override
  _i7.Future<_i4.IPleromaApiMyAccount> updateFiles(
          _i4.PleromaApiMyAccountFilesRequest? accountFilesRequest) =>
      (super.noSuchMethod(
              Invocation.method(#updateFiles, [accountFilesRequest]),
              returnValue: Future<_i4.IPleromaApiMyAccount>.value(
                  _FakeIPleromaApiMyAccount()))
          as _i7.Future<_i4.IPleromaApiMyAccount>);
  @override
  _i7.Future<_i4.IPleromaApiMyAccount> verifyCredentials() =>
      (super.noSuchMethod(Invocation.method(#verifyCredentials, []),
              returnValue: Future<_i4.IPleromaApiMyAccount>.value(
                  _FakeIPleromaApiMyAccount()))
          as _i7.Future<_i4.IPleromaApiMyAccount>);
  @override
  _i7.Future<List<String>> getDomainBlocks(
          {_i9.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
          Invocation.method(#getDomainBlocks, [], {#pagination: pagination}),
          returnValue:
              Future<List<String>>.value(<String>[])) as _i7
          .Future<List<String>>);
  @override
  _i7.Future<List<_i5.IPleromaApiAccount>> getAccountBlocks(
          {_i9.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
          Invocation.method(#getAccountBlocks, [], {#pagination: pagination}),
          returnValue: Future<List<_i5.IPleromaApiAccount>>.value(
              <_i5.IPleromaApiAccount>[])) as _i7
          .Future<List<_i5.IPleromaApiAccount>>);
  @override
  _i7.Future<List<_i5.IPleromaApiAccount>> getAccountMutes(
          {_i9.IPleromaApiPaginationRequest? pagination,
          bool? withRelationship}) =>
      (super.noSuchMethod(
              Invocation.method(#getAccountMutes, [], {
                #pagination: pagination,
                #withRelationship: withRelationship
              }),
              returnValue: Future<List<_i5.IPleromaApiAccount>>.value(
                  <_i5.IPleromaApiAccount>[]))
          as _i7.Future<List<_i5.IPleromaApiAccount>>);
  @override
  _i7.Future<List<_i11.IPleromaApiStatus>> getBookmarks(
          {_i9.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
              Invocation.method(#getBookmarks, [], {#pagination: pagination}),
              returnValue: Future<List<_i11.IPleromaApiStatus>>.value(
                  <_i11.IPleromaApiStatus>[]))
          as _i7.Future<List<_i11.IPleromaApiStatus>>);
  @override
  _i7.Future<List<_i11.IPleromaApiStatus>> getFavourites(
          {_i9.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
              Invocation.method(#getFavourites, [], {#pagination: pagination}),
              returnValue: Future<List<_i11.IPleromaApiStatus>>.value(
                  <_i11.IPleromaApiStatus>[]))
          as _i7.Future<List<_i11.IPleromaApiStatus>>);
  @override
  _i7.Future<List<_i5.IPleromaApiAccount>> getFollowRequests(
          {_i9.IPleromaApiPaginationRequest? pagination}) =>
      (super.noSuchMethod(
          Invocation.method(#getFollowRequests, [], {#pagination: pagination}),
          returnValue: Future<List<_i5.IPleromaApiAccount>>.value(
              <_i5.IPleromaApiAccount>[])) as _i7
          .Future<List<_i5.IPleromaApiAccount>>);
  @override
  _i7.Future<_i5.IPleromaApiAccountRelationship> acceptFollowRequest(
          {String? accountRemoteId}) =>
      (super.noSuchMethod(
          Invocation.method(
              #acceptFollowRequest, [], {#accountRemoteId: accountRemoteId}),
          returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
              _FakeIPleromaApiAccountRelationship())) as _i7
          .Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i7.Future<_i5.IPleromaApiAccountRelationship> rejectFollowRequest(
          {String? accountRemoteId}) =>
      (super.noSuchMethod(
          Invocation.method(
              #rejectFollowRequest, [], {#accountRemoteId: accountRemoteId}),
          returnValue: Future<_i5.IPleromaApiAccountRelationship>.value(
              _FakeIPleromaApiAccountRelationship())) as _i7
          .Future<_i5.IPleromaApiAccountRelationship>);
  @override
  _i7.Future<dynamic> dispose() =>
      (super.noSuchMethod(Invocation.method(#dispose, []),
          returnValue: Future<dynamic>.value()) as _i7.Future<dynamic>);
}
