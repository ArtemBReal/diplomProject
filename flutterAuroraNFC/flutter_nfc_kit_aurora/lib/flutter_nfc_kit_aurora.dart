
import 'flutter_nfc_kit_aurora_platform_interface.dart';

class FlutterNfcKitAurora {
  Future<String?> getPlatformVersion() {
    return FlutterNfcKitAuroraPlatform.instance.getPlatformVersion();
  }

  Future<String?> getDaemonInterfaceVersion(){
    return FlutterNfcKitAuroraPlatform.instance.getDaemonInterfaceVersion();
  }

  Future<bool?> getAdapterEnabled(){
    return FlutterNfcKitAuroraPlatform.instance.getAdapterEnabled();
  }
}
