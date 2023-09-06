import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class CustomFormTextField extends StatelessWidget {
  String hint;
  Validator? validator;
  bool hideText, obscure;
  Widget? suffIcon;
  TextEditingController? controller;
  TextInputType? keyboardType;

  CustomFormTextField(this.hint,
      {super.key,
      this.validator,
      this.controller,
      this.hideText = false,
      this.keyboardType = TextInputType.text,
      this.obscure = false,
      this.suffIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15, top: 5),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hint,
            suffixIcon: suffIcon,
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            constraints: const BoxConstraints(maxHeight: 50)),
        validator: validator,
        obscureText: obscure,
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
