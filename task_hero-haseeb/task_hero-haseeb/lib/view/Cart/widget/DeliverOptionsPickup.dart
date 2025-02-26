import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cocoon/view/Cart/Checkout2/Schedule.dart';

class DeliveryOptionsPickup extends StatefulWidget {
  const DeliveryOptionsPickup({super.key});

  @override
  _DeliveryOptionsPickupState createState() => _DeliveryOptionsPickupState();
}

class _DeliveryOptionsPickupState extends State<DeliveryOptionsPickup> {
  int selectedOption = 0;
  String scheduledTime = ''; // Default text

  Future<void> _navigateToScheduleScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ScheduleScreen()),
    );

    if (result != null) {
      setState(() {
        scheduledTime = result;
        selectedOption = 2; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildOptionCard(
            iconPath: 'assets/icons/priority.svg',
            title: 'Priority',
            description: '15-20 min',
            isSelected: selectedOption == 0,
            onTap: () => setState(() => selectedOption = 0),
          ),
          const SizedBox(height: 16),
          _buildOptionCard(
            iconPath: 'assets/icons/standred.svg',
            title: 'Standard',
            description: '',
            isSelected: selectedOption == 1,
            onTap: () => setState(() => selectedOption = 1),
          ),
          const SizedBox(height: 16),
          _buildScheduleCard(), 
        ],
      ),
    );
  }

  Widget _buildOptionCard({
    required String iconPath,
    required String title,
    required String description,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 380,
        height: 90,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: isSelected ? const Color(0xFF642D91) : const Color(0xFFEEEEEE),
              width: 2),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath, width: 50, height: 50),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                Text(description,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///  *New Widget to Show Only Scheduled Time**
  Widget _buildScheduleCard() {
    return GestureDetector(
      onTap: _navigateToScheduleScreen,
      child: Container(
        width: 380,
        height: 90,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color:
                  selectedOption == 2 ? const Color(0xFF642D91) : const Color(0xFFEEEEEE),
              width: 2),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/schedule.svg',
                width: 50, height: 50),
            const SizedBox(width: 20),
            if (selectedOption != 2)
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Schedule',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                 /*  Text('',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.grey)),*/
                ],
              )
            else
              Expanded(
                child: Text(
                  scheduledTime,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
