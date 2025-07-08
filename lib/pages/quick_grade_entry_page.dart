import 'package:flutter/material.dart';
import '../models/student.dart';
import '../models/grade_entry.dart';
import '../models/subject.dart';

class QuickGradeEntryPage extends StatefulWidget {
  final List<Student> students;
  final Subject subject;
  final void Function(List<GradeEntry>) onSaveAll;

  const QuickGradeEntryPage({
    super.key,
    required this.students,
    required this.subject,
    required this.onSaveAll,
  });

  @override
  State<QuickGradeEntryPage> createState() => _QuickGradeEntryPageState();
}

class _QuickGradeEntryPageState extends State<QuickGradeEntryPage> {
  late final List<_RowData> _rows;

  @override
  void initState() {
    super.initState();
    _rows = widget.students.map((s) => _RowData(student: s)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schnelleingabe – ${widget.subject.displayName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Schüler')),
                    DataColumn(label: Text('Note')),
                    DataColumn(label: Text('Label')),
                    DataColumn(label: Text('Gew.')),
                    DataColumn(label: Text('Nachgeschr.')),
                  ],
                  rows: _rows.map(_buildRow).toList(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Alle Noten speichern'),
              onPressed: _saveAll,
            ),
          ],
        ),
      ),
    );
  }

  DataRow _buildRow(_RowData row) {
    return DataRow(cells: [
      DataCell(Text(row.student.name)),
      DataCell(
        TextFormField(
          initialValue: row.gradeStr,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(border: InputBorder.none),
          onChanged: (v) => row.gradeStr = v,
        ),
      ),
      DataCell(
        TextFormField(
          initialValue: row.label,
          decoration: const InputDecoration(border: InputBorder.none),
          onChanged: (v) => row.label = v,
        ),
      ),
      DataCell(
        DropdownButton<double>(
          value: row.weight,
          underline: const SizedBox(),
          items: const [1.0, 0.5]
              .map((w) => DropdownMenuItem(value: w, child: Text(w.toString())))
              .toList(),
          onChanged: (v) => setState(() => row.weight = v!),
        ),
      ),
      DataCell(
        Checkbox(
          value: row.makeUp,
          onChanged: (v) => setState(() => row.makeUp = v ?? false),
        ),
      ),
    ]);
  }

  void _saveAll() {
    final List<GradeEntry> entries = [];
    for (final r in _rows) {
      final g = double.tryParse(r.gradeStr);
      if (g == null || g < 1 || g > 6) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ungültige Note bei ${r.student.name}')),
        );
        return;
      }
      entries.add(GradeEntry(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        studentId: r.student.id,
        subjectId: widget.subject.id,
        grade: g,
        label: r.label.isEmpty ? '---' : r.label,
        weight: r.weight,
        makeUp: r.makeUp,
      ));
    }
    widget.onSaveAll(entries);
    Navigator.pop(context);
  }
}

class _RowData {
  final Student student;
  String gradeStr = '';
  String label = '';
  double weight = 1.0;
  bool makeUp = false;

  _RowData({required this.student});
}
