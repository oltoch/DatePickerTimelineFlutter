/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***

import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;

  DateWidget({
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Text(new DateFormat("MMM", locale).format(date).toUpperCase(), // Month
              //     style: monthTextStyle),
              CircleAvatar(
                maxRadius: 18,
                backgroundColor: selectionColor,
                child: Text(date.day.toString(), // Date
                    style: dateTextStyle),
              ),
              Text(new DateFormat("E", locale).format(date).toUpperCase(), // WeekDay
                  style: dayTextStyle)
            ],
          ),
        ),
        onTap: () {
          // Check if onDateSelected is not null
          if (onDateSelected != null) {
            // Call the onDateSelected Function
            onDateSelected!(this.date);
          }
        },
      ),
    );
  }
}
