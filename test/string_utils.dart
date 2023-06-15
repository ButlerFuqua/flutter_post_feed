import 'package:flutter_post_feed/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  group('#getDisplayDate', () {
    test('Returns a string displaying the date', () {
      var displayString = getDisplayDate(DateTime(2000));
      expect(displayString is String, true);
    });
    test('Returns a string in expected format', () {
      var displayString = getDisplayDate(DateTime(2000));
      expect(displayString, 'January 1, 2000');
    });
  });
}
