
import 'flutter_nfc_test_platform_interface.dart';

class FlutterNfcTest {
  Future<String?> getPlatformVersion() {
    return FlutterNfcTestPlatform.instance.getPlatformVersion();
  }
}
