import 'package:flutter_test/flutter_test.dart';
import 'package:induscore/models/beruf.dart';
import 'package:induscore/models/klasse.dart';

void main() {
  test('ParsedKlassenname.parse returns correct parts', () {
    final parsed = ParsedKlassenname.parse('EAT321');

    expect(parsed.beruf, Beruf.eat);
    expect(parsed.jahrgangsstufe, 3);
    expect(parsed.zeitgruppe, Zeitgruppe.zwei);
    expect(parsed.laufendeNummer, 1);
  });

  test('ParsedKlassenname.parse trims and uppercases input', () {
    final parsed = ParsedKlassenname.parse('  ie111  ');
    expect(parsed.beruf, Beruf.ie);
    expect(parsed.jahrgangsstufe, 1);
    expect(parsed.zeitgruppe, Zeitgruppe.eins);
    expect(parsed.laufendeNummer, 1);
  });

  test('ParsedKlassenname.parse throws helpful errors', () {
    expect(
      () => ParsedKlassenname.parse('INVALID'),
      throwsA(isA<FormatException>()),
    );
    expect(
      () => ParsedKlassenname.parse('EAT921'),
      throwsA(isA<FormatException>()),
    );
  });
}
