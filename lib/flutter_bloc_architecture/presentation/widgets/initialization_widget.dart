import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/flutter_bloc_architecture/application/initialization_bloc/initialization_bloc.dart';
import 'package:flutter_bloc_tutorial/flutter_bloc_architecture/presentation/pages/authentication_page.dart';
import 'package:flutter_bloc_tutorial/flutter_bloc_architecture/presentation/pages/splash_page.dart';

class InitializationWidget extends StatelessWidget {
  const InitializationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InitializationBloc>(
      create: (BuildContext context) =>
          InitializationBloc()..add(InitializationStarted()),
      child: BlocListener<InitializationBloc, InitializationState>(
        listenWhen:
            (InitializationState previous, InitializationState current) {
          return current is InitializationInitializedState;
        },
        listener: (BuildContext context, InitializationState state) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AuthenticationPage()),
          );
        },
        child: const SplashPage(),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) =>
      super.debugFillProperties(
        properties
          ..add(
            StringProperty(
              'description',
              'InitializationWidget StatelessWidget',
            ),
          ),
      );
}
