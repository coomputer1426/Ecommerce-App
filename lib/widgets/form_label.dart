import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  String label;

  FormLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(color: Colors.white, fontSize: 18),
    );
  }
}
