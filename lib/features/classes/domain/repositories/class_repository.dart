import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/class_entity.dart';

/// Abstract repository for class operations
abstract class ClassRepository {
  /// Get all classes for a teacher
  Future<Either<Failure, List<ClassEntity>>> getClasses(String teacherId);

  /// Get a specific class by ID
  Future<Either<Failure, ClassEntity>> getClassById(String classId);

  /// Create a new class
  Future<Either<Failure, ClassEntity>> createClass(ClassEntity classEntity);

  /// Update an existing class
  Future<Either<Failure, ClassEntity>> updateClass(ClassEntity classEntity);

  /// Delete a class
  Future<Either<Failure, void>> deleteClass(String classId);

  /// Stream classes for a teacher
  Stream<Either<Failure, List<ClassEntity>>> streamClasses(String teacherId);
}
