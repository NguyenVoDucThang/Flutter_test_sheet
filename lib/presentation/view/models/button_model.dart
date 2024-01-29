import 'package:flutter/material.dart';
import 'package:flutter_test_sheet/utils/color_utils.dart';

class ButtonModel {
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
}

List<ButtonModel> buttonList = [
  ButtonModel(
    title: 'AC',
    onClicked: () {},
    backgroundColor: ColorUtils.darkButton,
  ),
  ButtonModel(
    title: '+/-',
    onClicked: () {},
    backgroundColor: ColorUtils.darkButton,
  ),
  ButtonModel(
    title: '%',
    onClicked: () {},
    backgroundColor: ColorUtils.darkButton,
  ),
  ButtonModel(
    title: '÷',
    onClicked: () {},
    backgroundColor: ColorUtils.yellowButton,
  ),
  ButtonModel(
    title: '7',
    onClicked: () {},
    backgroundColor: ColorUtils.lightButton,
  ),
  ButtonModel(
    title: '8',
    onClicked: () {},
    backgroundColor: ColorUtils.lightButton,
  ),
  ButtonModel(
    title: '9',
    onClicked: () {},
    backgroundColor: ColorUtils.lightButton,
  ),
  ButtonModel(
    title: 'x',
    onClicked: () {},
    backgroundColor: ColorUtils.yellowButton,
  ),
  ButtonModel(
    title: '4',
    onClicked: () {},
    backgroundColor: ColorUtils.lightButton,
  ),
  ButtonModel(
    title: '5',
    onClicked: () {},
    backgroundColor: ColorUtils.lightButton,
  ),
  ButtonModel(
    title: '6',
    onClicked: () {},
    backgroundColor: ColorUtils.lightButton,
  ),
  ButtonModel(
    title: '-',
    onClicked: () {},
    backgroundColor: ColorUtils.yellowButton,
  ),
  ButtonModel(
    title: '1',
    onClicked: () {},
    backgroundColor: ColorUtils.lightButton,
  ),
  ButtonModel(
    title: '2',
    onClicked: () {},
    backgroundColor: ColorUtils.lightButton,
  ),
  ButtonModel(
    title: '3',
    onClicked: () {},
    backgroundColor: ColorUtils.lightButton,
  ),
  ButtonModel(
    title: '+',
    onClicked: () {},
    backgroundColor: ColorUtils.yellowButton,
  ),
  ButtonModel(
    title: '0',
    onClicked: () {},
    backgroundColor: ColorUtils.lightButton,
    isDouble: true,
  ),
  ButtonModel(
    title: ',',
    onClicked: () {},
    backgroundColor: ColorUtils.lightButton,
  ),
  ButtonModel(
    title: '=',
    onClicked: () {},
    backgroundColor: ColorUtils.yellowButton,
  ),
];
