import 'package:get_it/get_it.dart';
import 'package:my_flutter_calculator/Services/counter_service.dart';

GetIt _locator = GetIt.instance;

GetIt get locator => _locator;

void setUpLocator() {
  locator.registerLazySingleton(() => CounterService());
}