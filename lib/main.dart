// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// You can read about packages here: https://flutter.io/using-packages/
import 'package:first_flutter_app/location_detail/location_detail.dart';
import 'package:first_flutter_app/style.dart';
import 'package:flutter/material.dart';

import 'location_list/location_list.dart';

void main() {
  runApp(UnitConverterApp());
}

const LocationListRoute = '/';
const LocationDetailsRoute = '/location_detail';

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;

      Widget screen;
      switch (settings.name) {
        case LocationListRoute:
          screen = LocationList();
          break;
        case LocationDetailsRoute:
          screen = LocationDetail(arguments['id']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  _theme() {
    return ThemeData(
        appBarTheme: AppBarTheme(textTheme: TextTheme(title: AppBarTextStyle)),
        textTheme: TextTheme(
          title: TitleTextStyle,
          body1: Body1TextStyle,
          subtitle: SubTitleTextStyle,
          caption: CaptionTextStyle,
        ));
  }
}
