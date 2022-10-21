part of 'weathers_bloc.dart';

@immutable
abstract class WeathersState extends Equatable {
  const WeathersState();
}

class WeathersInitial extends WeathersState {
  @override
  List<Object> get props => [];
}

class WeatherEmpty extends WeathersState {

  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeathersState {
  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeathersState {
  final Weather? weather;

  WeatherLoaded({this.weather}) : assert(weather != null);

  @override
  List<Object> get props => [weather!];
}

class WeatherError extends WeathersState {

  @override
  List<Object> get props => [];
}