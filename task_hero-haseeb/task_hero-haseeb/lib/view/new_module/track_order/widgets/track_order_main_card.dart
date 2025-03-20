import 'package:cocoon/res/constants/app_colors.dart';
import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/view/Profile/payment_and_wallet/payment_and_wallet.dart';
import 'package:cocoon/view/Profile/payment_methods/payment_methods.dart';
import 'package:flutter/material.dart';

import 'custom_divider.dart';

class TrackOrderMainCard extends StatelessWidget {
  const TrackOrderMainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0x15060F14),
            blurRadius: 6,
            spreadRadius: 1,
            offset: Offset(0, 0),
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Details',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black1),
              ),
              Icon(Icons.expand_more),
            ],
          ),
          const CustomDivider(),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/burger.png',
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cheese Burger',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$2.5',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.p1,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '1 item',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Quantity',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(child: Text('1')),
            ],
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Extra',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Extra Cheese',
                      style: TextStyle(color: AppColors.p1),
                    ),
                    SizedBox(height: 1,),
                    Text(
                      'Extra Ketchup',
                      style: TextStyle(color: AppColors.p1),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const CustomDivider(),
          _buildOrderDetail('Order no.', '#2326g34cf1'),

          _buildOrderDetail('Booking time', '01 Jan, 2023 10:20 AM'),
          _buildOrderDetail('Delivery option', 'Standard'),
          _buildOrderDetail('Total paid', '\$10.7'),
          _buildOrderDetail(
            'Order type',
            '',
            button: AppButton.primary(
              width: 156,
              height: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/delivery.svg"),
                  10.w,
                  const Text("Delivery")
                ],
              ),
            ),
          ),
          20.h,
          Text('Payment method',style: context.headlineMedium,),
          10.h,
          NPaymentCard(),
          _buildOrderDetail('Subtotal', '\$7.5'),
          _buildOrderDetail('Delivery', '\$7.5'),
          _buildOrderDetail('Tax', '\$7.5'),
          _buildOrderDetail('Service Fee', '\$7.5'),

          const CustomDivider(),
          _buildOrderDetail('Total', '\$7.5\nPaid',highlightColor: context.primary,isHighlighted: true),

        ],
      ),
    );
  }

  Widget _buildOrderDetail(String title, String value,
      {bool isHighlighted = false, Color? highlightColor, Widget? button}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(child: Container()),
          button ??
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight:
                        isHighlighted ? FontWeight.bold : FontWeight.normal,
                    color: isHighlighted ? highlightColor : Colors.black,
                  ),
                ),
              ),
        ],
      ),
    );
  }
}



class NPaymentCard extends StatelessWidget {
  const NPaymentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(Assets.icons.logosMastercard),
          10.w,
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(fit: BoxFit.scaleDown,child: Text('•••• •••• •••• •••• 4679',style: context.bodyLarge!.copyWith(fontWeight: FontWeight.w600),)),
              ],
            ),
          ),

        ],
      ).paddingAll(20),
    );
  }
}