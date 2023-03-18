// ignore_for_file: prefer_const_constructors

import 'package:flowlat/general_observer.dart';
import 'package:flowlat/linerflowclass.dart';
import 'package:flowlat/utils/widget/widget_main_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc/mainmenu_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainmenuBloc(),
      child: MaterialApp(home: MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({super.key});

  // void onpressed(BuildContext context,) {
  //   context.read<MainmenuBloc>().add(event);
  // }
  // MainmenuBloc mainMenuBloc = MainmenuBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainmenuBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flow'),
          centerTitle: true,
        ),
        // body: LinearFlowWidget(),
        floatingActionButton: BlocBuilder<MainmenuBloc, MainmenuState>(
          // bloc: BlocProvider.of(context),
          builder: (context, state) {
            if (state.isShowPressed == false) {
              return const LinearFlowWidget();
            }
            return Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: DoneButton(actionEnum: state.actionEnum),
              ),
            );
          },
        ),
      ),
    );
  }
}
