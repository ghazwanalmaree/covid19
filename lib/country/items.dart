import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Items extends StatelessWidget {
  final String textKey;
  final int textValue;

  Items({required this.textKey, required this.textValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          KeyColumn(theKeys: textKey),
          SizedBox(
            width: 20,
          ),
          ValueColumn(value: textValue)
        ],
      ),
    );
  }
}

class KeyColumn extends StatelessWidget {
  final String theKeys;

  KeyColumn({required this.theKeys});

  @override
  Widget build(BuildContext context) {
    return Text(
      theKeys,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
}

class ValueColumn extends StatelessWidget {
  final int value;

  ValueColumn({required this.value});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$value",
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
}
