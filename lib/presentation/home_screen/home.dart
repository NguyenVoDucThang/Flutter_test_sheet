import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_sheet/global/my_router.dart';
import 'package:flutter_test_sheet/presentation/home_screen/bloc/home_bloc.dart';
import 'package:flutter_test_sheet/presentation/home_screen/models/button_model.dart';
import 'package:flutter_test_sheet/utils/color_utils.dart';

part './widgets/dot.dart';
part './widgets/answer.dart';
part './widgets/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return BlocProvider(
      create: (context) => HomeScreenBloc()..add(const HomeScreenInitted()),
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(color: ColorUtils.backgroundColor),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, MyRouter.historyScreen);
                        },
                        child: const Text(
                          '< History Screen',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Dot(batterLevel: state.batteryLevel),
                      const SizedBox(width: 10),
                      Dot(batterLevel: state.batteryLevel),
                      const SizedBox(width: 10),
                      Dot(batterLevel: state.batteryLevel),
                      const SizedBox(width: 10),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Spacer(),
                        Calculation(
                          answer: state.answer,
                          calculation: state.calculation ?? '0',
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                  Wrap(
                    runSpacing: 2,
                    spacing: 2,
                    children: getButtons(
                      context: context,
                      ac: state.calculation == '0' ? 'C' : 'AC',
                    ).map((e) => Button(buttonModel: e)).toList(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
