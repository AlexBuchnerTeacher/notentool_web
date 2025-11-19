import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/class_entity.dart';
import '../repositories/class_repository.dart';

/// Use case for getting all classes for a teacher
class GetClasses implements UseCase<List<ClassEntity>, String> {
  final ClassRepository repository;

  GetClasses(this.repository);

  @override
  Future<Either<Failure, List<ClassEntity>>> call(String teacherId) async {
    return await repository.getClasses(teacherId);
  }
}
