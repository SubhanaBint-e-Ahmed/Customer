import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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

          Container(
            width: 380,
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFA), 
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
           
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
                        color: Colors.black,
                      ),
                      border: InputBorder.none, 
                      enabledBorder: InputBorder.none, 
                      focusedBorder: InputBorder.none, 
                    ),
                  ),
                ),

               
                SvgPicture.asset(
                  'assets/icons/Location2.svg',
                  width: 20,
                  height: 20,
                  colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn), 
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Expanded(
            child: Image.asset(
              'assets/images/Mask Group.png',
              width: 428,
              height: 1026,
              fit: BoxFit.cover, 
            ),
          ),
        ],
      ),
    );
  }
}
