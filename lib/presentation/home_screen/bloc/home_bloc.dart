import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_sheet/database/database_constant.dart';
import 'package:flutter_test_sheet/database/storage_manager.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<HomeScreenInitted>(_init);
    on<HomeScreenButtonClicked>(_clickButton);
    on<HomeScreenBatteryLevelChanged>(_changeBatteryChanged);
  }

  Future<void> _init(
    HomeScreenInitted event,
    Emitter<HomeScreenState> emit,
  ) async {
    await StorageManager.init();
    EventChannel _batteryEventChannel = const EventChannel('batteryEvent');

    _batteryEventChannel.receiveBroadcastStream().listen(
      (dynamic batteryLevel) {
        add(HomeScreenBatteryLevelChanged(batteryLevel: batteryLevel));
      },
      onError: (dynamic error) {
        print('Error getting battery level: $error');
      },
    );
    emit(const HomeScreenLoadSucess());
  }

  void _clickButton(
    HomeScreenButtonClicked event,
    Emitter<HomeScreenState> emit,
  ) async {
    if (event.value == 'AC') {
      emit(state.copyWith(answer: '', calculation: ''));
    } else if (event.value == '=') {
      if (!_canStartCalculate()) {
        final answer = _calculateOperator(state.calculation ?? '0').toString();
        emit(state.copyWith(
          answer: answer.length > 8 ? answer.substring(0, 8) : answer,
        ));
        await _saveAnswer();
      }
    } else if (event.value == '%') {
      if (!_checkOperatorCondition(['x', '+', '÷'], state.calculation)) {
        if ((state.calculation?.contains('-') == true &&
                state.calculation?.startsWith('-') == true) ||
            state.calculation?.contains('-') == false) {
          final currentCalculation = (double.parse(
                  state.calculation?.isNotEmpty == true
                      ? state.calculation!
                      : '0')) /
              100;
          emit(state.copyWith(calculation: currentCalculation.toString()));
        }
      }
    } else if (event.value == '+/-') {
      if (!_checkOperatorCondition(['%', 'x', '+', '÷'], state.calculation)) {
        if (state.calculation?.contains('-') == true &&
            state.calculation?.startsWith('-') == true) {
          emit(state.copyWith(calculation: state.calculation?.substring(1)));
        } else if (state.calculation?.contains('-') == false) {
          emit(state.copyWith(calculation: '-' + state.calculation!));
        }
      }
    } else {
      final currentCalculation = state.calculation! + event.value;

      if (currentCalculation.length <= 12) {
        emit(state.copyWith(calculation: currentCalculation));
      }
    }
  }

  Future<void> _changeBatteryChanged(
    HomeScreenBatteryLevelChanged event,
    Emitter<HomeScreenState> emit,
  ) async {
    emit(state.copyWith(batteryLevel: event.batteryLevel));
  }

  bool _checkOperatorCondition(
    List<String> characters,
    String? text,
  ) {
    return characters.any((char) => text?.contains(char) == true);
  }

  bool _canStartCalculate() {
    final characters = ['÷', '+', '-', 'x'];
    return characters.any((char) => state.calculation?.endsWith(char) == true);
  }

  double _calculateOperator(String calculation) {
    List<String> additionParts = calculation.split('+');

    double result = 0.0;

    for (String additionPart in additionParts) {
      List<String> subtractionParts = additionPart.split('-');

      double subtractionResult = 0.0;
      bool firstSubtraction = true;

      for (String subtractionPart in subtractionParts) {
        List<String> multiplicationParts = subtractionPart.split('x');
        double multiplicationResult = 1.0;

        for (String part in multiplicationParts) {
          List<String> divisionParts = part.split('÷');
          double divisionResult = double.parse(divisionParts[0]);

          for (int i = 1; i < divisionParts.length; i++) {
            divisionResult /= double.parse(divisionParts[i]);
          }

          multiplicationResult *= divisionResult;
        }

        if (firstSubtraction) {
          subtractionResult = multiplicationResult;
          firstSubtraction = false;
        } else {
          subtractionResult -= multiplicationResult;
        }
      }

      result += subtractionResult;
    }

    return result;
  }

  Future<void> _saveAnswer() async {
    List<String> answers =
        StorageManager.readData(DatabaseConstant.answers) ?? [];
    answers.add('${state.calculation ?? ''} = ${state.answer ?? ''}');
    await StorageManager.saveData(DatabaseConstant.answers, answers);
  }
}
