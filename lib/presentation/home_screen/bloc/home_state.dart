// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeScreenState extends Equatable {
  const HomeScreenState({
    this.answer = '',
    this.calculation = '',
    this.batteryLevel = 100,
    this.canEdit = false,
  });

  final String? answer;
  final String? calculation;
  final int batteryLevel;
  final bool canEdit;

  @override
  List<Object?> get props => [answer, calculation, batteryLevel, canEdit];

  HomeScreenState copyWith({
    String? answer,
    String? calculation,
    int? batteryLevel,
    bool? canEdit,
  }) {
    return HomeScreenState(
      answer: answer ?? this.answer,
      calculation: calculation ?? this.calculation,
      batteryLevel: batteryLevel ?? this.batteryLevel,
      canEdit: canEdit ?? this.canEdit,
    );
  }
}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenInProgress extends HomeScreenState {}

class HomeScreenLoadSucess extends HomeScreenState {
  const HomeScreenLoadSucess();
}
