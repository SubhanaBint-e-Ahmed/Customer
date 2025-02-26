import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Ensures background consistency
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 📌 "Enter Your Location" Text
          const Text(
            "Enter Your Location",
            style: TextStyle(
              fontFamily: "Gellix",
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 22.4 / 16,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 12),

          // 📌 Custom TextField with SVG Icon
          Container(
            width: 380,
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFA), // Background color
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                // 📌 TextField (Hint Text)
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Times Square NYC, Manhattan",
                      hintStyle: TextStyle(
                        fontFamily: "Gellix",
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        height: 19.6 / 14,
                        letterSpacing: 0.2,
                        color: Colors.black, // Hint text color
                      ),
                      border: InputBorder.none, 
                      enabledBorder: InputBorder.none, 
                      focusedBorder: InputBorder.none, 
                    ),
                  ),
                ),

                // 📌 SVG Icon on Right Side (Black Color)
                SvgPicture.asset(
                  'assets/icons/Location2.svg', // Replace with your SVG file
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn), // ✅ Makes icon black
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 📌 Full-Screen Image
          Expanded(
            child: Image.asset(
              'assets/images/Mask Group.png', // Replace with your image
              width: 428,
              height: 1026,
              fit: BoxFit.cover, // Ensures it covers full screen
            ),
          ),
        ],
      ),
    );
  }
}
