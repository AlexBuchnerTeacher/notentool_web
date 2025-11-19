import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/firebase_providers.dart';
import '../../data/repositories/class_repository_impl.dart';
import '../../domain/entities/class_entity.dart';
import '../../domain/repositories/class_repository.dart';
import '../../domain/usecases/get_classes.dart';

/// Provider for ClassRepository
final classRepositoryProvider = Provider<ClassRepository>((ref) {
  final firestoreService = ref.watch(firestoreServiceProvider);
  return ClassRepositoryImpl(firestoreService);
});

/// Provider for GetClasses use case
final getClassesUseCaseProvider = Provider<GetClasses>((ref) {
  final repository = ref.watch(classRepositoryProvider);
  return GetClasses(repository);
});

/// Provider for classes list
final classesProvider = FutureProvider.family<List<ClassEntity>, String>((ref, teacherId) async {
  final getClasses = ref.watch(getClassesUseCaseProvider);
  final result = await getClasses(teacherId);
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (classes) => classes,
  );
});

/// Provider for streaming classes
final streamClassesProvider = StreamProvider.family<List<ClassEntity>, String>((ref, teacherId) {
  final repository = ref.watch(classRepositoryProvider);
  
  return repository.streamClasses(teacherId).map((either) {
    return either.fold(
      (failure) => throw Exception(failure.message),
      (classes) => classes,
    );
  });
});
