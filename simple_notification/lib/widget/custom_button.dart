import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomButton({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      buttonColor: Colors.grey[300],
      minWidth: double.infinity,
      child: RaisedButton(
        child: Text(text),
        onPressed: onPressed,
      ),
    );
  }
}
