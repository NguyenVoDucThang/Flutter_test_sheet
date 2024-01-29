import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_sheet/presentation/home_screen/bloc/home_bloc.dart';
import 'package:flutter_test_sheet/utils/color_utils.dart';

class ButtonModel extends Equatable {
  const ButtonModel({
    Key? key,
    required this.title,
    required this.onClicked,
    required this.backgroundColor,
    this.isDouble,
  });

  final String title;
  final Function() onClicked;
  final Color backgroundColor;
  final bool? isDouble;

  @override
  List<Object?> get props => [title, onClicked, backgroundColor, isDouble];
}

List<ButtonModel> getButtons({
  required BuildContext context,
  required String ac,
}) {
  return [
    ButtonModel(
      title: ac,
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: 'AC'));
      },
      backgroundColor: ColorUtils.darkButton,
    ),
    ButtonModel(
      title: '+/-',
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: '+/-'));
      },
      backgroundColor: ColorUtils.darkButton,
    ),
    ButtonModel(
      title: '%',
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: '%'));
      },
      backgroundColor: ColorUtils.darkButton,
    ),
    ButtonModel(
      title: '÷',
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: '÷'));
      },
      backgroundColor: ColorUtils.yellowButton,
    ),
    ButtonModel(
      title: '7',
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: '7'));
      },
      backgroundColor: ColorUtils.lightButton,
    ),
    ButtonModel(
      title: '8',
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: '8'));
      },
      backgroundColor: ColorUtils.lightButton,
    ),
    ButtonModel(
      title: '9',
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: '9'));
      },
      backgroundColor: ColorUtils.lightButton,
    ),
    ButtonModel(
      title: 'x',
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: 'x'));
      },
      backgroundColor: ColorUtils.yellowButton,
    ),
    ButtonModel(
      title: '4',
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: '4'));
      },
      backgroundColor: ColorUtils.lightButton,
    ),
    ButtonModel(
      title: '5',
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: '5'));
      },
      backgroundColor: ColorUtils.lightButton,
    ),
    ButtonModel(
      title: '6',
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: '6'));
      },
      backgroundColor: ColorUtils.lightButton,
    ),
    ButtonModel(
      title: '-',
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: '-'));
      },
      backgroundColor: ColorUtils.yellowButton,
    ),
    ButtonModel(
      title: '1',
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: '1'));
      },
      backgroundColor: ColorUtils.lightButton,
    ),
    ButtonModel(
      title: '2',
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: '2'));
      },
      backgroundColor: ColorUtils.lightButton,
    ),
    ButtonModel(
      title: '3',
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: '3'));
      },
      backgroundColor: ColorUtils.lightButton,
    ),
    ButtonModel(
      title: '+',
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: '+'));
      },
      backgroundColor: ColorUtils.yellowButton,
    ),
    ButtonModel(
      title: '0',
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: '0'));
      },
      backgroundColor: ColorUtils.lightButton,
      isDouble: true,
    ),
    ButtonModel(
      title: ',',
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: ','));
      },
      backgroundColor: ColorUtils.lightButton,
    ),
    ButtonModel(
      title: '=',
      onClicked: () {
        context
            .read<HomeScreenBloc>()
            .add(const HomeScreenButtonClicked(value: '='));
      },
      backgroundColor: ColorUtils.yellowButton,
    ),
  ];
}
