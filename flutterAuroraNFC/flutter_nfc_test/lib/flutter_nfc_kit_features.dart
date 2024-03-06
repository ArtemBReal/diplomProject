import 'package:dbus/dbus.dart';

class FlutterNFCFeatures extends DBusRemoteObject {
  FlutterNFCFeatures(
      DBusClient client, String destination, DBusObjectPath path)
      : super(client, name: destination, path: path);

  
  Future<String> callGetDeviceModel(
      {bool noAutoStart = false,
      bool allowInteractiveAuthorization = false}) async {
    var result = await callMethod(
        'org.sailfishos.nfc.NDEF', 'GetTags', [],
        replySignature: DBusSignature('s'),
        noAutoStart: noAutoStart,
        allowInteractiveAuthorization: allowInteractiveAuthorization);
    return result.returnValues[0].asString();
  }
}

