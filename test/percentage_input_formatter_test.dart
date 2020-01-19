import 'package:flutter_test/flutter_test.dart';
import 'package:percentage_input_formatter/percentage_input_formatter.dart';

void main() {
  test('parse', () {
    expect(PercentageInputFormatter.parse(null), null);
    expect(PercentageInputFormatter.parse(''), null);
    expect(PercentageInputFormatter.parse('     '), null);
//    expect(PercentageInputFormatter.parse('ABC'), throwsException);

    expect(PercentageInputFormatter.parse('123456789'), 123456789.0);
    expect(PercentageInputFormatter.parse('123456789%'), 123456789.0);
//    expect(
//        PercentageInputFormatter.parse('123456789.12'), 12345678912.0);
//    expect(
//        PercentageInputFormatter.parse('123456789,12'), 123456789.12);
//    expect(
//        PercentageInputFormatter.parse('123.456.789,12'), 123456789.12);
//
//    expect(PercentageInputFormatter.parse('-123456789'), -123456789.0);
//    expect(PercentageInputFormatter.parse('-123456789.12'),
//        -12345678912.0);
//    expect(
//        PercentageInputFormatter.parse('-123456789,12'), -123456789.12);
//    expect(PercentageInputFormatter.parse('-123.456.789,12'),
//        -123456789.12);
  });
  test('format', () {});
}
