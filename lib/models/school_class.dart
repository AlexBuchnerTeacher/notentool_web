class SchoolClass {
  final String id;         // z. B. "EAT311"
  final String name;       // "EAT 311"
  final String yearId;     // "2025/26"
  final String department; // "EAT" oder "EBT"

  /// ► Jetzt als const-Konstruktor – damit kannst du die Klasse
  ///    in const-Listen verwenden, z. B. in home_page.dart
  const SchoolClass({
    required this.id,
    required this.name,
    required this.yearId,
    required this.department,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'yearId': yearId,
        'department': department,
      };

  factory SchoolClass.fromJson(Map<String, dynamic> json) => SchoolClass(
        id: json['id'],
        name: json['name'],
        yearId: json['yearId'],
        department: json['department'],
      );
}
