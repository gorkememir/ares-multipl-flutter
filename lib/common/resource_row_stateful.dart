import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';


class ResRow extends StatefulWidget {
  final String icon;
  int income = 0;
  bool status = true;
  int _stock = 0;
  List<bool> isSelected = [true, false];
  late int colorCode;
  late Color c = Color(colorCode);

  ResRow(this.icon, this.colorCode, {Key? key}) : super(key: key);

  @override
  State<ResRow> createState() => _ResRowState();
}

class _ResRowState extends State<ResRow> {

  void _incrementIncome() {
    setState(() {
      widget.income++;
    });
  }

  Future<void> _decrementIncome() async {
    if(widget.income > 0) {
    setState(()
    {
      widget.income--;
    });}
    else {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Income cannot be less than zero'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
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
    return Container(
      margin: EdgeInsets.all(4),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle,
          color: widget.c
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: IconButton(
                icon: Image.asset('''assets/'''+widget.icon+'''.png'''''),
                onPressed: null,
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Image.asset('assets/plus.png'),
                  iconSize: 50,
                  onPressed: _incrementIncome,
                ),
                IconButton(
                  icon: Image.asset('assets/minus.png'),
                  iconSize: 50,
                  onPressed: _decrementIncome,
                ),
              ],
            ),
            Text(widget.income.toString(), textScaleFactor: 3),
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
            Text(widget._stock.toString(), textScaleFactor: 3),
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
      ),
    );
  }
}

