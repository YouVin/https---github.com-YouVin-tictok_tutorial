import 'package:flutter/material.dart';
import 'package:tictok_tutorial/constants.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String laberText;
  final bool isObscure;
  final IconData icon;
  const TextInputField({
    Key? key,
    required this.controller,
    required this.icon,
    this.isObscure = false,
    required this.laberText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: laberText,
          prefixIcon: Icon(icon),
          labelStyle: const TextStyle(
            fontSize: 20,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: borderColor,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: borderColor,
              ))),
      obscureText: isObscure,
    );
  }
}
