import 'package:flutter_riverpod/flutter_riverpod.dart';

// Dummy subjectsProvider
final subjectsProvider = Provider<List<String>>((ref) => ['Mathe', 'Deutsch', 'Englisch']);

// Dummy firestoreServiceProvider
final firestoreServiceProvider = Provider<String>((ref) => 'FirestoreServiceStub');

// Dummy authServiceProvider
final authServiceProvider = Provider<String>((ref) => 'AuthServiceStub');

// Dummy currentUserProvider
final currentUserProvider = Provider<String>((ref) => 'CurrentUserStub');
