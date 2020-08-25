import 'package:flutter/foundation.dart';

@immutable
class LyricsPart {
  final String html;
  final String text;
  final int annotationId;
  final bool endsInNewLine;

  LyricsPart({
    this.html,
    this.text,
    this.annotationId,
    this.endsInNewLine = false,
  });

  LyricsPart copyWith({
    html,
    text,
    annotationId,
    endsInNewLine,
  }) {
    return LyricsPart(
      html: html ?? this.html,
      text: text ?? this.text,
      annotationId: annotationId ?? this.annotationId,
      endsInNewLine: endsInNewLine ?? this.endsInNewLine,
    );
  }

  @override
  String toString() {
    return '$annotationId/$text/${endsInNewLine ? '\$' : ''}';
  }

  @override
  bool operator ==(other) {
    return other is LyricsPart &&
        other.html == html &&
        other.text == text &&
        other.endsInNewLine == endsInNewLine &&
        other.annotationId == annotationId;
  }

  @override
  int get hashCode => super.hashCode;
}
