import 'package:fedi/app/auth/instance/chooser/auth_instance_chooser_bloc.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/list/auth_instance_list_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:fediverse_api/fediverse_api.dart';

var _logger = Logger('auth_instance_chooser_bloc_impl.dart');

class UnifediApiAccessChooserBloc extends DisposableOwner
    implements IUnifediApiAccessChooserBloc {
  final IUnifediApiAccessListBloc instanceListBloc;

  final ICurrentUnifediApiAccessBloc currentInstanceBloc;

  UnifediApiAccessChooserBloc({
    required this.instanceListBloc,
    required this.currentInstanceBloc,
  });

  @override
  Future chooseInstance(UnifediApiAccess instance) =>
      currentInstanceBloc.changeCurrentInstance(instance);

  @override
  List<UnifediApiAccess> get instancesAvailableToChoose =>
      filterNotSelected(instanceListBloc.availableInstances).toList();

  @override
  Stream<List<UnifediApiAccess>> get instancesAvailableToChooseStream =>
      instanceListBloc.availableInstancesStream
          .map((availableInstances) => filterNotSelected(availableInstances));

  List<UnifediApiAccess> filterNotSelected(
    List<UnifediApiAccess> availableInstances,
  ) {
    var selectedInstance = this.selectedInstance;
    var filtered = availableInstances.where((instance) {
      return instance.userAtHost != selectedInstance!.userAtHost;
    }).toList();
    _logger.finest(() => 'filterNotSelected \n'
        '\t availableInstances = ${availableInstances.length} \n'
        '\t filtered = ${filtered.length} \n');

    return filtered;
  }

  @override
  UnifediApiAccess? get selectedInstance => currentInstanceBloc.currentInstance;

  @override
  Stream<UnifediApiAccess?> get selectedInstanceStream =>
      currentInstanceBloc.currentInstanceStream;

  @override
  Future removeInstance(UnifediApiAccess instance) =>
      instanceListBloc.removeInstance(instance);

  static UnifediApiAccessChooserBloc createFromContext(BuildContext context) =>
      UnifediApiAccessChooserBloc(
        instanceListBloc: IUnifediApiAccessListBloc.of(context, listen: false),
        currentInstanceBloc:
            ICurrentUnifediApiAccessBloc.of(context, listen: false),
      );
}
