import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethod extends StatelessWidget {
  final SvgPicture arrowIcon;
  final SvgPicture paymentLogo; 
  final String paymentText; 

  const PaymentMethod({
    super.key,
    required this.arrowIcon,
    required this.paymentLogo,
    required this.paymentText, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 380,
                height: 68, 
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      spreadRadius: 2,
                      blurRadius: 60,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        paymentLogo, 
                        const SizedBox(width: 6),
                        Text(
                          paymentText,
                          style: const TextStyle(
                            fontFamily: 'Gellix',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            height: 25.2 / 18,
                            letterSpacing: 0.2,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    arrowIcon, 
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
