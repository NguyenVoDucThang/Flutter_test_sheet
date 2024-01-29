part of 'home_bloc.dart';

class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List<Object> get props => [];
}

class HomeScreenInitted extends HomeScreenEvent {
  const HomeScreenInitted();
}

class HomeScreenButtonClicked extends HomeScreenEvent {
  const HomeScreenButtonClicked({
    required this.value,
  });

  final String value;
}

class HomeScreenBatteryLevelChanged extends HomeScreenEvent {
  const HomeScreenBatteryLevelChanged({
    required this.batteryLevel,
  });

  final int batteryLevel;
}