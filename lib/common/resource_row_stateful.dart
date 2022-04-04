import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';


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
  bool status = true;


  void _incrementIncome() {
    setState(() {
      _income++;
    });
  }

  _changeStockBy(int amount) {
    status == true ?
      setState(() {
        _stock += amount;
      }) : setState(() {
        _stock -= amount;
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
            onPressed: () => _changeStockBy(1),
          ),
          IconButton(
            icon: Image.asset('assets/silver_cube.png'),
            iconSize: 50,
            onPressed: () => _changeStockBy(5),
          ),
          IconButton(
            icon: Image.asset('assets/gold_cube.png'),
            iconSize: 50,
            onPressed: () => _changeStockBy(10),
          ),
          Text(_stock.toString()),
          FlutterSwitch(
            activeText: 'Earn',
            inactiveText: 'Spend',
            activeColor: Colors.green,
            inactiveColor: Colors.redAccent,
            width: 105.0,
            height: 45.0,
            valueFontSize: 20.0,
            toggleSize: 45.0,
            value: status,
            borderRadius: 30.0,
            padding: 5.0,
            showOnOff: true,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
          ),
        ]
    );
  }
}
