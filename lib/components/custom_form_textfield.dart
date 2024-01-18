import 'package:flutter/material.dart';

class CustomFormTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String title;

  const CustomFormTextfield(
      {super.key, required this.controller, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(8.0),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }
}
