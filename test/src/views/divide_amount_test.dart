// divide_amount_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:walippe/src/views/divide_amount.dart';

void main() {
  DivideAmount divider = DivideAmount();

  test('Divide amount per person correctly', () {
    int result = divider.calculateAmountPerPerson(1000, 4);
    expect(result, 250);

    result = divider.calculateAmountPerPerson(1000, 3);
    expect(result, 334);

    result = divider.calculateAmountPerPerson(5000, 2);
    expect(result, 2500);
  });
}
