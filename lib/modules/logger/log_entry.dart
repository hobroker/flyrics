import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'log_entry.g.dart';

enum LogType { info, error, warning }

@immutable
@JsonSerializable(nullable: false)
class LogEntry {
  final LogType type;
  final String message;
  final DateTime dateTime;
  final dynamic extra;

  const LogEntry({
    this.type,
    this.message,
    this.dateTime,
    this.extra,
  });

  factory LogEntry.fromJson(Map json) => _$LogEntryFromJson(json);

  Map toJson() => _$LogEntryToJson(this);
}
