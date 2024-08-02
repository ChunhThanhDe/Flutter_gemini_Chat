import 'package:gemini_demo/core/repositories/gemini_repository.dart';
import 'package:gemini_demo/core/view_models/chat_view_model.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => GeminiRepository());
  locator.registerLazySingleton(() => ChatViewModel());
}
