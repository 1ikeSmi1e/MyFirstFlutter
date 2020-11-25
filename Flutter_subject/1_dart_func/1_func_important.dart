main(List<String> args) {
// 以任意一个函数作为函数的参数

  // 传一个函数的定义作为参数
  // test(bar);

// 传一个匿名函数
  test((int a) {
    print("匿名函数被调用");
    return a;
  });

  // 3.箭头函数
  test((int a) => print("使用箭头函数作为参数"));

  // 4.测试特定函数类型作为参数
  test2((int num1, int num2) {
    return num1 + num2;
  });

  // 5. 测试函数作为返回值
  final funcReturned = test4(10);
  print(funcReturned(1, 2)); // 10+10*10

  print("连续调用函数结果： ${test4(20)(1, 2)}"); // 20+20*20
}

void test(Function foo) {
  final result = foo(10);
  print("$result + $foo");
}

void bar() {
  print("bar函数被调用");
}

// 将函数定义为一个类型
typedef Caculate = int Function(int a, int b);
void test2(Caculate cal) {
  final result = cal(10, 20);
  print("$result + $cal");
}

// 函数作为返回值
Caculate test4(int a) {
  final b = a * a;
  return (num1, num2) {
    return a + b;
  };
}
