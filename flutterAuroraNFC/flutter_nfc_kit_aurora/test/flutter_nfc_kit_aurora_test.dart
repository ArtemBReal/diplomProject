import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_nfc_kit_aurora/flutter_nfc_kit_aurora.dart';
import 'package:flutter_nfc_kit_aurora/flutter_nfc_kit_aurora_platform_interface.dart';
import 'package:flutter_nfc_kit_aurora/flutter_nfc_kit_aurora_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterNfcKitAuroraPlatform
    with MockPlatformInterfaceMixin
    implements FlutterNfcKitAuroraPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterNfcKitAuroraPlatform initialPlatform = FlutterNfcKitAuroraPlatform.instance;

  test('$MethodChannelFlutterNfcKitAurora is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterNfcKitAurora>());
  });

  test('getPlatformVersion', () async {
    FlutterNfcKitAurora flutterNfcKitAuroraPlugin = FlutterNfcKitAurora();
    MockFlutterNfcKitAuroraPlatform fakePlatform = MockFlutterNfcKitAuroraPlatform();
    FlutterNfcKitAuroraPlatform.instance = fakePlatform;

    expect(await flutterNfcKitAuroraPlugin.getPlatformVersion(), '42');
  });
}
