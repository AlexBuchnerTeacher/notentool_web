import '../../domain/entities/class_entity.dart';

/// Data model for ClassEntity with JSON serialization
class ClassModel extends ClassEntity {
  const ClassModel({
    required super.id,
    required super.name,
    super.description,
    required super.teacherId,
    required super.studentIds,
    required super.createdAt,
    required super.updatedAt,
  });

  /// Create ClassModel from JSON
  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      teacherId: json['teacherId'] as String,
      studentIds: (json['studentIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  /// Convert ClassModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'teacherId': teacherId,
      'studentIds': studentIds,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Create ClassModel from ClassEntity
  factory ClassModel.fromEntity(ClassEntity entity) {
    return ClassModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      teacherId: entity.teacherId,
      studentIds: entity.studentIds,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Convert to ClassEntity
  ClassEntity toEntity() {
    return ClassEntity(
      id: id,
      name: name,
      description: description,
      teacherId: teacherId,
      studentIds: studentIds,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
