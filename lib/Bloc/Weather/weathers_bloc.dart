import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../weather.dart';
import '../../weatherRepository.dart';

part 'weathers_event.dart';
part 'weathers_state.dart';

class WeathersBloc extends Bloc<WeathersEvent, WeathersState> {
   WeatherRepository? weatherRepository=WeatherRepository();
  WeathersBloc() : super(WeathersInitial()) {

    ///if go with this approch
    ///Stream<WeathersState> mapEventToState(WeathersEvent event) async*{   ///hide this functions
    // on<FetchWeather>((event, emit)async{
    //   emit(WeatherLoading()) ;
    //   try {
    //     final Weather weather = await weatherRepository!.getWeather(event.city!);
    //     emit( WeatherLoaded(weather: weather));
    //   } catch (error) {
    //     print(error);
    //     emit( WeatherError());
    //   }
    // });
    //
    // on<RefreshWeather>((event, emit)async{
    //   emit(WeatherLoading()) ;
    //   try {
    //     final Weather weather = await weatherRepository!.getWeather(event.city!);
    //     emit (WeatherLoaded(weather: weather));
    //   } catch (error) {
    //     print("Error" + error.toString());
    //     emit (state);
    //   }
    // });
    //
    // on<ResetWeather>((event, emit)async{
    //   emit(WeatherLoading()) ;
    //   emit(WeatherEmpty());
    // });

  }

  @override
  Stream<WeathersState> mapEventToState(WeathersEvent event) async*{
    // TODO: implement mapEventToState
    if (event is FetchWeather) {
      yield WeatherLoading();
      try {
        final Weather weather = await weatherRepository!.getWeather(event.city!);
        yield WeatherLoaded(weather: weather);
      } catch (error) {
        print(error);
        yield WeatherError();
      }
    } else if (event is RefreshWeather) {
      try {
        final Weather weather = await weatherRepository!.getWeather(event.city!);
        yield WeatherLoaded(weather: weather);
      } catch (error) {
        print("Error" + error.toString());
        yield state;
      }
    } else if (event is ResetWeather) {
      yield WeatherEmpty();
    }
  }
}
