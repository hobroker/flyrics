import 'package:flyrics/api/genius_lyrics_parser.dart';
import 'package:flyrics/models/lyrics_part.dart';
import 'package:test/test.dart';

const fragment =
    '''<p>[Intro]<br><a href="/Tool-forty-six-and-2-lyrics#note-1955046" data-id="1955046" class="referent referent--yellow" ng-click="open()" ng-class="{          'referent--linked_to_preview': song_ctrl.referent_has_preview(fragment_id),          'referent--linked_to_preview_active': song_ctrl.highlight_preview_referent(fragment_element_id),          'referent--purple_indicator': song_ctrl.show_preview_referent_indicator(fragment_element_id)        }" prevent-default-click="" annotation-fragment="1955046" on-hover-with-no-digest="set_current_hover_and_digest(hover ? fragment_id : undefined)" classification="accepted" image="false" pending-editorial-actions-count="0">My shadow's</a> shedding skin<br>I've been<br><a href="/Tool-forty-six-and-2-lyrics#note-1955071" data-id="1955071" class="referent referent--yellow" ng-click="open()" ng-class="{          'referent--linked_to_preview': song_ctrl.referent_has_preview(fragment_id),          'referent--linked_to_preview_active': song_ctrl.highlight_preview_referent(fragment_element_id),          'referent--purple_indicator': song_ctrl.show_preview_referent_indicator(fragment_element_id)        }" prevent-default-click="" annotation-fragment="1955071" on-hover-with-no-digest="set_current_hover_and_digest(hover ? fragment_id : undefined)" classification="accepted" image="false" pending-editorial-actions-count="0">I'm down<br>My old muscles</a><br>hello</p>''';

void main() {
  test('should return expected result', () {
    var parser = GeniusLyricsParser(fragment);
    var expected = [
      LyricsPart(text: '[Intro]', endsInNewLine: true),
      LyricsPart(
          annotationId: 1955046, text: "My shadow's", endsInNewLine: false),
      LyricsPart(text: ' shedding skin', endsInNewLine: true),
      LyricsPart(text: "I've been", endsInNewLine: true),
      LyricsPart(annotationId: 1955071, text: "I'm down", endsInNewLine: true),
      LyricsPart(
          annotationId: 1955071, text: 'My old muscles', endsInNewLine: true),
      LyricsPart(text: 'hello', endsInNewLine: true),
    ];

    expect(parser.parseParts(), equals(expected));
  });
}
