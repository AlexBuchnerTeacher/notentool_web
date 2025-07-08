import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import '../models/grade_entry.dart';
import '../models/subject.dart';
import '../models/student.dart';

class PdfExportService {
  Future<Uint8List> generatePdf({
    required Student student,
    required List<GradeEntry> entries,
    required List<Subject> subjects,
  }) async {
    final pdf = pw.Document();

    final subjectMap = {for (var s in subjects) s.id: s};

    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Notenübersicht: ${student.name}',
                style: pw.TextStyle(fontSize: 20)),
            pw.SizedBox(height: 16),
            pw.TableHelper.fromTextArray(
              headers: ['Fach', 'Bezeichnung', 'Note', 'Gew.'],
              data: entries
                  .where((e) => e.studentId == student.id)
                  .map((e) => [
                        subjectMap[e.subjectId]?.displayName ?? '-',
                        e.label,
                        e.grade.toStringAsFixed(1),
                        e.weight.toString(),
                      ])
                  .toList(),
            ),
          ],
        ),
      ),
    );

    return pdf.save();
  }
}
