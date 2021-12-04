part of 'initialization_bloc.dart';

abstract class InitializationState extends Equatable {
  const InitializationState();
}

class InitializationInitial extends InitializationState {
  @override
  List<Object> get props => [];
}

class InitializationInProgressState extends InitializationState {
  final double progressValue;

  const InitializationInProgressState(this.progressValue);
  
  @override
  List<Object> get props => [progressValue];
}

class InitializationInitializedState extends InitializationState {
  @override
  List<Object> get props => [];
}
