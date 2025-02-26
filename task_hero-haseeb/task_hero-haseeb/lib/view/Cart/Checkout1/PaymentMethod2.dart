import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cocoon/res/constants/app_colors.dart';
import 'PaymentCheckout.dart';


class PaymentMethod2Screen extends StatefulWidget {
  const PaymentMethod2Screen({super.key});

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethod2Screen> {
  int selectedMethod = -1;

  final List<Map<String, String>> paymentMethods = [
    {"name": "PayPal", "icon": "assets/icons/Paypal.svg"},
    {"name": "Google Pay", "icon": "assets/icons/google_pay.svg"},
    {"name": "Apple Pay", "icon": "assets/icons/apple_pay.svg"},
     {"name": ".... .... .... .... 4679", "icon": "assets/icons/mastercard.svg"},
    {"name": "My Wallet", "icon": "assets/icons/Wallet.svg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method', style: TextStyle(
            fontFamily: 'Gellix',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            height: 28.8 / 24,
            letterSpacing: 0,
          ),), centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Expanded(
              child: ListView.builder(
                itemCount:
                    paymentMethods.length + 1, 
                itemBuilder: (context, index) {
                  if (index < paymentMethods.length) {
                    final method = paymentMethods[index]["name"] ?? "Unknown";
                    final iconPath = paymentMethods[index]["icon"] ?? "";
                    return _buildPaymentMethodRow(index, method, iconPath);
                  } else {
                    return Center(child: _buildAddNewCardButton());
                  }
                },
              ),
            ),

            const SizedBox(height: 20),

           
            Center(child: _buildContinueButton()),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodRow(int index, String method, String iconPath) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedMethod = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        height: 72,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath,
                width: 24, height: 24, fit: BoxFit.cover),
            const SizedBox(width: 16),
            Text(method, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            Radio<int>(
              value: index,
              groupValue: selectedMethod,
              onChanged: (int? value) {
                if (value != null) {
                  setState(() {
                    selectedMethod = value;
                  });
                }
              },
              activeColor: AppColors.purple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddNewCardButton() {
    return InkWell(
      onTap: () {
      },
      child: Container(
        width: 380,
        height: 50,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/AddCard.svg", width: 24, height: 24),
            const SizedBox(width: 8),
            const Text(
              'Add new card',
              style: TextStyle(color: AppColors.purple, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return ElevatedButton(
      onPressed:  () {Get.to(() => const Paymentcheckout());
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:  const Color.fromARGB(251, 100, 45, 145),
        foregroundColor: const Color.fromARGB(250, 255, 255, 255),
        minimumSize: const Size(226, 50),
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: const Text('Continue', style: TextStyle(
            fontFamily: 'Gellix',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            height: 22.8 / 16,
            letterSpacing: 0,
          ),),
    );
  }
}
