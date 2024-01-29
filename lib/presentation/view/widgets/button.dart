part of '../home.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.buttonModel,
  }) : super(key: key);

  final ButtonModel buttonModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 4 - 2,
      width: buttonModel.isDouble == true
          ? MediaQuery.of(context).size.width / 2 - 2
          : MediaQuery.of(context).size.width / 4 - 2,
      decoration: BoxDecoration(color: buttonModel.backgroundColor),
      child: Center(
        child: Text(
          buttonModel.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 45,
          ),
        ),
      ),
    );
  }
}
