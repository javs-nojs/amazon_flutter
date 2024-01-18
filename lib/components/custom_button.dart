import 'package:amazon_flutter/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          backgroundColor: GlobalVariables.secondaryColor,
          minimumSize: const Size(double.infinity, 60.0)),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );
  }
}
