import 'package:flutter/material.dart';

class RegRow extends StatefulWidget {
  final String icon;
  late int _indicator = 0;
  late int colorCode;
  late Color c = Color(colorCode);

  RegRow(this.icon, this.colorCode, {Key? key}) : super(key: key);

  @override
  State<RegRow> createState() => _RegRowState();
}

class _RegRowState extends State<RegRow> {

  Future<void> _changeBy(int amount) async {
    if(amount > 0 || widget._indicator > 0) {
      setState(()
      {
        widget._indicator += amount;
      });
    }
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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle,
          color: widget.c
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Image.asset('''assets/'''+widget.icon+'''.png'''''),
              iconSize: 60,
              onPressed: null,
            ),
            Text(widget._indicator.toString(), textScaleFactor: 3),
            Column(
              children: [

                IconButton(
                  icon: Image.asset('assets/plus.png'),
                  iconSize: 50,
                  onPressed: () => _changeBy(1),
                ),
                IconButton(
                  icon: Image.asset('assets/minus.png'),
                  iconSize: 50,
                  onPressed: () => _changeBy(-1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
