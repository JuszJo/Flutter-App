import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
// import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<ui.Image> loadUiImage(String imageAssetPath) async {
  final ByteData data = await rootBundle.load(imageAssetPath);

  final Completer<ui.Image> completer = Completer();

  ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
    
    return completer.complete(img);
  });

  return completer.future;
}

double randomLocation() {
  FlutterView view = WidgetsBinding.instance.platformDispatcher.views.single;

  double width = view.physicalSize.width / view.devicePixelRatio;
  // double height = view.physicalSize.height / view.devicePixelRatio;

  return min(max(96, Random().nextDouble() * width), width - 96);
}