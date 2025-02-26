import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'PaymentMethod2.dart';
import 'package:get/get.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add a Card',
          style: TextStyle(
            fontFamily: 'Gellix',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            height: 28.8 / 24,
            letterSpacing: 0,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card Image
              Container(
                width: 380,
                height: 239,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(44),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x40584CF4),
                      offset: Offset(4, 8),
                      blurRadius: 24,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(44),
                  child: Image.asset(
                    'assets/images/macard.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              _buildInputContainer("Card Name"),
              const SizedBox(height: 16),

              _buildInputContainer("Card Number"),
              const SizedBox(height: 16),

             Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures proper spacing
  children: [
    Expanded(
      child: _buildInputContainer("Expiry Date", isExpiryField: true),
    ),
    const SizedBox(width: 2), // Reduced spacing
    Expanded(
      child: _buildInputContainer("CVV"),
    ),
  ],
),

            ],
          ),
        ),
      ),

  
      bottomNavigationBar: Container(
        width: 428,
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
        child: Center(
          child: SizedBox(
            width: 226,
            height: 50,
            child: ElevatedButton(
              onPressed: () {Get.to(() => const PaymentMethod2Screen());},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF642D91),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputContainer(String label,
      {double width = 380, bool isExpiryField = false}) {
    return Container(
      width: width,
      height: 91,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Gellix',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              height: 25.2 / 18,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            width: width,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAFA),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '',
                      hintStyle: const TextStyle(
                        fontFamily: 'Gellix',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 19.6 / 14,
                        letterSpacing: 0.2,
                        color: Color(0xFF9E9E9E),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFFAFAFA),
                      contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                if (isExpiryField)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SvgPicture.asset(
                      'assets/icons/bCalendar.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
