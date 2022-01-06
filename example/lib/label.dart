import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final int number;
  final String label;

  const Label({Key? key, required this.number, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Text(number.toString(),
                textAlign: TextAlign.end,
                style: const TextStyle(
                    fontSize: 50,
                    color: Color(0xFF0B0B0D),
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 12),
          SizedBox(
              child: Text(label,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 30,
                      color: Color(0xFF0B0B0D),
                      fontWeight: FontWeight.w500)))
        ]);
  }
}
