import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cocoon/res/constants/app_colors.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String phoneNumber;
  final String price;

  const ServiceCard({
    Key? key,
    required this.title,
    required this.phoneNumber,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFFDFDFD)),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFC2BDBD).withOpacity(0.4),
            spreadRadius: 3,
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: 130.0,
                height: 120.0,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/Rectangle 85 (2).png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.star, color: AppColors.yellow, size: 14.0),
                        SizedBox(width: 5.0),
                        Text('4.8',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 10)),
                        SizedBox(width: 5.0),
                        Text('(900+)',
                            style: TextStyle(color: Colors.grey, fontSize: 9)),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Text(title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16)),
                    const SizedBox(height: 8.0),
                    const Text('We are the best in laundry services.',
                        style: TextStyle(color: Colors.grey, fontSize: 9)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 80.0),
                  Row(
                    children: [
                      const Text('From',
                          style: TextStyle(color: Colors.grey, fontSize: 10)),
                      const SizedBox(width: 5.0),
                      Text('\$$price/hr',
                          style: const TextStyle(
                              color: AppColors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/icons/favorite.svg',
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}
