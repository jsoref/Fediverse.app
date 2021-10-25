// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_instance_activity_item_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiInstanceActivityItemAdapter
    extends TypeAdapter<PleromaApiInstanceActivityItem> {
  @override
  final int typeId = 0;

  @override
  PleromaApiInstanceActivityItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiInstanceActivityItem(
      logins: fields[0] as int,
      registrations: fields[1] as int,
      statuses: fields[2] as int,
      week: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiInstanceActivityItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.week)
      ..writeByte(2)
      ..write(obj.statuses)
      ..writeByte(0)
      ..write(obj.logins)
      ..writeByte(1)
      ..write(obj.registrations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstanceActivityItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiInstanceActivityItem _$$_PleromaApiInstanceActivityItemFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiInstanceActivityItem(
      logins: JsonParseHelper.fromStringToInt(json['logins'] as String),
      registrations:
          JsonParseHelper.fromStringToInt(json['registrations'] as String),
      statuses: JsonParseHelper.fromStringToInt(json['statuses'] as String),
      week: JsonParseHelper.fromStringToInt(json['week'] as String),
    );

Map<String, dynamic> _$$_PleromaApiInstanceActivityItemToJson(
    _$_PleromaApiInstanceActivityItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logins', JsonParseHelper.toStringFromInt(instance.logins));
  writeNotNull(
      'registrations', JsonParseHelper.toStringFromInt(instance.registrations));
  writeNotNull('statuses', JsonParseHelper.toStringFromInt(instance.statuses));
  writeNotNull('week', JsonParseHelper.toStringFromInt(instance.week));
  return val;
}
