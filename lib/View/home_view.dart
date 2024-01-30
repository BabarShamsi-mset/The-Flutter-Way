
import 'package:my_flutter_calculator/ViewModels/home_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  bool get reactive => true;

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stacked Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Pushed Button'),
            Text('${viewModel.counter}',
            style: Theme.of(context).textTheme.headlineLarge,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();


}