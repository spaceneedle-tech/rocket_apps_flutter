import 'package:flutter/widgets.dart';
import 'package:rocket_apps_flutter/binding/bind.dart';
import 'package:rocket_apps_flutter/foundation/view.dart';
import 'package:rocket_apps_flutter/foundation/viewmodel.dart';

// ignore: must_be_immutable
class ViewContainer<TView extends View, TViewModel extends ViewModel>
    extends StatelessWidget {
  late TView view;
  late TViewModel viewModel;

  ViewContainer(
      TView Function() viewCreator,
      TViewModel Function(BuildContext) viewModelCreator,
      BuildContext context) {
    view = viewCreator();
    viewModel = viewModelCreator(context);
    view.viewModel = viewModel;
    //  WidgetsBinding.instance.addPostFrameCallback((_) => viewModel.loaded());
  }

  @override
  Widget build(BuildContext context) {
    return Bind<TViewModel>(
      create: (context) => viewModel,
      builder: (context, vm, child) {
        return view.build(context, vm, child);
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Bind<TViewModel>(
  //     create: (context) => Arise.viewModel<TViewModel>(context),
  //     builder: (context, vm, child) {
  //       return Arise.view(context, vm)<TView>(context, vm);
  //     },
  //   );
  // }
}
