import 'package:cocoon/res/components/app_button.dart';
import 'package:cocoon/res/constants/app_colors.dart';
import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/view/new_module/track_order/widgets/qr_preview_dialog.dart';
import 'package:flutter/material.dart';

class SecurityCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        centerTitle: false,
        title: const Text(
          "Security Code",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.black1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text(
              'Scan QR Code (for hero/driver)',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            Center(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    "assets/images/qrcode 1.png",
                    width: 260,
                    height: 260,
                  )),
            ),
            const SizedBox(height: 24),
            Text.rich(
              TextSpan(
                text: 'If QR code is not showing, ',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                children:  [
                  TextSpan(
                    text: 'contact us',
                    style: TextStyle(
                      color: context.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            20.h,
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppButton.outline(
                    width: 100,
                    onPressed: () {},
                    title: "Review",
                    elevation: 0,
                    background: Colors.white,
                    height: 30,
                    borderColor: AppColors.p1,
                    
                  ),
                  10.w,
                  AppButton.primary(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => QrPreviewDialog(
                          qrData: "https://example.com/security-code",
                          userName: "John Doe",
                        ),
                      );
                    },
                    title: "Print QR Code",
                    elevation: 0,
                    width: 150,
                    textColor: Colors.white,
                    height: 30,
                    background: AppColors.p1,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}