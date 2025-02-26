import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _selectedDayIndex = 0;
  int _selectedSlotIndex = -1; // Track selected time slot
  List<bool> _selectedSlots = List.generate(6, (index) => false);

  List<String> timeSlots = [
    '09:00 AM - 09:30 AM',
    '09:15 AM - 09:45 AM',
    '09:30 AM - 10:00 AM',
    '09:45 AM - 10:15 AM',
    '10:00 AM - 10:30 AM',
    '10:15 AM - 10:45 AM',
  ];

  List<String> days = ['Today', 'Tomorrow', 'Mon'];
  List<String> dates = ['Dec 16', 'Dec 17', 'Dec 18'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(result: null);
          },
        ),
        title: const Text(
          'Schedule',
          style: TextStyle(
            fontFamily: 'Gellix',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            height: 28.8 / 24,
            letterSpacing: 0,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(days.length, (index) {
                return Expanded(
                  child: _buildDayButton(days[index], index, dates[index]),
                );
              }),
            ),
            const SizedBox(height: 20),
            const Divider(color: Color(0xFFEEEEEE)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: timeSlots.length,
                itemBuilder: (context, index) {
                  return _buildTimeSlot(index);
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: _selectedSlotIndex != -1
                        ? () {
                            Get.back(
                              result:
                                  '${days[_selectedDayIndex]}, ${timeSlots[_selectedSlotIndex]}',
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF642D91),
                      minimumSize: const Size(226, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Text('Schedule', style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Get.back(result: null);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFF5F5F5),
                      minimumSize: const Size(226, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Color(0xFF642D91)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayButton(String day, int index, String date) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedDayIndex = index;
        });
      },
      child: Container(
        height: 89,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:
                _selectedDayIndex == index ? const Color(0xFF642D91) : const Color(0xFFEEEEEE),
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(day, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            const SizedBox(height: 5),
            Text(date,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFF9E9E9E))),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlot(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(timeSlots[index],
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          InkWell(
            onTap: () {
              setState(() {
                if (_selectedSlotIndex == index) {
                  _selectedSlotIndex = -1;
                  _selectedSlots = List.generate(6, (i) => false);
                } else {
                  _selectedSlotIndex = index;
                  _selectedSlots = List.generate(6, (i) => i == index);
                }
              });
            },
            child: Icon(
              _selectedSlots[index]
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}
