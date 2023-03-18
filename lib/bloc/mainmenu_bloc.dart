import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowlat/utils/widget/widget_main_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'mainmenu_event.dart';
part 'mainmenu_state.dart';

class MainmenuBloc extends Bloc<MainmenuEvent, MainmenuState> {
  late AnimationController controller;
  late ActionEnum actionEnum;

  MainmenuBloc()
      : super(const MainmenuInitial(
            isActionPressed: false,
            isShowPressed: false,
            actionEnum: ActionEnum.action)) {
    //
    on<ActionEvent>((event, emit) {
      bool isPressed = !state.isActionPressed;
      actionEnum = ActionEnum.action;
      emit(ActionState(
          actionEnum: actionEnum,
          isActionPressed: isPressed,
          isShowPressed: state.isShowPressed));
    });

    on<ActionAdd>((event, emit) {
      bool isActionPressed = !state.isActionPressed;
      actionEnum = ActionEnum.add;
      emit(ReorderState(
          isActionPressed: isActionPressed,
          isShowPressed: state.isShowPressed,
          actionEnum: actionEnum));
    });

    on<ActionReorder>((event, emit) {
      bool isActionPressed = !state.isActionPressed;
      bool isShowPressed = !state.isShowPressed;
      actionEnum = ActionEnum.reorder;
      emit(ReorderState(
          isActionPressed: isActionPressed,
          isShowPressed: isShowPressed,
          actionEnum: actionEnum));
    });

    on<ActionDelete>((event, emit) {
      bool isPressed = !state.isActionPressed;
      bool isShowPressed = !state.isShowPressed;
      actionEnum = ActionEnum.delete;
      emit(DeleteState(
          isActionPressed: isPressed,
          isShowPressed: isShowPressed,
          actionEnum: actionEnum));
    });

    on<DoneEvent>((event, emit) {
      bool isPressed = !state.isShowPressed;
      actionEnum = ActionEnum.action;
      emit(ActionState(
          actionEnum: actionEnum,
          isShowPressed: isPressed,
          isActionPressed: state.isActionPressed));
    });
  }
}
