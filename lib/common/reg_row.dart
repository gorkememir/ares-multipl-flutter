import 'package:flutter/material.dart';

class RegRow extends StatefulWidget {
  final String icon;
  int _indicator = 0;
  late int colorCode;
  late Color c = Color(colorCode);

  RegRow(this.icon, this.colorCode, {Key? key}) : super(key: key);

  @override
  State<RegRow> createState() => _RegRowState();
}

class _RegRowState extends State<RegRow> {

  void _changeBy(int amount) {
    setState(() {
      widget._indicator += amount;
    });
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
            IconButton(
              icon: Image.asset('assets/plus.png'),
              iconSize: 50,
              onPressed: () => _changeBy(1),
            ),
            Text(widget._indicator.toString()),
            IconButton(
              icon: Image.asset('assets/minus.png'),
              iconSize: 50,
              onPressed: () => _changeBy(-1),
            ),
          ],
        ),
      ),
    );
  }
}
