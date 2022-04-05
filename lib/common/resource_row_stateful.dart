import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';


class ResRow extends StatefulWidget {
  final String icon;
  int income = 0;
  bool status = true;
  int _stock = 0;
  List<bool> isSelected = [true, false];

  ResRow(this.icon, {Key? key}) : super(key: key);

  @override
  State<ResRow> createState() => _ResRowState();
}

class _ResRowState extends State<ResRow> {


  void _incrementIncome() {
    setState(() {
      widget.income++;
    });
  }

  _changeStockBy(int amount) {
    widget.status == true ?
      setState(() {
        widget._stock += amount;
      }) : setState(() {
        widget._stock -= amount;
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
          Text(widget.income.toString()),
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
          Text(widget._stock.toString()),
          FlutterSwitch(
            activeText: 'Earn',
            inactiveText: 'Spend',
            activeColor: Colors.green,
            inactiveColor: Colors.redAccent,
            width: 105.0,
            height: 45.0,
            valueFontSize: 15.0,
            toggleSize: 45.0,
            value: widget.status,
            borderRadius: 30.0,
            padding: 5.0,
            showOnOff: true,
            onToggle: (val) {
              setState(() {
                widget.status = val;
              });
            },
          ),
        ]
    );
  }
}
