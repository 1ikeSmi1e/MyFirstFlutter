import 'dart:async';
import 'dart:io';

import 'dart:isolate';

main(List<String> args) {
  // testMian();
  testIsolate();
  // // 先添加几个异步任务，再添加微任务，测试会不会先执行微任务
  // testScheduleEvent().then((value) => print(value));

  // scheduleMicrotask(() {
  //   print('scheduleMicrotask!--');
  // });
}

// 测试隔离区
void testIsolate() {
  Isolate.spawn(foo, 'message111');
}

void foo(info) {
  print("新的isolate：$info");
}

void testFuture() {
// future_1加入到eventqueue中，紧随其后then_1被加入到eventqueue中
  Future(() => print("future_1")).then((_) => print("then_1"));

// Future没有函数执行体，then_2被加入到microtaskqueue中
  Future(() => null).then((_) => print("then_2"));

// future_3、then_3_a、then_3_b依次加入到eventqueue中
  Future(() => print("future_3"))
      .then((_) => print("then_3_a"))
      .then((_) => print("then_3_b"));

  print('main end-----');
}

void testMian() {
  print("main start");

  Future(() => print("task1"));

  final future = Future(() => null);

  Future(() => print("task2")).then((_) {
    print("task3");
    scheduleMicrotask(() => print('task4'));
  }).then((_) => print("task5"));

  future.then((_) => print("task6"));
  scheduleMicrotask(() => print('task7'));

  Future(() => print('task8'))
      .then((_) => Future(() => print('task9')))
      .then((_) => print('task10'));

  print("main end");
}

Future testScheduleEvent() async {
  await sleep(Duration(seconds: 2));
  return 'hello dart';
}
