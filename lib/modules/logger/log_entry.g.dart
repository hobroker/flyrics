// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogEntry _$LogEntryFromJson(Map json) {
  return LogEntry(
    type: _$enumDecode(_$LogTypeEnumMap, json['type']),
    message: json['message'] as String,
    dateTime: DateTime.parse(json['dateTime'] as String),
    extra: json['extra'],
  );
}

Map<String, dynamic> _$LogEntryToJson(LogEntry instance) => <String, dynamic>{
      'type': _$LogTypeEnumMap[instance.type],
      'message': instance.message,
      'dateTime': instance.dateTime.toIso8601String(),
      'extra': instance.extra,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

const _$LogTypeEnumMap = {
  LogType.info: 'info',
  LogType.error: 'error',
  LogType.warning: 'warning',
};
