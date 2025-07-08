class GradeEntry {
  final String id;
  final String studentId;
  final String subjectId;
  final double grade;
  final String label;      // z. B. „Ex 1“
  final double weight;     // 1.0 oder 0.5
  final DateTime date;     // Erfassungsdatum
  final bool makeUp;       // Nachgeschrieben?

  /// Kein `const`, weil `DateTime.now()` nicht const sein darf.
  GradeEntry({
    required this.id,
    required this.studentId,
    required this.subjectId,
    required this.grade,
    required this.label,
    this.weight = 1.0,
    DateTime? date,
    this.makeUp = false,
  }) : date = date ?? DateTime.now();

  /// Praktisches Hilfs-Update
  GradeEntry copyWith({
    String? id,
    String? studentId,
    String? subjectId,
    double? grade,
    String? label,
    double? weight,
    DateTime? date,
    bool? makeUp,
  }) {
    return GradeEntry(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      subjectId: subjectId ?? this.subjectId,
      grade: grade ?? this.grade,
      label: label ?? this.label,
      weight: weight ?? this.weight,
      date: date ?? this.date,
      makeUp: makeUp ?? this.makeUp,
    );
  }

  /// JSON ⇄ Map
  Map<String, dynamic> toJson() => {
        'id': id,
        'studentId': studentId,
        'subjectId': subjectId,
        'grade': grade,
        'label': label,
        'weight': weight,
        'date': date.toIso8601String(),
        'makeUp': makeUp,
      };

  factory GradeEntry.fromJson(Map<String, dynamic> j) => GradeEntry(
        id: j['id'] as String,
        studentId: j['studentId'] as String,
        subjectId: j['subjectId'] as String,
        grade: (j['grade'] as num).toDouble(),
        label: j['label'] as String,
        weight: (j['weight'] as num?)?.toDouble() ?? 1.0,
        date: DateTime.tryParse(j['date'] ?? '') ?? DateTime.now(),
        makeUp: j['makeUp'] as bool? ?? false,
      );
}
