// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowlat/bloc/mainmenu_bloc.dart';

enum ActionEnum { reorder, delete, add, action }

class BuildItem extends StatelessWidget {
  const BuildItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 60,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          width: 140,
          height: 55,
          decoration: BoxDecoration(
              // color: Colors.black,
              color: Color(0xfffefeb1),
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  flex: 2,
                  child: SizedBox(
                    height: 55,
                    child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        icon,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                  )),
              Flexible(
                flex: 3,
                child: SizedBox(
                  height: 55,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BuildItemUtama extends StatelessWidget {
  const BuildItemUtama({
    Key? key,
    required this.title1,
    required this.title2,
    required this.onPressed,
  }) : super(key: key);

  final String title1;
  final String title2;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: Container(
          width: 140,
          height: 55,
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<MainmenuBloc, MainmenuState>(
                    bloc: context.read<MainmenuBloc>(),
                    builder: (context, state) {
                      return Text(
                        (state.isActionPressed) ? title2 : title1,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DoneButton extends StatelessWidget {
  DoneButton({super.key, required this.actionEnum});

  final ActionEnum actionEnum;
  late MainmenuBloc mainmenuBloc;

  void showDialogMehtod(
    BuildContext context, {
    required String titleHead,
    required String titleSubHead,
    required String button,
    required MainmenuBloc mainmenuBloc,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titleHead),
          content: Text(titleSubHead),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(button),
              onPressed: () {
                mainmenuBloc.add(DoneEvent());
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            mainmenuBloc = context.read<MainmenuBloc>();
            if (actionEnum == ActionEnum.delete) {
              showDialogMehtod(context,
                  mainmenuBloc: mainmenuBloc,
                  titleHead: 'Are You Sure ?',
                  titleSubHead:
                      'Tasks that have been deleted will not be restored !',
                  button: 'Delete');
              return;
            }
            if (actionEnum == ActionEnum.reorder) {
              showDialogMehtod(context,
                  mainmenuBloc: mainmenuBloc,
                  titleHead: 'Save the changes',
                  titleSubHead: 'Are you want to save the changes ? ',
                  button: 'Save');
              return;
            }
          },
          child: Container(
            height: 40,
            width: 74,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                topLeft: Radius.circular(25),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 11),
                child: Text(
                  'Done',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 2,
        ),
        InkWell(
          onTap: () {
            context.read<MainmenuBloc>().add(DoneEvent());
          },
          child: Container(
            height: 40,
            width: 74,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 11),
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
