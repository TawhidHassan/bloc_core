part of 'weathers_bloc.dart';

@immutable
abstract class WeathersEvent extends Equatable {
  const WeathersEvent();
}

class FetchWeather extends WeathersEvent {
  final String? city;

  FetchWeather({ this.city}) : assert(city != null);

  @override
  List<Object> get props => [city!];
}

class RefreshWeather extends WeathersEvent {
  final String? city;

  const RefreshWeather({ this.city}) : assert(city != null);

  @override
  List<Object> get props => [city!];
}

class ResetWeather extends WeathersEvent {
  @override
  List<Object> get props => [];
}