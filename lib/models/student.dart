class Student {
  final String id;
  final String name;
  final String classId;

  Student({required this.id, required this.name, required this.classId});

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'classId': classId,
  };

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json['id'],
    name: json['name'],
    classId: json['classId'],
  );
}