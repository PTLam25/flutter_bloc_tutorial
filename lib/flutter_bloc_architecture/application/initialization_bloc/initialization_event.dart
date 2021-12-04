part of 'initialization_bloc.dart';

abstract class InitializationEvent extends Equatable {
  const InitializationEvent();
}

class InitializationStarted extends InitializationEvent {
  @override
  List<Object> get props => [];
}
