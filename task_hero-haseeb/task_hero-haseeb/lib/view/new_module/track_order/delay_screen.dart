import 'package:cocoon/res/constants/app_colors.dart';
import 'package:cocoon/res/constants/imports.dart';
import 'package:flutter/material.dart';

class DelayScreen extends StatefulWidget {
  @override
  _DelayScreenState createState() => _DelayScreenState();
}

class _DelayScreenState extends State<DelayScreen> {
  String selectedTimeUnit = 'Days'; // Default selected value
  int selectedDay = 1; // Default day selection
  TimeOfDay fromTime = TimeOfDay.now();
  TimeOfDay toTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        centerTitle: false,
        title: const Text(
          "Delay Request",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.black1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How much time do you need?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.black1,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                RadioListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text(
                    'Days',
                    style: TextStyle(
                      color: AppColors.black1,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  value: 'Days',
                  groupValue: selectedTimeUnit,
                  onChanged: (value) {
                    setState(() {
                      selectedTimeUnit = value!;
                    });
                  },
                ),
                RadioListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text(
                    'Hours',
                    style: TextStyle(
                      color: AppColors.black1,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  value: 'Hours',
                  groupValue: selectedTimeUnit,
                  onChanged: (value) {
                    setState(() {
                      selectedTimeUnit = value!;
                    });
                  },
                ),
                RadioListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text(
                    'Minutes',
                    style: TextStyle(
                      color: AppColors.black1,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  value: 'Minutes',
                  groupValue: selectedTimeUnit,
                  onChanged: (value) {
                    setState(() {
                      selectedTimeUnit = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (selectedTimeUnit == 'Days') ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChoiceChip(
                    showCheckmark: false,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: selectedDay == 1
                                ? AppColors.p1
                                : Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(12)),
                    label: const Text('1 Day'),
                    selected: selectedDay == 1,
                    onSelected: (selected) {
                      setState(() {
                        selectedDay = 1;
                      });
                    },
                  ),
                  ChoiceChip(
                    showCheckmark: false,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: selectedDay == 2
                                ? AppColors.p1
                                : Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(12)),
                    label: const Text('2 Days'),
                    selected: selectedDay == 2,
                    onSelected: (selected) {
                      setState(() {
                        selectedDay = 2;
                      });
                    },
                  ),
                  ChoiceChip(
                    showCheckmark: false,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: selectedDay == 3
                                ? AppColors.p1
                                : Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(12)),
                    label: const Text('3 Days'),
                    selected: selectedDay == 3,
                    onSelected: (selected) {
                      setState(() {
                        selectedDay = 3;
                      });
                    },
                  ),
                ],
              ),
            ] else if (selectedTimeUnit == 'Hours') ...[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'From',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.black1,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () async {
                          final pickedTime = await showTimePicker(
                              context: context, initialTime: fromTime);
                          if (pickedTime != null) {
                            setState(() {
                              fromTime = pickedTime;
                            });
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            fromTime.format(context),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.h,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'To',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.black1,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      InkWell(
                        onTap: () async {
                          final pickedTime = await showTimePicker(
                              context: context, initialTime: toTime);
                          if (pickedTime != null) {
                            setState(() {
                              toTime = pickedTime;
                            });
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            toTime.format(context),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}