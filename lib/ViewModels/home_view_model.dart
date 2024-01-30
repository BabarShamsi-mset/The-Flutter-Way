import 'package:my_flutter_calculator/Services/counter_service.dart';
import 'package:my_flutter_calculator/Services/locator_service.dart';
import 'package:stacked/stacked.dart';


class HomeViewModel extends ReactiveViewModel {
  final CounterService counterService = locator<CounterService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [
    counterService
  ];

  int get counter => counterService.counterValue;

  void incrementCounter() => counterService.incrementCounter();

  void decrementCounter() => counterService.decrementCounter();

}