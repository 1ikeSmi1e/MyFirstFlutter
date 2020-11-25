main(List<String> args) {
  final gesRecognize = GestureRecognizer();

  final tapGesture = TapGestureRecognizer.init();
  print(gesRecognize);
  print(tapGesture);

  final tapGest = TapGestureRecognizer.init();
  tapGest.addTragetFor("tapGestsure", "event");
}

abstract class GestureRecognizer {
  // final touces;
  String getInfo() {
    return "抽象类info";
  }

  factory GestureRecognizer() {
    return null;
  }
}

class ControlEvent {
  int addTragetFor(String target, String event) {
    print("target observer for event");
    return 1;
  }
}

//  GestureRecognizer的子类
class TapGestureRecognizer extends GestureRecognizer implements ControlEvent {
  @override
  String getInfo() {
    // TODO: implement getInfo
    return super.getInfo();
  }

  factory TapGestureRecognizer.init() {
    TapGestureRecognizer ges = GestureRecognizer();
    print("ges ==  $ges");
    return ges;
  }

  @override
  int addTragetFor(String target, String event) {
    // TODO: implement addTragetFor

    print("TapGestureRecognizer implements target observer for event method");
    return 1;
  }
}
