import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import '../models/grade_entry.dart';
import '../models/student.dart';
import '../models/subject.dart';
import '../services/pdf_export.dart';
import '../services/csv_export.dart';
import '../theme/rbs_theme.dart';

class StudentGradesPage extends StatelessWidget {
  final Student student;
  final List<GradeEntry> entries;
  final List<Subject> subjects;

  const StudentGradesPage({
    super.key,
    required this.student,
    required this.entries,
    required this.subjects,
  });

  @override
  Widget build(BuildContext context) {
    final studentEntries =
        entries.where((e) => e.studentId == student.id).toList();

    final subjectMap = {for (var s in subjects) s.id: s};

    final totalWeight =
        studentEntries.fold<double>(0, (s, e) => s + e.weight);
    final weightedSum =
        studentEntries.fold<double>(0, (s, e) => s + e.grade * e.weight);
    final average =
        totalWeight == 0 ? 0 : (weightedSum / totalWeight);

    return Scaffold(
      appBar: AppBar(
        title: Text('${student.name} – Notenübersicht'),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            tooltip: 'Als PDF exportieren',
            onPressed: () async {
              final exporter = PdfExportService();
              final pdfData = await exporter.generatePdf(
                student: student,
                entries: entries,
                subjects: subjects,
              );
              await Printing.layoutPdf(onLayout: (_) => pdfData);
            },
          ),
          IconButton(
            icon: const Icon(Icons.table_chart),
            tooltip: 'Als CSV anzeigen',
            onPressed: () {
              final csv = CsvExportService().generateCsv(
                student: student,
                entries: entries,
                subjects: subjects,
              );
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('CSV Export'),
                  content: SingleChildScrollView(child: Text(csv)),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gewichteter Schnitt: ${average.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: studentEntries.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final entry = studentEntries[index];
                  final subject = subjectMap[entry.subjectId];

                  final bgColor = entry.grade < 4
                      ? RbsTheme.dangerColor
                      : entry.grade <= 2
                          ? RbsTheme.successColor
                          : null;

                  return Container(
                    color: bgColor,
                    child: ListTile(
                      title: Text('${subject?.displayName ?? 'Unbekannt'} – ${entry.label}'),
                      subtitle: Text(
                          '${entry.weight == 0.5 ? "0,5-fach" : "1-fach"}'),
                      trailing: Text(
                        entry.grade.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 18,
                          color: entry.grade < 4
                              ? Theme.of(context).colorScheme.error
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
