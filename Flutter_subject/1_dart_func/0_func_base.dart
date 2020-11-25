main(List<String> args) {
  int sums = sum(10, 15);
  print(sums);

  optionParams("dandy", null, 165);
  optionParams("dandy", 27);
  optionParams_name("dandy", height: 165);

}

int sum(int a, int b) {
  return a * b;
}

// 位置可选参数
int optionParams(String name, [int age, double height]) {
  print("optionParams---");
  if (name != null) {
    print(name);
  }
  if (age != null) {
    print(age);
  }

  if (height != null) {
    print(height);
  }
}

// 命名可选参数
int optionParams_name(String name, {int age, double height}) {
  print("optionParams_name---");
  if (name != null) {
    print(name);
  }
  if (age != null) {
    print(age);
  }

  if (height != null) {
    print(height);
  }
}
