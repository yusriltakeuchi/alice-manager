import 'package:alice/alice_get_connect.dart';
import 'package:alice/core/alice_core.dart';
import 'package:alice/model/alice_configuration.dart';
import 'package:alice/overlay_alice.dart';
import 'package:flutter/material.dart';

class AliceManager {
  static final instance = AliceManager();

  late AliceCore _aliceCore;
  AliceGetConnect? _aliceGetConnect;
  AliceGetConnect get aliceGetConnect {
    if (_aliceGetConnect == null) {
      throw 'must call init';
    }

    return _aliceGetConnect!;
  }

  void init(GlobalKey<NavigatorState> navigationKey) {
    final config = AliceConfiguration(
      showNotification: false,
      navigatorKey: navigationKey,
    );
    _aliceCore = AliceCore(configuration: config);
    _aliceGetConnect = AliceGetConnect(aliceCore: _aliceCore);
  }

  void showInspector() => _aliceCore.navigateToCallListScreen();

  void addEntryPoint(BuildContext context) =>
      OverlayAlice.insertOverlay(context);
}
