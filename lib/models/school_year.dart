class SchoolYear {
  final String id;
  final String label; // z. B. 2024/25

  SchoolYear({required this.id, required this.label});

  Map<String, dynamic> toJson() => {
    'id': id,
    'label': label,
  };

  factory SchoolYear.fromJson(Map<String, dynamic> json) => SchoolYear(
    id: json['id'],
    label: json['label'],
  );
}