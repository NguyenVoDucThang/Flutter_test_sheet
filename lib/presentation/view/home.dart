import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_sheet/presentation/bloc/home_bloc.dart';
import 'package:flutter_test_sheet/presentation/view/models/button_model.dart';
import 'package:flutter_test_sheet/utils/color_utils.dart';

part './widgets/dot.dart';
part './widgets/answer.dart';
part './widgets/button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc(),
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
        child: Container(
          decoration: BoxDecoration(color: ColorUtils.backgroundColor),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Dot(),
                  SizedBox(width: 10),
                  Dot(),
                  SizedBox(width: 10),
                  Dot(),
                  SizedBox(width: 10),
                ],
              ),
              const Expanded(
                child: Row(
                  children: [
                    Spacer(),
                    Answer(),
                    SizedBox(width: 30),
                  ],
                ),
              ),
              Wrap(
                runSpacing: 2,
                spacing: 2,
                children:
                    buttonList.map((e) => Button(buttonModel: e)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
