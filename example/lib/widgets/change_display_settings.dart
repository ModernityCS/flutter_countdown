import 'package:flutter/material.dart';
import 'package:flutter_countdown/flutter_countdown.dart';

/// Change the displaySettings -> Different styles of display countdown
class ChangeDisplaySettings {
  static Future<DisplaySettings> showAlertDialog(
      BuildContext context, DisplaySettings displaySettings) async {
    // show the dialog
    await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.zero,
                actionsPadding: EdgeInsets.zero,
                insetPadding: EdgeInsets.zero,
                title: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    margin: EdgeInsets.zero,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("DisplaySettings"),
                        GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(Icons.check_sharp,
                                color: Colors.green[400]))
                      ],
                    )),
                content: Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 13),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFDBE9F6)),
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Text("Years",
                                    style: TextStyle(fontSize: 16)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  displaySettings.years =
                                      !displaySettings.years;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(displaySettings.years
                                    ? Icons.check_box_rounded
                                    : Icons.check_box_outline_blank_rounded),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 13),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFDBE9F6)),
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Text("Months",
                                    style: TextStyle(fontSize: 16)),
                              ),
                            ),
                            const SizedBox(width: 6),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  displaySettings.months =
                                      !displaySettings.months;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(displaySettings.months
                                    ? Icons.check_box_rounded
                                    : Icons.check_box_outline_blank_rounded),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 13),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFDBE9F6)),
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Text("Weeks",
                                    style: TextStyle(fontSize: 16)),
                              ),
                            ),
                            const SizedBox(width: 6),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  displaySettings.weeks =
                                      !displaySettings.weeks;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(displaySettings.weeks
                                    ? Icons.check_box_rounded
                                    : Icons.check_box_outline_blank_rounded),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 13),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFDBE9F6)),
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Text("Days",
                                    style: TextStyle(fontSize: 16)),
                              ),
                            ),
                            const SizedBox(width: 6),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  displaySettings.days = !displaySettings.days;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(displaySettings.days
                                    ? Icons.check_box_rounded
                                    : Icons.check_box_outline_blank_rounded),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 13),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFDBE9F6)),
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Text("Hours",
                                    style: TextStyle(fontSize: 16)),
                              ),
                            ),
                            const SizedBox(width: 6),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  displaySettings.hours =
                                      !displaySettings.hours;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(displaySettings.hours
                                    ? Icons.check_box_rounded
                                    : Icons.check_box_outline_blank_rounded),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 13),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFDBE9F6)),
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Text("Minutes",
                                    style: TextStyle(fontSize: 16)),
                              ),
                            ),
                            const SizedBox(width: 6),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  displaySettings.minutes =
                                      !displaySettings.minutes;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(displaySettings.minutes
                                    ? Icons.check_box_rounded
                                    : Icons.check_box_outline_blank_rounded),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 13),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFDBE9F6)),
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Text("seconds",
                                    style: TextStyle(fontSize: 16)),
                              ),
                            ),
                            const SizedBox(width: 6),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  displaySettings.seconds =
                                      !displaySettings.seconds;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(displaySettings.seconds
                                    ? Icons.check_box_rounded
                                    : Icons.check_box_outline_blank_rounded),
                              ),
                            ),
                          ],
                        ),
                        // Align(
                        //   alignment: Alignment.bottomRight,
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //         vertical: 12.0, horizontal: 8.0),
                        //     child: GestureDetector(
                        //       onTap: () {
                        //         Navigator.pop(context);
                        //       },
                        //       child: Text("Confirm",
                        //           style: TextStyle(
                        //               fontWeight: FontWeight.w500,
                        //               fontSize: 16,
                        //               color: Colors.green[400])),
                        //     ),
                        //   ),
                        // )
                      ],
                    )),
              );
            },
          );
        });

    return displaySettings;
  }
}
