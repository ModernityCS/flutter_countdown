import 'dart:async';

import 'package:example/widgets/change_countdown_datetime.dart';
import 'package:example/widgets/change_display_settings.dart';
import 'package:example/ui/display_countdown.dart';
import 'package:flutter_countdown/flutter_countdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountdownUI extends StatefulWidget {
  const CountdownUI({Key? key}) : super(key: key);

  @override
  _CountdownUIState createState() => _CountdownUIState();
}

class _CountdownUIState extends State<CountdownUI> {
  /// CountdownUIResults: Where the CountdownUI values are being store
  CountdownResults results = CountdownResults();
  late DisplaySettings displaySettings;

  /// Display and countdown controllers
  DateTime end = DateTime(2030, 03, 14, 11, 00);
  String _displayCurrentDateTime = "--";
  String _displayCountdownTime = "--";

// update the state of the build every second
  void periodicProcess() {
    countdown = Countdown(endDate: end, displaySettings: displaySettings);

    /// Update each second
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      DateTime now = DateTime.now();

      setState(() {
        countdown = Countdown(endDate: end, displaySettings: displaySettings);
        _displayCurrentDateTime =
            "${now.year}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}, ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
        _displayCountdownTime =
            "${end.year}/${end.month.toString().padLeft(2, '0')}/${end.day.toString().padLeft(2, '0')}, ${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}";

        results = countdown.countdown();
      });
    });
  }

  late Countdown countdown;
  @override
  void initState() {
    displaySettings = DisplaySettings(months: false, weeks: false);

    periodicProcess();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Demo",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 24)),
                        GestureDetector(
                            onTap: () async {
                              end = await SelectDateTime.showAlertDialog(
                                  context, end);
                              countdown = Countdown(
                                  endDate: end,
                                  displaySettings: displaySettings);
                            },
                            child: const Icon(Icons.calendar_today_outlined))
                      ],
                    ),
                    const Divider(
                        height: 20, thickness: 1, color: Color(0xFFDBE9F6)),
                    const SizedBox(height: 10),
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 14),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFDBE9F6)),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Current Date:",
                                style: TextStyle(fontSize: 16)),
                            Text(_displayCurrentDateTime,
                                style: const TextStyle(fontSize: 16)),
                          ],
                        )),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () async {
                        end =
                            await SelectDateTime.showAlertDialog(context, end);
                        countdown = Countdown(
                            endDate: end, displaySettings: displaySettings);
                      },
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 14),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFDBE9F6)),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Countdown Date:",
                                  style: TextStyle(fontSize: 16)),
                              Text(_displayCountdownTime,
                                  style: const TextStyle(fontSize: 16)),
                            ],
                          )),
                    ),
                    const Divider(
                        height: 38, thickness: 1, color: Color(0xFFDBE9F6)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Countdown",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18)),
                        GestureDetector(
                            onTap: () async {
                              displaySettings =
                                  await ChangeDisplaySettings.showAlertDialog(
                                      context, displaySettings);
                            },
                            child: const Icon(Icons.settings))
                      ],
                    ),
                    DisplayCountdownUI(
                        displaySettings: displaySettings, results: results),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: Text("StroeAndre Demo - 2022",
                          style: TextStyle(
                              color: Color(0xFFB6CDE5),
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 60,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset('assets/logo.svg')),
            ),
          )
        ],
      ),
    );
  }
}
