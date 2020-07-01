import 'package:fedi/ui/form/group/form_group_bloc.dart';
import 'package:fedi/ui/form/form_item_bloc.dart';

abstract class IFormOneTypeGroupBloc<T extends IFormItemBloc>
    extends IFormGroupBloc<T> {
  void addNewEmptyField();

  void removeField(T field);

  int get maximumFieldsCount;

  bool get isMaximumFieldsCountReached;

  Stream<bool> get isMaximumFieldsCountReachedStream;
}