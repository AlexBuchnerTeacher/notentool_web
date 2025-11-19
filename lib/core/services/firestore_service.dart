import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/logger.dart';

/// Base Firestore service providing CRUD operations
class FirestoreService {
  final FirebaseFirestore _firestore;

  FirestoreService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  /// Get a document by ID
  Future<DocumentSnapshot<Map<String, dynamic>>> getDocument({
    required String collection,
    required String documentId,
  }) async {
    try {
      return await _firestore.collection(collection).doc(documentId).get();
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error getting document from $collection/$documentId',
        tag: 'FirestoreService',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Get all documents from a collection
  Future<QuerySnapshot<Map<String, dynamic>>> getCollection({
    required String collection,
    Query<Map<String, dynamic>>? Function(CollectionReference<Map<String, dynamic>>)? queryBuilder,
  }) async {
    try {
      final collectionRef = _firestore.collection(collection);
      final query = queryBuilder?.call(collectionRef) ?? collectionRef;
      return await query.get();
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error getting collection $collection',
        tag: 'FirestoreService',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Create or update a document
  Future<void> setDocument({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
    bool merge = true,
  }) async {
    try {
      await _firestore
          .collection(collection)
          .doc(documentId)
          .set(data, SetOptions(merge: merge));
      AppLogger.log('Document written to $collection/$documentId', tag: 'FirestoreService');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error writing document to $collection/$documentId',
        tag: 'FirestoreService',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Update a document
  Future<void> updateDocument({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collection).doc(documentId).update(data);
      AppLogger.log('Document updated: $collection/$documentId', tag: 'FirestoreService');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error updating document $collection/$documentId',
        tag: 'FirestoreService',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Delete a document
  Future<void> deleteDocument({
    required String collection,
    required String documentId,
  }) async {
    try {
      await _firestore.collection(collection).doc(documentId).delete();
      AppLogger.log('Document deleted: $collection/$documentId', tag: 'FirestoreService');
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error deleting document $collection/$documentId',
        tag: 'FirestoreService',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Stream a document
  Stream<DocumentSnapshot<Map<String, dynamic>>> streamDocument({
    required String collection,
    required String documentId,
  }) {
    try {
      return _firestore.collection(collection).doc(documentId).snapshots();
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error streaming document $collection/$documentId',
        tag: 'FirestoreService',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Stream a collection
  Stream<QuerySnapshot<Map<String, dynamic>>> streamCollection({
    required String collection,
    Query<Map<String, dynamic>>? Function(CollectionReference<Map<String, dynamic>>)? queryBuilder,
  }) {
    try {
      final collectionRef = _firestore.collection(collection);
      final query = queryBuilder?.call(collectionRef) ?? collectionRef;
      return query.snapshots();
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error streaming collection $collection',
        tag: 'FirestoreService',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Add a document with auto-generated ID
  Future<String> addDocument({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    try {
      final docRef = await _firestore.collection(collection).add(data);
      AppLogger.log('Document added to $collection with ID: ${docRef.id}', tag: 'FirestoreService');
      return docRef.id;
    } catch (e, stackTrace) {
      AppLogger.error(
        'Error adding document to $collection',
        tag: 'FirestoreService',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
