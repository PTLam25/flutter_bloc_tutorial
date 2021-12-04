import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FirebaseCrashlyticsPage extends StatelessWidget {
  const FirebaseCrashlyticsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton(
            child: const Text('Call FirebaseCrashlytics crash'),
            onPressed: () {
              FirebaseCrashlytics.instance.crash();
            },
          ),
          ElevatedButton(
            child: const Text('Throw Error'),
            onPressed: () {
              throw Error();
            },
          ),
          ElevatedButton(
            child: const Text('Throw Exception'),
            onPressed: () {
              throw Exception('test exception');
            },
          ),
          ElevatedButton(
            child: const Text('Handle Error (fatal error)'),
            onPressed: () async {
              try {
                throw Error();
              } catch (error, stackTrace) {
                await FirebaseCrashlytics.instance.recordError(
                  error,
                  stackTrace,
                  reason: 'fatal error',
                  fatal: true,
                );
              }
            },
          ),
          ElevatedButton(
            child: const Text('Handle Exception (non-fatal error)'),
            onPressed: () async {
              try {
                throw Exception('Test Exception');
              } catch (error, stackTrace) {
                await FirebaseCrashlytics.instance.recordError(
                  error,
                  stackTrace,
                  reason: 'non-fatal error',
                );
              }
            },
          ),
          ElevatedButton(
            child: const Text('Log message to the FirebaseCrashlytics'),
            onPressed: () {
              FirebaseCrashlytics.instance
                  .log("Higgs-Boson detected! Bailing out");
            },
          ),
        ],
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
              'FirebaseCrashlyticsPage StatelessWidget',
            ),
          ),
      );
}
