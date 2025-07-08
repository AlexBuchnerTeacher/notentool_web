import '../models/grade_entry.dart';
import '../models/subject.dart';
import '../models/student.dart';

class CsvExportService {
  /// Erzeugt eine CSV-Zeichenkette für einen Schüler
  String generateCsv({
    required Student student,
    required List<GradeEntry> entries,
    required List<Subject> subjects,
  }) {
    // ► Map für schnellen Lookup: subjectId → Subject
    final subjectById = {for (var s in subjects) s.id: s};

    final buffer = StringBuffer();
    buffer.writeln('Fach,Bezeichnung,Note,Gewichtung');

    for (final e in entries.where((e) => e.studentId == student.id)) {
      final subj = subjectById[e.subjectId];
      buffer.writeln(
        '${subj?.displayName ?? '-'},'
        '${e.label},'
        '${e.grade.toStringAsFixed(1)},'
        '${e.weight}',
      );
    }

    return buffer.toString();
  }
}
