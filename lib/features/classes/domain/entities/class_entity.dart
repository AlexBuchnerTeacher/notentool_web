import 'package:equatable/equatable.dart';

/// Domain entity for a school class
class ClassEntity extends Equatable {
  final String id;
  final String name;
  final String? description;
  final String teacherId;
  final List<String> studentIds;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ClassEntity({
    required this.id,
    required this.name,
    this.description,
    required this.teacherId,
    required this.studentIds,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        teacherId,
        studentIds,
        createdAt,
        updatedAt,
      ];

  /// Create a copy with updated fields
  ClassEntity copyWith({
    String? id,
    String? name,
    String? description,
    String? teacherId,
    List<String>? studentIds,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ClassEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      teacherId: teacherId ?? this.teacherId,
      studentIds: studentIds ?? this.studentIds,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
