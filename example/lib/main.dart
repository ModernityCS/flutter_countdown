import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown/flutter_countdown.dart';
import 'package:flutter_svg/svg.dart';

import 'countdown_label_container.dart';
import 'label.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// CountdownResults: Where the countdown values are being store
  CountdownResults results = CountdownResults();
  late DisplaySettings displaySettings;
  DateTime end = DateTime(2030, 03, 14, 11, 00);
  String _displayCurrentDateTime = "--";
  String _displayCountdownTime = "--";

// update the state of the build every second
  void periodicProcess(Countdown countdown) {
    /// Update each second
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      DateTime now = DateTime.now();
      setState(() {
        _displayCurrentDateTime =
            "${now.year}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}, ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
        _displayCountdownTime =
            "${end.year}/${end.month.toString().padLeft(2, '0')}/${end.day.toString().padLeft(2, '0')}, ${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}";

        results = countdown.countdown();
      });
    });
  }

  @override
  void initState() {
    displaySettings = DisplaySettings(months: false, weeks: false);
    Countdown countDown =
        Countdown(endDate: end, displaySettings: displaySettings);

    periodicProcess(countDown);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Demo",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 24)),
                      Icon(Icons.calendar_today_outlined)
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
                          const Text("Countdown Date:",
                              style: TextStyle(fontSize: 16)),
                          Text(_displayCountdownTime,
                              style: const TextStyle(fontSize: 16)),
                        ],
                      )),
                  const Divider(
                      height: 38, thickness: 1, color: Color(0xFFDBE9F6)),
                  const Text("Countdown",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                  const SizedBox(height: 15),
                  displaySettings.years
                      ? CountdownLabel(timeLeft: results.years, label: "Years")
                      : const SizedBox(),
                  displaySettings.months
                      ? CountdownLabel(
                          timeLeft: results.months, label: "Months")
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
                      ? CountdownLabel(
                          timeLeft: results.minutes, label: "Minutes")
                      : const SizedBox(),
                  displaySettings.seconds
                      ? CountdownLabel(
                          timeLeft: results.seconds, label: "Seconds")
                      : const SizedBox(),
                ],
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
      ),
    ));
  }
}

/* 
 displaySettings.years
              ? Column(
                  children: [
                    Label(number: results.years, label: "years".toUpperCase()),
                    const SizedBox(height: 15),
                  ],
                )
              : const SizedBox(),
          displaySettings.months
              ? Column(
                  children: [
                    Label(
                        number: results.months, label: "months".toUpperCase()),
                    const SizedBox(height: 15),
                  ],
                )
              : const SizedBox(),
          displaySettings.weeks
              ? Column(
                  children: [
                    Label(number: results.weeks, label: "weeks".toUpperCase()),
                    const SizedBox(height: 15),
                  ],
                )
              : const SizedBox(),
          displaySettings.days
              ? Column(
                  children: [
                    Label(number: results.days, label: "days".toUpperCase()),
                    const SizedBox(height: 15),
                  ],
                )
              : const SizedBox(),
          displaySettings.hours
              ? Column(
                  children: [
                    Label(number: results.hours, label: "hours".toUpperCase()),
                    const SizedBox(height: 15),
                  ],
                )
              : const SizedBox(),
          displaySettings.minutes
              ? Column(
                  children: [
                    Label(
                        number: results.minutes,
                        label: "minutes".toUpperCase()),
                    const SizedBox(height: 15),
                  ],
                )
              : const SizedBox(),
          displaySettings.seconds
              ? Column(
                  children: [
                    Label(
                        number: results.seconds,
                        label: "seconds".toUpperCase()),
                    const SizedBox(height: 15),
                  ],
                )
              : const SizedBox(),

  */
