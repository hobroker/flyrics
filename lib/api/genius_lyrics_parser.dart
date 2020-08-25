import 'package:flutter/foundation.dart';
import 'package:html/parser.dart';

bool _isNumeric(String str) {
  if (str == null) {
    return false;
  }
  return double.tryParse(str) != null;
}

class GeniusLyricsParser {
  final String html;

  GeniusLyricsParser(this.html);

  List<LyricsPart> parseParts() {
    var $fragment = parseFragment(html.replaceAll('<br>', '\n'));
    var map = _findAnnotations($fragment);

    var list = <LyricsPart>[];

    $fragment.text.split(RegExp(r'___', multiLine: true)).forEach((item) {
      LyricsPart part;
      if (!_isNumeric(item)) {
        part = LyricsPart(text: item);
      } else {
        part = map[item];
      }

      var splits = part.text.split('\n');
      if (splits.length == 1) {
        list.add(part);
      } else {
        splits.where((element) => element.isNotEmpty).forEach((String element) {
          list.add(part.copyWith(
            text: element,
            endsInNewLine: true,
          ));
        });
      }
    });

    return list;
  }

  Map<String, LyricsPart> _findAnnotations(fragment) {
    var map = <String, LyricsPart>{};

    fragment.querySelectorAll('a').forEach(($a) {
      var annotationId = $a.attributes['data-id'];
      map[annotationId] = LyricsPart(
        text: $a.text,
        annotationId: int.parse(annotationId),
      );
      $a.innerHtml = '___${annotationId}___';
    });

    return map;
  }
}

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

  bool get hasAnnotation => annotationId != null;

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
