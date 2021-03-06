import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'widgets/initialization_widget.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InitializationWidget(),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) =>
      super.debugFillProperties(
        properties
          ..add(
            StringProperty(
              'description',
              'App StatelessWidget',
            ),
          ),
      );
}
