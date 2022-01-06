import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown/flutter_countdown.dart';

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

// update the state of the build every second
  void periodicProcess(Countdown countdown) {
    /// Update each second
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      setState(() {
        results = countdown.countdown();
      });
    });
  }

  @override
  void initState() {
    displaySettings = DisplaySettings(months: false, weeks: false);
    Countdown countDown = Countdown(
        endDate: DateTime(2030, 03, 14, 11, 00),
        displaySettings: displaySettings);

    periodicProcess(countDown);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
        ],
      ),
    ));
  }
}
