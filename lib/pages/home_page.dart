import 'package:flutter/material.dart';
import '../models/student.dart';
import '../models/school_class.dart';
import 'class_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedYear = '2025/26';
  SchoolClass? _selectedClass;

  /// ► Klassen Schuljahr 2025/26
  final List<SchoolClass> _classes = const [
    SchoolClass(id: 'EAT311', name: 'EAT 311', yearId: '2025/26', department: 'EAT'),
    SchoolClass(id: 'EAT321', name: 'EAT 321', yearId: '2025/26', department: 'EAT'),
    SchoolClass(id: 'EAT331', name: 'EAT 331', yearId: '2025/26', department: 'EAT'),
    SchoolClass(id: 'EBT313', name: 'EBT 313', yearId: '2025/26', department: 'EBT'),
    SchoolClass(id: 'EBT314', name: 'EBT 314', yearId: '2025/26', department: 'EBT'),
    SchoolClass(id: 'EBT323', name: 'EBT 323', yearId: '2025/26', department: 'EBT'),
    SchoolClass(id: 'EBT333', name: 'EBT 333', yearId: '2025/26', department: 'EBT'),
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = _classes.where((c) => c.yearId == _selectedYear).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Notentool – Startseite')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Schuljahr:', style: Theme.of(context).textTheme.titleSmall),
            DropdownButton<String>(
              value: _selectedYear,
              items: ['2025/26']
                  .map((y) => DropdownMenuItem(value: y, child: Text(y)))
                  .toList(),
              onChanged: (val) {},
            ),
            const SizedBox(height: 16),
            Text('Klasse:', style: Theme.of(context).textTheme.titleSmall),
            DropdownButton<SchoolClass>(
              value: _selectedClass,
              isExpanded: true,
              hint: const Text('Bitte Klasse wählen'),
              items: filtered
                  .map((c) => DropdownMenuItem(value: c, child: Text(c.name)))
                  .toList(),
              onChanged: (val) => setState(() => _selectedClass = val),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Zur Klasse'),
              onPressed: _selectedClass == null
                  ? null
                  : () {
                      final students = List.generate(
                        3,
                        (i) => Student(
                          id: '${_selectedClass!.id}_S$i',
                          name: 'Schüler ${i + 1}',
                          classId: _selectedClass!.id,
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ClassPage(
                            className: _selectedClass!.name,
                            students: students,
                          ),
                        ),
                      );
                    },
            ),
          ],
        ),
      ),
    );
  }
}
