import 'package:flutter/material.dart';
import '../models/grade_entry.dart';
import '../models/subject.dart';

class GradeEntryPage extends StatefulWidget {
  final List<Subject> subjects;
  final void Function(GradeEntry) onSave;

  const GradeEntryPage({
    super.key,
    required this.subjects,
    required this.onSave,
  });

  @override
  State<GradeEntryPage> createState() => _GradeEntryPageState();
}

class _GradeEntryPageState extends State<GradeEntryPage> {
  final _formKey = GlobalKey<FormState>();

  String? _subjectId;
  String _label = '';
  double? _grade;
  bool _half = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Note eingeben')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Fach'),
                items: widget.subjects
                    .map((s) => DropdownMenuItem(value: s.id, child: Text(s.displayName)))
                    .toList(),
                onChanged: (v) => setState(() => _subjectId = v),
                validator: (v) => v == null ? 'Bitte Fach wählen' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Bezeichnung'),
                onChanged: (v) => _label = v,
                validator: (v) => v == null || v.isEmpty ? 'Pflichtfeld' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Note (1–6)'),
                keyboardType: TextInputType.number,
                onChanged: (v) => _grade = double.tryParse(v),
                validator: (v) {
                  final g = double.tryParse(v ?? '');
                  if (g == null || g < 1 || g > 6) return '1–6 eingeben';
                  return null;
                },
              ),
              const SizedBox(height: 8),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('0,5-fach zählen'),
                value: _half,
                onChanged: (v) => setState(() => _half = v ?? false),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Speichern'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final entry = GradeEntry(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      studentId: '', // wird in ClassPage zugewiesen
                      subjectId: _subjectId!,
                      grade: _grade!,
                      label: _label,
                      weight: _half ? 0.5 : 1.0,
                    );
                    widget.onSave(entry);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}