part of '../home.dart';

class Calculation extends StatelessWidget {
  const Calculation({
    Key? key,
    required this.calculation,
    this.answer,
  }) : super(key: key);

  final String calculation;
  final String? answer;

  @override
  Widget build(BuildContext context) {
    return answer == ''
        ? Text(
            calculation == '' ? '0' : calculation,
            style: TextStyle(
              fontSize: calculation.length <= 6 ? 100 : 50,
              color: Colors.white,
            ),
          )
        : Text(
            answer!,
            style: TextStyle(
              fontSize: answer!.length <= 6 ? 100 : 50,
              color: Colors.white,
            ),
          );
  }
}
