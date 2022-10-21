import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
 @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
   print('onEvent $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    print('onEvent $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('onEvent $transition');
    super.onTransition(bloc, transition);
  }
}