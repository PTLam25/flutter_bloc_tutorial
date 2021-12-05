import 'dart:async';

Future<void> functionCanNotBeStopExample() async {
  try {
    await someLongFunction().timeout(const Duration(milliseconds: 350));
  } on TimeoutException {
    print('TimeoutException');
    return;
  }
}

Future<void> someLongFunction() async {
  final periodic = Stream<int>.periodic(
    const Duration(milliseconds: 250),
    (int element) {
      return element;
    },
  );

  await periodic.take(3).forEach((int element) {
    print(element);
  });
}
