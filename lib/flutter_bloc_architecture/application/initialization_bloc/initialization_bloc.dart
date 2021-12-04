import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../injection.dart' as di;

part 'initialization_event.dart';

part 'initialization_state.dart';

/// Initialize all injections here instead of in the main method,
/// so Flutter application appear to screen faster
class InitializationBloc
    extends Bloc<InitializationEvent, InitializationState> {
  InitializationBloc() : super(InitializationInitial()) {
    on<InitializationStarted>(_onInitializationStarted);
  }

  void _onInitializationStarted(
    InitializationStarted event,
    Emitter<InitializationState> emit,
  ) async {
    await di.configureInjection();

    emit(InitializationInitializedState());
  }
}
