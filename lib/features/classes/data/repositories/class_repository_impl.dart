import 'package:dartz/dartz.dart';
import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/services/firestore_service.dart';
import '../../domain/entities/class_entity.dart';
import '../../domain/repositories/class_repository.dart';
import '../models/class_model.dart';

/// Implementation of ClassRepository using Firestore
class ClassRepositoryImpl implements ClassRepository {
  final FirestoreService _firestoreService;

  ClassRepositoryImpl(this._firestoreService);

  @override
  Future<Either<Failure, List<ClassEntity>>> getClasses(String teacherId) async {
    try {
      final snapshot = await _firestoreService.getCollection(
        collection: FirebaseConstants.classesCollection,
        queryBuilder: (ref) => ref.where(FirebaseConstants.userIdField, isEqualTo: teacherId),
      );

      final classes = snapshot.docs
          .map((doc) => ClassModel.fromJson({...doc.data(), 'id': doc.id}).toEntity())
          .toList();

      return Right(classes);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch classes: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ClassEntity>> getClassById(String classId) async {
    try {
      final doc = await _firestoreService.getDocument(
        collection: FirebaseConstants.classesCollection,
        documentId: classId,
      );

      if (!doc.exists) {
        return Left(ServerFailure('Class not found'));
      }

      final classModel = ClassModel.fromJson({...doc.data()!, 'id': doc.id});
      return Right(classModel.toEntity());
    } catch (e) {
      return Left(ServerFailure('Failed to fetch class: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ClassEntity>> createClass(ClassEntity classEntity) async {
    try {
      final model = ClassModel.fromEntity(classEntity);
      final data = model.toJson();
      
      final docId = await _firestoreService.addDocument(
        collection: FirebaseConstants.classesCollection,
        data: data,
      );

      final newClass = model.copyWith(id: docId);
      return Right(newClass.toEntity());
    } catch (e) {
      return Left(ServerFailure('Failed to create class: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ClassEntity>> updateClass(ClassEntity classEntity) async {
    try {
      final model = ClassModel.fromEntity(classEntity);
      await _firestoreService.updateDocument(
        collection: FirebaseConstants.classesCollection,
        documentId: classEntity.id,
        data: model.toJson(),
      );

      return Right(classEntity);
    } catch (e) {
      return Left(ServerFailure('Failed to update class: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteClass(String classId) async {
    try {
      await _firestoreService.deleteDocument(
        collection: FirebaseConstants.classesCollection,
        documentId: classId,
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to delete class: ${e.toString()}'));
    }
  }

  @override
  Stream<Either<Failure, List<ClassEntity>>> streamClasses(String teacherId) {
    try {
      return _firestoreService
          .streamCollection(
            collection: FirebaseConstants.classesCollection,
            queryBuilder: (ref) =>
                ref.where(FirebaseConstants.userIdField, isEqualTo: teacherId),
          )
          .map((snapshot) {
        final classes = snapshot.docs
            .map((doc) => ClassModel.fromJson({...doc.data(), 'id': doc.id}).toEntity())
            .toList();
        return Right<Failure, List<ClassEntity>>(classes);
      }).handleError((error) {
        return Left<Failure, List<ClassEntity>>(
          ServerFailure('Failed to stream classes: ${error.toString()}'),
        );
      });
    } catch (e) {
      return Stream.value(
        Left(ServerFailure('Failed to stream classes: ${e.toString()}')),
      );
    }
  }
}
