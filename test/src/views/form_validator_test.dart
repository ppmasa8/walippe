import 'package:flutter_test/flutter_test.dart';
import 'package:walippe/src/const/const.dart';
import 'package:walippe/src/views/form_validator.dart';

void main() {
  group('FormValidator', () {
    final formValidator = FormValidator();

    test('validateGroupName returns error message for null or empty input', () {
      expect(formValidator.validateGroupName(null), validGroupNameMessage);
      expect(formValidator.validateGroupName(''), validGroupNameMessage);
    });

    test('validateGroupName returns null for non-empty input', () {
      expect(formValidator.validateGroupName('Group Name'), null);
    });

    test('validateMemberName returns error message for null or empty input', () {
      expect(formValidator.validateMemberName(null), validMemberNameMessage);
      expect(formValidator.validateMemberName(''), validMemberNameMessage);
    });

    test('validateMemberName returns null for non-empty input', () {
      expect(formValidator.validateMemberName('Member Name'), null);
    });

    test('validateSubject returns error message for null or empty input', () {
      expect(formValidator.validateSubject(null), validSubject);
      expect(formValidator.validateSubject(''), validSubject);
    });

    test('validateSubject returns null for non-empty input', () {
      expect(formValidator.validateSubject('Subject'), null);
    });
  });
}
