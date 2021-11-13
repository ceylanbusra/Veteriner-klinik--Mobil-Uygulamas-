import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class RandevuAl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Randevu Al'),
      ),
      body: Center(
        child: Container(
          child: TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            // ignore: missing_return
            selectedDayPredicate: (day) {},
            onDaySelected: (selectedDay, focusedDay) {},
          ),
        ),
      ),
    );
  }
}
