import 'dart:async';

void runEventLoopExample() async {
  Future<void>.delayed(const Duration(seconds: 1), () {
    print(1);
  });

  Future<void>.delayed(Duration.zero, () {
    print(2);
  });

  Future<void>(() {
    print(3);
    // then is synchronous code, so it will execute immediately after his previous future function
  }).then((_) {
    print(4);
  });

  // Future.sync run as sync code but wrap result with Future
  Future<void>.sync(() {
    print(5);
  });

  Future<void>(() {
    print(6);
    // whenComplete is then but does not accept the previous result
  }).whenComplete(() {
    print(7);
  });

  Future<void>.microtask(() {
    print(8);
  });

  print(9);

  Future<void>.microtask(() {
    print(10);
  });

  Future<void>.sync(() {
    print(11);
  });

  Future<void>(() {
    print(12);
  });

  Future<void>.delayed(Duration.zero, () {
    print(13);
  });

  Future<void>.delayed(const Duration(seconds: 1), () {
    print(14);
  });

  // without await print(21) will be executed after all sync code in customFuture will be executed
  customFuture();
  // adding await before customFuture will delay print(21)
  // before all sync and await code in customFuture will be executed
  // await customFuture();

  print(21);
}

Future<void> customFuture() async {
  print(16);

  await Future<void>.delayed(const Duration(seconds: 2), () {
    print(17);
  });

  Future<void>.delayed(Duration.zero, () {
    print(17);
  });

  Future<void>.sync(() {
    print(18);
  });

  Future<void>.microtask(() {
    print(19);
  });

  print(20);
}
