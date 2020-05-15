import 'package:flutter/material.dart';
import 'package:worldclock/constants/constants.dart';

class FancyButton extends StatelessWidget {
  final String label;
  final Function onPress;
  final LinearGradient gradient;

  FancyButton({this.label, this.onPress, this.gradient});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.white, width: 2.0),
      ),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Container(
          width: 120.0,
          height: 50.0,
          alignment: Alignment.center,
          child: Text(
            '$label',
            style: TextStyle(
              color: Color(purple),
              fontFamily: 'Varela',
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      onPressed: onPress,
    );
  }
}
