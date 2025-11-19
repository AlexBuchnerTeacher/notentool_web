import 'package:flutter_test/flutter_test.dart';
import 'package:notentool_web/features/classes/domain/entities/class_entity.dart';

void main() {
  group('ClassEntity', () {
    final testDateTime = DateTime(2024, 1, 1);
    
    final testEntity = ClassEntity(
      id: 'test-id-1',
      name: 'Math 101',
      description: 'Introduction to Mathematics',
      teacherId: 'teacher-1',
      studentIds: ['student-1', 'student-2'],
      createdAt: testDateTime,
      updatedAt: testDateTime,
    );

    test('should create a valid ClassEntity', () {
      expect(testEntity.id, 'test-id-1');
      expect(testEntity.name, 'Math 101');
      expect(testEntity.description, 'Introduction to Mathematics');
      expect(testEntity.teacherId, 'teacher-1');
      expect(testEntity.studentIds, ['student-1', 'student-2']);
      expect(testEntity.createdAt, testDateTime);
      expect(testEntity.updatedAt, testDateTime);
    });

    test('should support equality comparison', () {
      final entity1 = ClassEntity(
        id: 'test-id-1',
        name: 'Math 101',
        description: 'Introduction to Mathematics',
        teacherId: 'teacher-1',
        studentIds: ['student-1', 'student-2'],
        createdAt: testDateTime,
        updatedAt: testDateTime,
      );

      final entity2 = ClassEntity(
        id: 'test-id-1',
        name: 'Math 101',
        description: 'Introduction to Mathematics',
        teacherId: 'teacher-1',
        studentIds: ['student-1', 'student-2'],
        createdAt: testDateTime,
        updatedAt: testDateTime,
      );

      expect(entity1, equals(entity2));
    });

    test('should support copyWith', () {
      final copiedEntity = testEntity.copyWith(
        name: 'Advanced Math 101',
        studentIds: ['student-1', 'student-2', 'student-3'],
      );

      expect(copiedEntity.id, testEntity.id);
      expect(copiedEntity.name, 'Advanced Math 101');
      expect(copiedEntity.description, testEntity.description);
      expect(copiedEntity.teacherId, testEntity.teacherId);
      expect(copiedEntity.studentIds, ['student-1', 'student-2', 'student-3']);
      expect(copiedEntity.createdAt, testEntity.createdAt);
      expect(copiedEntity.updatedAt, testEntity.updatedAt);
    });

    test('should create entity with null description', () {
      final entityWithoutDescription = ClassEntity(
        id: 'test-id-2',
        name: 'Science 101',
        teacherId: 'teacher-1',
        studentIds: [],
        createdAt: testDateTime,
        updatedAt: testDateTime,
      );

      expect(entityWithoutDescription.description, isNull);
      expect(entityWithoutDescription.studentIds, isEmpty);
    });

    test('should maintain immutability with copyWith', () {
      final original = testEntity;
      final modified = original.copyWith(name: 'New Name');

      expect(original.name, 'Math 101');
      expect(modified.name, 'New Name');
      expect(original != modified, true);
    });
  });
}
