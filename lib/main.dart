// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:ares_multipl_flutter/common/resource_row_stateful.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static ResRow goldRow = ResRow('gold');
  static ResRow plantRow = ResRow('plant');
  static ResRow heatRow = ResRow('heat');
  static ResRow cardRow = ResRow('card');
  static ResRow steelRow = ResRow('steel');
  static ResRow titaniumRow = ResRow('titanium');
  static ResRow trRow = ResRow('crown');

  produce () {

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome to Flutter'),
          ),
          body: Column(children: [
            goldRow,
            plantRow,
            heatRow,
            Row(
              children: [
                cardRow,
                steelRow,
              ],
            ),
            Row(
              children: [
                titaniumRow,
                trRow,
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Colors.greenAccent,
                            Colors.lightGreen,
                            Colors.green,
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(30.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    child: const Text('Produce!'),
                  ),
                ],
              ),
            ),
          ])
      ),
    );

  }
}
