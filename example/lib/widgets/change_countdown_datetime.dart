import 'package:flutter/material.dart';
import 'package:flutter_countdown/flutter_countdown.dart';

/// Change the displaySettings -> Different styles of display countdown
class SelectDateTime {
  static Future<DateTime> showAlertDialog(
      BuildContext context, DateTime dateTime) async {
    TextEditingController _dateController = TextEditingController();
    TextEditingController _timeController = TextEditingController();

    _dateController.text =
        "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    _timeController.text =
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
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
                    padding: const EdgeInsets.all(12),
                    margin: EdgeInsets.zero,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Selecte DateTime"),
                        GestureDetector(
                            onTap: () {
                              dateTime = _stringToDateTime(
                                  _dateController.text, _timeController.text);
                              Navigator.pop(context);
                            },
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Select Date"),
                          TextFormField(
                            controller: _dateController,
                            decoration: InputDecoration(
                              hintText: "YYYY-MM-DD",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Color(0xFFC8C8C8)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text("Select Time"),
                          TextFormField(
                            controller: _timeController,
                            decoration: InputDecoration(
                              hintText: "HH:mm",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Color(0xFFC8C8C8)),
                              ),
                            ),
                          )
                        ])),
              );
            },
          );
        });

    return dateTime;
  }

  static DateTime _stringToDateTime(String date, String time) {
    DateTime dateTime = DateTime.parse(date + " " + time);
    return dateTime;
  }
}
