import 'package:fedi/refactored/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/current/current_auth_instance_local_preference_bloc.dart';
import 'package:fedi/refactored/app/auth/instance/list/auth_instance_list_bloc.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("current_auth_instance_bloc_impl.dart");

class CurrentAuthInstanceBloc extends DisposableOwner
    implements ICurrentAuthInstanceBloc {
  final IAuthInstanceListBloc instanceListBloc;
  final ICurrentAuthInstanceLocalPreferenceBloc
      currentInstanceLocalPreferenceBloc;

  CurrentAuthInstanceBloc({
    @required this.instanceListBloc,
    @required this.currentInstanceLocalPreferenceBloc,
  });

  @override
  AuthInstance get currentInstance => currentInstanceLocalPreferenceBloc.value;

  @override
  Stream<AuthInstance> get currentInstanceStream =>
      currentInstanceLocalPreferenceBloc.stream;

  @override
  changeCurrentInstance(AuthInstance instance) {
    _logger.finest(() => "changeCurrentInstance $instance");
    if (!instanceListBloc.availableInstances.contains(instance)) {
      instanceListBloc.addInstance(instance);
    }

    currentInstanceLocalPreferenceBloc.setValue(instance);
  }

  @override
  bool isCurrentInstance(AuthInstance instance) => currentInstance == instance;

  @override
  Future logoutCurrentInstance() async {
    _logger.finest(() => "logoutCurrentInstance $currentInstance");
    instanceListBloc.removeInstance(currentInstance);
    await currentInstanceLocalPreferenceBloc.setValue(null);
  }
}