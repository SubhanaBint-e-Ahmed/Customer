import 'package:flutter/material.dart';
import 'package:cocoon/res/constants/app_colors.dart';

class ScheduleTaskWidget extends StatefulWidget {
  const ScheduleTaskWidget({super.key});

  @override
  _ScheduleTaskWidgetState createState() => _ScheduleTaskWidgetState();
}

class _ScheduleTaskWidgetState extends State<ScheduleTaskWidget> {
  bool _scheduleTask = false;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay? _fromTime;
  TimeOfDay? _toTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRadioOption('As soon as possible', false),
          _buildRadioOption('Schedule task', true),
          if (_scheduleTask) ...[
            const SizedBox(height: 16),
            _buildStyledText('Schedule'),
            const SizedBox(height: 8),
            _buildDateSelectionRow(),
            const SizedBox(height: 16),
            _buildTimePickerRow('From', _fromTime, (time) {
              setState(() {
                _fromTime = time;
              });
            }),
            const SizedBox(height: 8),
            _buildTimePickerRow('To', _toTime, (time) {
              setState(() {
                _toTime = time;
              });
            }),
          ],
        ],
      ),
    );
  }

  Widget _buildRadioOption(String text, bool value) {
  return Material(
    color: Colors.transparent, 
    child: InkWell(
      splashColor: Colors.transparent, 
      highlightColor: Colors.transparent, 
      onTap: () {
        setState(() {
          _scheduleTask = value;
        });
      },
      child: Row(
        children: [
          Radio(
            value: value,
            groupValue: _scheduleTask,
            onChanged: (newValue) {
              setState(() {
                _scheduleTask = newValue!;
              });
            },
            activeColor: AppColors.purple,
          ),
          _buildStyledText(text),
        ],
      ),
    ),
  );
}



  Widget _buildStyledText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Gellix',
        fontWeight: FontWeight.w600,
        fontSize: 18,
        height: 25.2 / 18,
        letterSpacing: 0.2,
      ),
    );
  }

  Widget _buildDateSelectionRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildDateButton('Today', DateTime.now()),
          const SizedBox(width: 8),
          _buildDateButton('Tomorrow', DateTime.now().add(const Duration(days: 1))),
          const SizedBox(width: 8),
          _buildDateButton('Mon', DateTime.now().add(const Duration(days: 2))),
        ],
      ),
    );
  }

  Widget _buildDateButton(String text, DateTime date) {
    bool isSelected = _selectedDate.day == date.day && _selectedDate.month == date.month;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDate = date;
        });
      },
      child: Container(
        width: 110,
        height: 95,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? const Color(0xFF642D91) : Colors.grey, width: 2),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              '${_getMonthName(date.month)} ${date.day}',
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    List<String> months = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month];
  }

  Widget _buildTimePickerRow(String label, TimeOfDay? time, Function(TimeOfDay) onTimeChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStyledText(label),
        const SizedBox(height: 8),
        _buildTimeDropdown(time, onTimeChanged),
      ],
    );
  }

  Widget _buildTimeDropdown(TimeOfDay? time, Function(TimeOfDay) onTimeChanged) {
    return Container(
      width: 380,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<TimeOfDay>(
          value: time ?? _getNearestTime(),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
          isExpanded: true,
          onChanged: (TimeOfDay? newValue) {
            if (newValue != null) {
              onTimeChanged(newValue);
            }
          },
          items: _generateTimeDropdownItems(),
        ),
      ),
    );
  }

  TimeOfDay _getNearestTime() {
    List<TimeOfDay> times = _generateAvailableTimes();
    return times.first;
  }

  List<DropdownMenuItem<TimeOfDay>> _generateTimeDropdownItems() {
    List<DropdownMenuItem<TimeOfDay>> items = [
      const DropdownMenuItem(
        value: null,
        child: Text("Select Time"),
      )
    ];
    for (TimeOfDay time in _generateAvailableTimes()) {
      items.add(
        DropdownMenuItem(
          value: time,
          child: Text(time.format(context),style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),),
        ),
      );
    }
    return items;
  }

  List<TimeOfDay> _generateAvailableTimes() {
    List<TimeOfDay> times = [];
    for (int hour = 0; hour < 24; hour++) {
      for (int minute = 0; minute < 60; minute += 15) {
        times.add(TimeOfDay(hour: hour, minute: minute));
      }
    }
    return times;
  }
}
