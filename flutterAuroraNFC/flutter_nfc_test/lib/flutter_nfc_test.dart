import 'package:flutter_nfc_test/nfcdDaemon.dart';

import 'package:dbus/dbus.dart';


class FlutterNFCTest {

  Future<int?> get interfaceVersion async {
    final client = DBusClient.system();

    final daemon = NFCDDaemonVersion(client, 'org.sailfishos.nfc.daemon', DBusObjectPath('/'),);

    final version = await daemon.callGetInterfaceVersion();

    await client.close();

    return version;
  }

}
