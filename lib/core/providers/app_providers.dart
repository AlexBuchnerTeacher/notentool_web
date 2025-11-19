import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for app initialization state
final appInitializedProvider = StateProvider<bool>((ref) => false);

/// Provider for loading state
final loadingProvider = StateProvider<bool>((ref) => false);

/// Provider for error messages
final errorMessageProvider = StateProvider<String?>((ref) => null);
