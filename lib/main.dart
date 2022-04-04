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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome to Flutter'),
          ),
          body: Column(children: [
            res_row('gold'),
            res_row('plant'),
            res_row('heat'),
            Row(
              children: [
                res_row('card'),
                res_row('steel'),
              ],
            ),
            Row(
              children: [
                res_row('titanium'),
                res_row('card'),
              ],
            )
          ])),
    );
  }
}
