import 'package:flutter/material.dart';
import '../models/student.dart';
import '../models/subject.dart';
import '../models/grade_entry.dart';
import '../services/data_storage.dart';

import 'grade_entry_page.dart';
import 'student_grades_page.dart' as sg;     // Alias: sg.
import 'quick_grade_entry_page.dart' as qg; // Alias: qg.

/// ► EAT-Fächer
const eatSubjects = [
  Subject(id: 'IT31', module: 'IT 3.1', code: 'IT Wdh', description: 'BGJ Wiederholung'),
  Subject(id: 'IT32', module: 'IT 3.2', code: 'IT Bus', description: 'Bussysteme'),
  Subject(id: 'KAT31', module: 'KAT 3.1', code: 'SE', description: 'Sensorik'),
  Subject(id: 'KAT33', module: 'KAT 3.3', code: 'RT', description: 'Regelungstechnik'),
  Subject(id: 'KAT34', module: 'KAT 3.4', code: 'LE', description: 'Leistungselektronik'),
  Subject(id: 'KAT35', module: 'KAT 3.5', code: 'FU', description: 'Frequenzumrichter'),
];

/// ► EBT-Fächer
const ebtSubjects = [
  Subject(id: 'BT32', module: 'BT 3.2', code: 'SE', description: 'Sensorik'),
  Subject(id: 'BT34', module: 'BT 3.4', code: 'LE', description: 'Leistungselektronik'),
  Subject(id: 'ST34', module: 'ST 3.4', code: 'RT', description: 'Regelungstechnik'),
];

class ClassPage extends StatefulWidget {
  final String className;
  final List<Student> students;
  const ClassPage({super.key, required this.className, required this.students});

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  final DataStorage _storage = DataStorage();
  final List<GradeEntry> _entries = [];

  List<Subject> get _subjects =>
      widget.className.startsWith('EAT') ? eatSubjects : ebtSubjects;

  @override
  void initState() {
    super.initState();
    _loadEntries();
  }

  Future<void> _loadEntries() async {
    _entries.addAll(await _storage.loadEntries());
    setState(() {});
  }

  void _addEntry(GradeEntry e) {
    _entries.add(e);
    _storage.saveEntries(_entries);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.className)),
      body: ListView.separated(
        itemCount: widget.students.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final stud = widget.students[index];
          final studEntries = _entries.where((e) => e.studentId == stud.id);
          final avg = studEntries.isEmpty
              ? '-'
              : (studEntries.map((e) => e.grade).reduce((a, b) => a + b) /
                      studEntries.length)
                  .toStringAsFixed(2);

          return ListTile(
            title: Text(stud.name),
            subtitle: Text('Ø $avg'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),

            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => sg.StudentGradesPage(
                  student: stud,
                  entries: _entries,
                  subjects: _subjects,
                ),
              ),
            ),

            onLongPress: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => GradeEntryPage(
                  subjects: _subjects,
                  onSave: (entry) {
                    _addEntry(entry.copyWith(studentId: stud.id));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Note gespeichert für ${stud.name}')),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.edit_note),
        label: const Text('Schnelleingabe'),
        onPressed: () {
          final subject = _subjects.first;

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => qg.QuickGradeEntryPage(
                students: widget.students,
                subject: subject,
                onSaveAll: (list) {
                  for (final e in list) {
                    _addEntry(e);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Alle Noten gespeichert')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}


