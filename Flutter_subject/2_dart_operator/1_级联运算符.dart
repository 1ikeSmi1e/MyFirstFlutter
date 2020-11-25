main(List<String> args) {
  final man = Person();
  man.name = "liyanhong ";
  man.run();
  man.eat();

  final girl = Person()
    ..name = "qingqing"
    ..eat()
    ..run();
}

class Person {
  String name;

  void run() {
    print("run");
  }

  void eat() {
    print("eating");
  }
}
