import 'dart:io';
import 'package:dbus/dbus.dart';


class NFCDDaemonVersion extends DBusRemoteObject {
 NFCDDaemonVersion(DBusClient client, String destination, DBusObjectPath path) : super(client, name: destination, path: path);


 Future<int> callGetInterfaceVersion({bool noAutoStart = false, bool allowInteractiveAuthorization = false}) async {
   var result = await callMethod('org.sailfishos.nfc.Daemon', 'GetDaemonVersion', [], replySignature: DBusSignature('u'), noAutoStart: noAutoStart, allowInteractiveAuthorization: allowInteractiveAuthorization);
   return result.returnValues[0].asUint32();
 }
}