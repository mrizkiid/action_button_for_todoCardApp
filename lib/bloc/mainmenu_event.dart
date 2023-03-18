part of 'mainmenu_bloc.dart';

@immutable
abstract class MainmenuEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MainmenuInitialEvent extends MainmenuEvent {}

class ActionEvent extends MainmenuEvent {}

class ActionDelete extends MainmenuEvent {}

class ActionReorder extends MainmenuEvent {}

class ActionAdd extends MainmenuEvent {}

class DoneEvent extends MainmenuEvent {}
