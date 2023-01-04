import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const Answer(this.text, this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(
        child: Text(text),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(primary: Colors.blue),
      ),
    );
  }
}
