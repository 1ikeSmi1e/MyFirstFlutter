import 'dart:io';

main(List<String> args) {

// print("Future 之前---");
//   // 异步调用
//   Future((){

//     print("第一个future任务！"); 
//     sleep(Duration(seconds: 2));
//     return 1;
//   }).then((lastResult){

// // throw Exception("第二个任务抛出异常");
//     print("lastResult = $lastResult");
//     return "hello flutter";
//   }).catchError((error){

//     print("捕获异常：$error");
//   });
//   print("Future 之后---");


  testAwait();
  print("main函数中testAwait调用之后");
}


Future<void> testAwait() async {
  final result = await 'await string';
  print("await 之后调用");
  return result;
}

void testGeneric(){
  var names = List<String>();
  names.addAll(['abc', "dasf", "fdsa"]);
  names.add("234");

  print(names);
}