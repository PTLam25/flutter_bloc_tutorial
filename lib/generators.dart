void callGeneratorExamples() async {
  for (int value in generatorSync1()) {
    print(value);
  }
  print('finish sync generator');
  await for (int value in generatorAsync1()) {
    print(value);
  }
}

Stream<int> generatorAsync1() async* {
  yield 1;
  yield 2;
  yield 3;
  yield* generatorAsync2();
  yield* Stream<int>.periodic(const Duration(seconds: 1), (_) {
    return 100;
  });
}

Stream<int> generatorAsync2() async* {
  yield 4;
  yield 5;
  yield 6;
}

Iterable<int> generatorSync1() sync* {
  yield 1;
  yield 2;
  yield 3;
  yield* generatorSync2();
}

Iterable<int> generatorSync2() sync* {
  yield 4;
  yield 5;
  yield 6;
}