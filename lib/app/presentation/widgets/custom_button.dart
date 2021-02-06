import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        text,
        style:
            Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),
      ),
      onPressed: onPressed,
    );
  }
}
