import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart'; 
import 'offerScreen.dart';

class ListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16,),
        children: <Widget>[
          _buildListItem(context, 'Apartment Cleaning', 'John Doe', '09:37 PM - 26 Jan, 2024'),
          _buildListItem(context, 'Apartment Cleaning', 'John Dee', '09:37 PM - 26 Jan, 2024'),
          _buildListItem(context, 'Apartment Cleaning', 'John Doe', '09:37 PM - 26 Jan, 2024'),
          _buildListItem(context, 'Apartment Cleaning', 'John Doe', '09:37 PM - 26 Jan, 2024'),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String title, String name, String time) {
    return GestureDetector(
      onTap: () {
        Get.to(() =>OfferScreen());
      },
      child: Container(
        width: 380,
        height: 109,
        margin: EdgeInsets.symmetric(vertical: 10), 
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(29, 6, 15, 20),
              blurRadius: 60,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child:  const CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage('assets/images/Avatar1.png'),
                  ),
            ),
            SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Gellix',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      height: 25.2 / 18,
                      letterSpacing: 0.2,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    time,
                    style: TextStyle(
                      fontFamily: 'Gellix',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 14.4 / 12,
                      letterSpacing: 0.2,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'Gellix',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 19.6 / 14,
                      letterSpacing: 0.2,
                      color: Color(0xFF642D91),
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[600]),
          ],
        ),
      ),
    );
  }
}


