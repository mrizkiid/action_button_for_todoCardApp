part of 'mainmenu_bloc.dart';

@immutable
abstract class MainmenuState extends Equatable {
  final bool isActionPressed;
  final bool isShowPressed;
  final ActionEnum actionEnum;

  const MainmenuState(
      {required this.isActionPressed,
      required this.isShowPressed,
      required this.actionEnum});
  @override
  List<Object?> get props => [isActionPressed, isShowPressed, actionEnum];
}

class MainmenuInitial extends MainmenuState {
  const MainmenuInitial(
      {required super.actionEnum,
      required super.isActionPressed,
      required super.isShowPressed});
}

class ActionState extends MainmenuState {
  const ActionState(
      {required super.isActionPressed,
      required super.isShowPressed,
      required super.actionEnum});
}

class ReorderState extends MainmenuState {
  const ReorderState(
      {required super.isActionPressed,
      required super.isShowPressed,
      required super.actionEnum});
}

class DeleteState extends MainmenuState {
  const DeleteState(
      {required super.isActionPressed,
      required super.isShowPressed,
      required super.actionEnum});
}
