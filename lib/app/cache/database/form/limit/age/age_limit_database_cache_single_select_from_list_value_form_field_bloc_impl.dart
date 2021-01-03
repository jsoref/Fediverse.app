import 'package:fedi/app/cache/database/database_cache_model.dart';
import 'package:fedi/app/cache/database/form/limit/age/age_limit_database_cache_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:flutter/material.dart';

class AgeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc
    extends SingleSelectFromListValueFormFieldBloc<DatabaseCacheAgeLimitType>
    implements IAgeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc {
  AgeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc({
    bool isNullValuePossible = false,
    @required DatabaseCacheAgeLimitType originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<DatabaseCacheAgeLimitType>> validators =
        const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );

  @override
  List<DatabaseCacheAgeLimitType> get possibleValues =>
      DatabaseCacheAgeLimitType.values;
}
