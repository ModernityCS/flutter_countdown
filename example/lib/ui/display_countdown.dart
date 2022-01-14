import 'package:example/widgets/countdown_label_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown/flutter_countdown.dart';

class DisplayCountdownUI extends StatelessWidget {
  final DisplaySettings displaySettings;
  final CountdownResults results;

  const DisplayCountdownUI(
      {Key? key, required this.displaySettings, required this.results})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        displaySettings.years
            ? CountdownLabel(timeLeft: results.years, label: "Years")
            : const SizedBox(),
        displaySettings.months
            ? CountdownLabel(timeLeft: results.months, label: "Months")
            : const SizedBox(),
        displaySettings.weeks
            ? CountdownLabel(timeLeft: results.weeks, label: "Weeks")
            : const SizedBox(),
        displaySettings.days
            ? CountdownLabel(timeLeft: results.days, label: "Days")
            : const SizedBox(),
        displaySettings.hours
            ? CountdownLabel(timeLeft: results.hours, label: "Hours")
            : const SizedBox(),
        displaySettings.minutes
            ? CountdownLabel(timeLeft: results.minutes, label: "Minutes")
            : const SizedBox(),
        displaySettings.seconds
            ? CountdownLabel(timeLeft: results.seconds, label: "Seconds")
            : const SizedBox(),
      ],
    );
  }
}
