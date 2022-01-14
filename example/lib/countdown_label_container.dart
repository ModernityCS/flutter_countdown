import 'package:flutter/material.dart';

/// The widget containing the data of a section of the Date(Years, Months, Days... etc) of the countdown
/// Parameters: [String] type, [String] time left
class CountdownLabel extends StatelessWidget {
  final String label;
  final int timeLeft;

  const CountdownLabel({Key? key, required this.label, required this.timeLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFDBE9F6)),
                    borderRadius: BorderRadius.circular(12)),
                child: Text(label, style: const TextStyle(fontSize: 16)))),
        const SizedBox(width: 10),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            decoration: BoxDecoration(
                color: const Color(0xFFDBE9F6),
                border: Border.all(color: const Color(0xFFDBE9F6)),
                borderRadius: BorderRadius.circular(12)),
            child: Text(timeLeft.toString().padLeft(2, '0'),
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)))
      ],
    );
  }
}
