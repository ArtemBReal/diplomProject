import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_nfc_kit_aurora_method_channel.dart';

abstract class FlutterNfcKitAuroraPlatform extends PlatformInterface {
  /// Constructs a FlutterNfcKitAuroraPlatform.
  FlutterNfcKitAuroraPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterNfcKitAuroraPlatform _instance = MethodChannelFlutterNfcKitAurora();

  /// The default instance of [FlutterNfcKitAuroraPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterNfcKitAurora].
  static FlutterNfcKitAuroraPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterNfcKitAuroraPlatform] when
  /// they register themselves.
  static set instance(FlutterNfcKitAuroraPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getDaemonInterfaceVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool?> getAdapterEnabled() {
    throw UnimplementedError('adapterEnabled() has not been implemented.');
  }
}
