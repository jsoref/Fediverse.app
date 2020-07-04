import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc_impl.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_local_preference_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_local_preference_bloc_impl.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_bloc.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_bloc_impl.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_local_preference_bloc.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_local_preference_bloc_impl.dart';
import 'package:fedi/app/context/app_context_bloc.dart';
import 'package:fedi/app/push/handler/push_handler_bloc.dart';
import 'package:fedi/app/push/handler/push_handler_bloc_impl.dart';
import 'package:fedi/app/push/handler/unhandled/push_handler_unhandled_local_preferences_bloc.dart';
import 'package:fedi/app/push/handler/unhandled/push_handler_unhandled_local_preferences_bloc_impl.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/connection/connection_service_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/local_preferences/local_preferences_service_hive_impl.dart';
import 'package:fedi/permission/camera_permission_bloc.dart';
import 'package:fedi/permission/camera_permission_bloc_impl.dart';
import 'package:fedi/permission/mic_permission_bloc.dart';
import 'package:fedi/permission/mic_permission_bloc_impl.dart';
import 'package:fedi/permission/permissions_service.dart';
import 'package:fedi/permission/permissions_service_impl.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:fedi/permission/storage_permission_bloc_impl.dart';
import 'package:fedi/pleroma/oauth/pleroma_oauth_last_launched_host_to_login_local_preference_bloc.dart';
import 'package:fedi/pleroma/oauth/pleroma_oauth_last_launched_host_to_login_local_preference_bloc_impl.dart';
import 'package:fedi/provider/provider_context_bloc_impl.dart';
import 'package:fedi/push/fcm/fcm_push_service.dart';
import 'package:fedi/push/fcm/fcm_push_service_impl.dart';
import 'package:fedi/push/relay/push_relay_service.dart';
import 'package:fedi/push/relay/push_relay_service_impl.dart';
import 'package:fedi/websockets/websockets_service.dart';
import 'package:fedi/websockets/websockets_service_impl.dart';
import 'package:logging/logging.dart';
import 'package:package_info/package_info.dart';

var _logger = Logger("app_context_bloc_impl.dart");

class AppContextBloc extends ProviderContextBloc implements IAppContextBloc {
  @override
  Future internalAsyncInit() async {
    _logger.fine(() => "internalAsyncInit");

    var globalProviderService = this;

    var connectionService = ConnectionService();
    await globalProviderService
        .asyncInitAndRegister<IConnectionService>(connectionService);

    await globalProviderService
        .asyncInitAndRegister<IPermissionsService>(PermissionsService());

    var preferencesService = HiveLocalPreferencesService();
    await globalProviderService
        .asyncInitAndRegister<ILocalPreferencesService>(preferencesService);

    var cameraPermissionBloc = CameraPermissionBloc(globalProviderService.get<IPermissionsService>());
    await cameraPermissionBloc.checkPermissionStatus();
    await globalProviderService.asyncInitAndRegister<ICameraPermissionBloc>(
        cameraPermissionBloc);
    var micPermissionBloc = MicPermissionBloc(globalProviderService.get<IPermissionsService>());
    await micPermissionBloc.checkPermissionStatus();
    await globalProviderService.asyncInitAndRegister<IMicPermissionBloc>(
        micPermissionBloc);
    var storagePermissionBloc =
        StoragePermissionBloc(globalProviderService.get<IPermissionsService>());
    await storagePermissionBloc.checkPermissionStatus();
    await globalProviderService
        .asyncInitAndRegister<IStoragePermissionBloc>(storagePermissionBloc);

    var pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc =
        PleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc(
            preferencesService);
    await globalProviderService.asyncInitAndRegister<
            IPleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc>(
        pleromaOAuthLastLaunchedHostToLoginLocalPreferenceBloc);

    var instanceListLocalPreferenceBloc =
        AuthInstanceListLocalPreferenceBloc(preferencesService);
    await globalProviderService.asyncInitAndRegister<
        IAuthInstanceListLocalPreferenceBloc>(instanceListLocalPreferenceBloc);

    var instanceListBloc = AuthInstanceListBloc(
        instanceListLocalPreferenceBloc: instanceListLocalPreferenceBloc);
    await globalProviderService
        .asyncInitAndRegister<IAuthInstanceListBloc>(instanceListBloc);

    var currentInstanceLocalPreferenceBloc =
        CurrentAuthInstanceLocalPreferenceBloc(preferencesService);
    await globalProviderService
        .asyncInitAndRegister<ICurrentAuthInstanceLocalPreferenceBloc>(
            currentInstanceLocalPreferenceBloc);

    var currentInstanceBloc = CurrentAuthInstanceBloc(
        instanceListBloc: instanceListBloc,
        currentLocalPreferenceBloc: currentInstanceLocalPreferenceBloc);
    await globalProviderService
        .asyncInitAndRegister<ICurrentAuthInstanceBloc>(currentInstanceBloc);

    String pushRelayBaseUrl;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // different
    var packageName = packageInfo.packageName;
    if (packageName ==
        "com.fediverse"
            ".app2") {
      // test app2 push relay
      pushRelayBaseUrl = "http://161.35.139.75:3000/push/";
    } else if (packageName ==
        "com.fediverse"
            ".app") {
      // production app push relay
      pushRelayBaseUrl = "https://pushrelay3.your.org/push/";
    } else {
      throw "Invalid packageName $packageName";
    }
    var pushRelayService = PushRelayService(pushRelayBaseUrl: pushRelayBaseUrl);
    addDisposable(disposable: pushRelayService);
    await globalProviderService
        .asyncInitAndRegister<IPushRelayService>(pushRelayService);

    var fcmPushService = FcmPushService();
    await globalProviderService
        .asyncInitAndRegister<IFcmPushService>(fcmPushService);

    var pushHandlerUnhandledLocalPreferencesBloc =
        PushHandlerUnhandledLocalPreferencesBloc(preferencesService);

    await globalProviderService
        .asyncInitAndRegister<IPushHandlerUnhandledLocalPreferencesBloc>(
            pushHandlerUnhandledLocalPreferencesBloc);

    var pushHandlerBloc = PushHandlerBloc(
        currentInstanceBloc: currentInstanceBloc,
        instanceListBloc: instanceListBloc,
        unhandledLocalPreferencesBloc: pushHandlerUnhandledLocalPreferencesBloc,
        fcmPushService: fcmPushService);
    await globalProviderService
        .asyncInitAndRegister<IPushHandlerBloc>(pushHandlerBloc);

    var webSocketsService = WebSocketsService();
    await globalProviderService
        .asyncInitAndRegister<IWebSocketsService>(webSocketsService);
  }
}
