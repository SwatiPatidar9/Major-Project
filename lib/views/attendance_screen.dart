import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // ✅ Store marked days
  Set<DateTime> markedDays = {};

  void _markTodayAttendance() {
    setState(() {
      markedDays.add(DateTime(
        _focusedDay.year,
        _focusedDay.month,
        _focusedDay.day,
      ));
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Attendance marked for today ✅")),
    );
  }

  bool _isMarked(DateTime day) {
    return markedDays.any((d) =>
    d.year == day.year && d.month == day.month && d.day == day.day);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance"),
        backgroundColor: Color(0xFF0097A7),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, day, events) {
                if (_isMarked(day)) {
                  return Positioned(
                    bottom: 4,
                    child: Icon(Icons.check_circle,
                        color: Colors.green, size: 16),
                  );
                }
                return null;
              },
            ),
          ),
          const Spacer(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(
            onPressed: (){},
           // onPressed: _markTodayAttendance,
            style: ElevatedButton.styleFrom(
              backgroundColor:Color(0xFF0097A7),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Mark Attendance",
              style: TextStyle(color:Colors.white,fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
