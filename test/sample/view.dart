import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'view_model.dart';

class SampleView extends StackedView<SampleViewModel> {
  const SampleView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, SampleViewModel viewModel, Widget? child) {
    final size = MediaQuery.of(context).size;

    return const Scaffold();
  }

  @override
  viewModelBuilder(BuildContext context) => SampleViewModel();

  @override
  void onViewModelReady(SampleViewModel viewModel) => viewModel.init();
}
