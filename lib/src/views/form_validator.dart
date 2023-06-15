import '../const/const.dart';

class FormValidator {
  String? validateGroupName(String? value) {
    if (value == null || value.isEmpty) {
      return validGroupNameMessage;
    }
    return null;
  }

  String? validateMemberName(String? value) {
    if (value == null || value.isEmpty) {
      return validMemberNameMessage;
    }
    return null;
  }
}
