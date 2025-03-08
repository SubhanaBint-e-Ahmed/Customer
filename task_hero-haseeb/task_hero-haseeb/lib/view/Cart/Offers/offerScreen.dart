import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cocoon/view/Cart/Offers/PaymentMethod.dart';
import 'package:get/get.dart';

class OfferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Offer',
              style: TextStyle(
                fontFamily: 'Gellix',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SvgPicture.asset(
              'assets/icons/crcle.svg',
              height: 24,
              width: 24,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // User Info Container
            Container(
              width: 380,
              height: 90,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 60)],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/images/Avatar1.png'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Apartment Cleaning",
                        style: TextStyle(
                          fontFamily: 'Gellix',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          letterSpacing: 0.2,
                        ),
                      ),
                      Text(
                        "John Doe",
                        style: TextStyle(
                          fontFamily: 'Gellix',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: 0.2,
                          color: Color(0xFF642D91),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/icons/msg.svg', height: 24, width: 24),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Offer Price Container
            Container(
              width: 380,
              height: 65,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 60)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Offer Price",
                    style: TextStyle(
                      fontFamily: 'Gellix',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      letterSpacing: 0.2,
                    ),
                  ),
                  Text(
                    "\$250",
                    style: TextStyle(
                      fontFamily: 'Gellix',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      letterSpacing: 0.2,
                      color: Color(0xFF642D91),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Message Container
            Container(
              width: 380,
              height: 339,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                 boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 60)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Message",
                    style: TextStyle(
                      fontFamily: 'Gellix',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed elit est, tristique rhoncus mi nec, varius lobortis leo. Etiam magna augue, tincidunt quis velit non, lacinia pulvinar quam.",
                    style: TextStyle(
                      fontFamily: 'Gellix',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      letterSpacing: 0.2,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                 Spacer(),
                  Align(
                    alignment: Alignment.centerLeft, 
                    child: const Text(
                      "09:37 PM - 26 Jan, 2024",
                      style: TextStyle(
                        fontFamily: 'Gellix',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        letterSpacing: 0.2,
                        color: Color(0xFF9E9E9E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(), 
       
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {   Get.back();},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF5F5F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                    minimumSize: const Size(150, 50),
                  ),
                  child: const Text(
                    "Decline",
                    style: TextStyle(color: Color(0xFF642D91)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {Get.to(() => const PaymentMethodScreen());},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF642D91),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                    minimumSize: const Size(150, 50),
                  ),
                  child: const Text(
                    "Accept",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), 
          ],
        ),
      ),
    );
  }
}
