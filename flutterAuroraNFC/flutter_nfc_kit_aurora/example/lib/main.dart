import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_nfc_kit_aurora/flutter_nfc_kit_aurora.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _daemonInterfaceVersion = 'Unknown';
  String _adapterInterfaceVersion = 'Unknown';
  bool _adapterEnabled = false;
  final _flutterNfcKitAuroraPlugin = FlutterNfcKitAurora();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _flutterNfcKitAuroraPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    String daemonInterfaceVersion;
    try {
      daemonInterfaceVersion =
          await _flutterNfcKitAuroraPlugin.getDaemonInterfaceVersion() ?? 'Unknown daemon interface version';
    } on PlatformException {
      daemonInterfaceVersion = 'Failed to get daemon interface version.';
    }

    bool? adapterEnabled;
    try {
      adapterEnabled =
          (await _flutterNfcKitAuroraPlugin.getAdapterEnabled() ?? false);
    } on PlatformException {
      adapterEnabled = false;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _daemonInterfaceVersion = daemonInterfaceVersion;
      _platformVersion = platformVersion;
      //_adapterInterfaceVersion = adapterInterfaceVersion;
      _adapterEnabled = adapterEnabled!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Nfcd daemon version: $_daemonInterfaceVersion\n Nfcd adapter enabled: $_adapterEnabled\n'),
        ),
      ),
    );
  }
}
