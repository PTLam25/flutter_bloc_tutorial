import 'dart:async';
import 'dart:isolate';

// 2-x направленная связь между родительским и дочерним изолятом
void runIsolateExample() async {
  final childIsolateSendPort = await initIsolate();

  childIsolateSendPort.send('Hello world 1');

  Future.delayed(
    const Duration(milliseconds: 2000),
    () {
      // This data will not be send to isolate it is killed after getting the first data
      childIsolateSendPort.send('Hello world 2');
    },
  );
}

Future<SendPort> initIsolate() async {
  // Completer - это объект, который управляет Future
  final childIsolateSendPort = Completer<SendPort>();

  final mainReceivePort = ReceivePort();

  late final StreamSubscription streamSubscription;
  streamSubscription = mainReceivePort.listen((Object? data) {
    if (data is SendPort) {
      final sendPort = data;
      childIsolateSendPort.complete(sendPort);
    } else {
      print('[Main isolate] $data');

      // cancel subscription in main isolate, so program can be exited
      streamSubscription.cancel();
    }
  });

  Isolate.spawn(createdIsolate, mainReceivePort.sendPort);

  return childIsolateSendPort.future;
}

void createdIsolate(SendPort mainSendPort) {
  // create receive port for child isolate
  final isolateReceivePort = ReceivePort();

  // send SendPort to main isolate, so we can send data from main isolate to child isolate
  mainSendPort.send(isolateReceivePort.sendPort);

  isolateReceivePort.listen((Object? data) {
    // get data from main isolate
    print('[Child isolate] $data');

    // send data back to main isolate
    mainSendPort.send(data);

    // kill child isolate after first event
    Isolate.current.kill();
    print('Child isolate was kill');
  });
}
