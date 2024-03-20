import 'package:flutter/material.dart';

import 'package:flutter_nfc_test/flutter_nfc_test.dart';

import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _interfaceVersion = 0;
  final _nfcdDaemon = FlutterNFCTest();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    int? interfaceVersion;
    try {
      interfaceVersion = await _nfcdDaemon.interfaceVersion ?? _interfaceVersion;
    } catch (e) {
      interfaceVersion = e as int?;
    }

    if (!mounted) return;

    setState(() {
      _interfaceVersion = interfaceVersion!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dart package example'),
        ),
        body: Center(
          child: Text('NFC Interface Version: $_interfaceVersion\n'),
        ),
      ),
    );
  }
}