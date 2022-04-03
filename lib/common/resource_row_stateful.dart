import 'package:ares_multipl_flutter/common/toggler.dart';
import 'package:flutter/material.dart';

class res_row extends StatefulWidget {
  final String icon;

  const res_row(this.icon);

  @override
  State<res_row> createState() => _res_rowState();
}

class _res_rowState extends State<res_row> {
  int _income = 0;
  int _stock = 0;
  List<bool> isSelected = [true, false];

  void _incrementIncome() {
    setState(() {
      _income++;
    });
  }

  void _incrementOne() {
    setState(() {
      _stock ++;
    });
  }

  void _incrementFive() {
    setState(() {
      _stock += 5;
    });
  }

  void _incrementTen() {
    setState(() {
      _stock += 10;
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
            onPressed: _incrementIncome,
          ),
          Text(_income.toString()),
          IconButton(
            icon: Image.asset('assets/bronze_cube.png'),
            iconSize: 50,
            onPressed: _incrementOne,
          ),
          IconButton(
            icon: Image.asset('assets/silver_cube.png'),
            iconSize: 50,
            onPressed: _incrementFive,
          ),
          IconButton(
            icon: Image.asset('assets/gold_cube.png'),
            iconSize: 50,
            onPressed: _incrementTen,
          ),
          Text(_stock.toString()),
          Toggler()
        ]
    );
  }
}
