import 'package:json_annotation/json_annotation.dart';

part 'log_entry.g.dart';

enum LogType { info, error, warning }

@JsonSerializable(nullable: false)
class LogEntry {
  final LogType type;
  final String message;
  final DateTime dateTime;
  final dynamic extra;

  LogEntry({
    this.type,
    this.message,
    this.dateTime,
    this.extra,
  });

  Map<String, dynamic> toJson() => _$LogEntryToJson(this);
}
