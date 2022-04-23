// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:ares_multipl_flutter/common/resource_row_stateful.dart';
import 'package:flutter/material.dart';
import 'common/reg_row.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static ResRow goldRow = ResRow('gold', 0xfff2e7c3);
  static ResRow plantRow = ResRow('plant', 0xffe5f6df);
  static ResRow heatRow = ResRow('heat', 0xfff5deb3);
  static RegRow cardRow = RegRow('card', 0xffadd8e6);
  static RegRow steelRow = RegRow('steel', 0xffc4a484);
  static RegRow titaniumRow = RegRow('titanium', 0xff949494);
  static RegRow trRow = RegRow('crown', 0xffe3e1d7);

  produce() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome to Flutter'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
