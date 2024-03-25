import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_nfc_kit_aurora_platform_interface.dart';

/// An implementation of [FlutterNfcKitAuroraPlatform] that uses method channels.
class MethodChannelFlutterNfcKitAurora extends FlutterNfcKitAuroraPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_nfc_kit_aurora');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getDaemonInterfaceVersion() async {
    final version = await methodChannel.invokeMethod<String>('getDaemonInterfaceVersion');
    return version;
  }
}
