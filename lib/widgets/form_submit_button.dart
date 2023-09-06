import 'package:flutter/material.dart';

class FormSubmitButton extends StatelessWidget {
  String text;
  VoidCallback onPressed;

  FormSubmitButton(this.text, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Colors.white),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
        ));
  }
}
