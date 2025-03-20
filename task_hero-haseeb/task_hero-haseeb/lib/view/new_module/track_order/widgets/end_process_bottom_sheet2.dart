import 'package:cocoon/res/constants/app_colors.dart';
import 'package:cocoon/res/constants/imports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../add_tracking_screen.dart';
import 'custom_divider.dart';
import 'custom_outline_button.dart';

void showEndProcessBottomSheet2(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'End Processing?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const CustomDivider(),
            const SizedBox(height: 16),
            Text(
              'To complete you must add tracking details',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CustomOutlineButton(
              onPressed: () {
                Get.to(() => const AddTrackingScreen());
              },
              icon: SvgPicture.asset("assets/icons/list2.svg"),
              label: 'Tracking details',
              backgroundColor: AppColors.white,
              borderColor: AppColors.p1,
              textColor: AppColors.p1,
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    },
  );
}