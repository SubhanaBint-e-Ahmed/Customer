import 'package:flutter/material.dart';
import 'OrderCard.dart';

class OrderReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            OrderStatusCard(
              imagePath: 'assets/images/burger.png',
              title: 'Double Sausage and Egg Muffin',
              date: '12/19/2025 03:32 PM',
              status: 'Reviewed',
              statusColor: Color(0xFF07BD0E),
            ),
            SizedBox(height: 10),
            OrderStatusCard(
              imagePath: 'assets/images/burger.png',
              title: 'Double Sausage and Egg Muffin',
              date: '12/19/2023 03:32 PM',
              status: 'Reviewed',
              statusColor: Color(0xFF07BD0E),
            ),
            SizedBox(height: 10),
            OrderStatusCard(
              imagePath: 'assets/images/shoesRepair.png',
              title: 'Shoe Repair',
              date: '12/19/2023 03:32 PM',
              status: 'Reviewed',
              statusColor: Color(0xFF07BD0E),
            ),
          ],
        ),
      ),
    );
  }
}
