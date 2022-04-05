import 'package:flutter/material.dart';

class RegRow extends StatefulWidget {
  final String icon;

  const RegRow(this.icon);

  @override
  State<RegRow> createState() => _RegRowState();
}

class _RegRowState extends State<RegRow> {
  int _indicator = 0;
  int amount = 0;

  void _changeBy(int amount) {
    setState(() {
      _indicator += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Image.asset('''assets/'''+widget.icon+'''.png'''''),
          iconSize: 60,
          onPressed: null,
        ),
        IconButton(
          icon: Image.asset('assets/plus.png'),
          iconSize: 50,
          onPressed: () => _changeBy(1),
        ),
        Text(_indicator.toString()),
        IconButton(
          icon: Image.asset('assets/minus.png'),
          iconSize: 50,
          onPressed: () => _changeBy(-1),
        ),
      ],
    );
  }
}
