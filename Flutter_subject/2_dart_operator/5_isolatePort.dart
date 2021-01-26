import 'dart:isolate';

main(List<String> args) async {
  ReceivePort port = ReceivePort();

  Isolate isolate = await Isolate.spawn(foo, port.sendPort);

  port.listen((message) {
    print('message: $message');

    port.close();

    isolate.kill(priority: Isolate.immediate);
  });

  port.sendPort.send('kill----message');
}

void foo(SendPort sendPort) {
  sendPort.send("Hello World");
}
