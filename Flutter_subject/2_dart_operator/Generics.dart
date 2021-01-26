import 'dart:io';

main(List<String> args) {
  print("Future 之前---");
  // 异步调用
  Future(() {
    print("第一个future任务！");
    sleep(Duration(seconds: 2));
    return 1;
  }).then((lastResult) {
    // throw Exception("第二个任务抛出异常");
    print("lastResult = $lastResult");
    return "hello flutter";
  }).catchError((error) {
    print("捕获异常：$error");
  }).whenComplete(() => print('whenComplete---'));
  print("Future 之后---");

  testAwait().then((value) {
    print('testAwait调用的结果$value');
  });
  print("main函数中testAwait调用之后");

  testAwait2();

  Future.value('哈哈哈').then((value) => print(value));
}

Future<String> testAwait() async {
  final result = await 'await string';
  print("testAwait函数中await 之后调用");
  return result;
}

void testAwait2() async {
  final result = await 'await string';
  print("testAwait2函数中await 之后调用");
  // return result;
}

void testGeneric() {
  var names = List<String>();
  names.addAll(['abc', "dasf", "fdsa"]);
  names.add("234");

  print(names);
}
