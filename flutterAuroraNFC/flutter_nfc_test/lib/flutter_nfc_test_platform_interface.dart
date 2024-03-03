import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_nfc_test_method_channel.dart';

abstract class FlutterNfcTestPlatform extends PlatformInterface {
  /// Constructs a FlutterNfcTestPlatform.
  FlutterNfcTestPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterNfcTestPlatform _instance = MethodChannelFlutterNfcTest();

  /// The default instance of [FlutterNfcTestPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterNfcTest].
  static FlutterNfcTestPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterNfcTestPlatform] when
  /// they register themselves.
  static set instance(FlutterNfcTestPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
