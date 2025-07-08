class Subject {
  final String id;          // z. B. "IT31"
  final String module;      // z. B. "IT 3.1"
  final String code;        // z. B. "IT Wdh"
  final String description; // z. B. "BGJ Wiederholung"

  const Subject({
    required this.id,
    required this.module,
    required this.code,
    required this.description,
  });

  String get displayName => '$module – $code – $description';

  Map<String, dynamic> toJson() => {
        'id': id,
        'module': module,
        'code': code,
        'description': description,
      };

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json['id'],
        module: json['module'],
        code: json['code'],
        description: json['description'],
      );
}
