part of '../home.dart';

class Dot extends StatelessWidget {
  const Dot({
    Key? key,
    required this.batterLevel,
  }) : super(key: key);

  final int batterLevel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: batterLevel < 20
            ? Colors.red
            : (batterLevel < 50 ? Colors.orange : Colors.green),
      ),
    );
  }
}
