import 'dart:isolate';
import 'dart:ui';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static String _isolateName = 'isolate';
  static SendPort _uiSendPort;

  static void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    print('Alarm fired!');
    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }

  static Future<void> someTask() async {
    print('Updated data from the background isolate');
  }
}
