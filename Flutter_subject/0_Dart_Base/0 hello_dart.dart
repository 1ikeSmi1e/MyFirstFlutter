main(List<String> args) {
  // print("Hello Word");

  // 1. 明确的声明，直接写一个类型
  String name = "zlq";
  String name111 = 'zlq';
  name = null;
  print(name);

  name = name ?? "阿三";
  print(name);

  name = null;
  name ??= "变量没有值则赋值为??=后面的值";
  print(name);

  //2. var/final/const

  // 2.类型推导(var/final/const)
  // 类型推导的方式虽然没有明确的指定变量的类型, 但是变量是有自己的明确的类型
  // 2.1.var声明变量
  var age = 20;
  // age = "abc";
  age = 30;

  final time  = DateTime.now();

  // 2.2.final声明常量
  final height = 1.88;
  // height = 2.00;˜

  // 2.3.const声明常量
  const address = "广州市";
  // address = "北京市";

  // 2.4.final和const的区别
  // const必须赋值 常量值(编译期间需要有一个确定的值)
  // final可以通过计算/函数获取一个值(运行期间来确定一个值)
  // const date1 = DateTime.now(); 写法错误
  final date2 = DateTime.now();

  // final用于的更多一点
  // p1和p2是不是同一个对象
  // final p1 = Person("why");
  // final p2 = Person("why");
  // print(identical(p1, p2));

  // 在Dart2.0之后, const可以省略
  const p1 =  Person("why");
  const p2 =  Person("why");
  const p3 =  Person("lilei");

  print(identical(p1, p2));
  print(identical(p2, p3));

  // dynamic/Object
}

class Person {
  final String name;
  const Person(this.name);
}

// 字符串

// 数组 + 集合 + map操作

// 函数 （返回值，必选参数，可选参数）

// 函数作为参数，箭头函数，匿名函数，函数作为函数调用返回值

// 运算符：??= 原来变量有值不执行，没有值就是新值；??表示为空则为后面的值

// for循环

// 类的定义，构造函数语法糖， 命名构造函数

// Object和Dynamic的区别， 打印类具体信息toString

// 初始化列表

//
