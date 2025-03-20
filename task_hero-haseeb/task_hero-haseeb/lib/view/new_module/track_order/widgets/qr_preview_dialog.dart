import 'package:cocoon/res/constants/imports.dart';
import 'package:flutter/material.dart';

class QrPreviewDialog extends StatelessWidget {
  final String qrData;
  final String userName;

  const QrPreviewDialog(
      {super.key, required this.qrData, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close button
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            // Logo or Title
            SvgPicture.asset("assets/icons/Logo (2).svg"),
            const SizedBox(height: 8),
            const Text(
              "Services on demand",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 26),
            // Instruction
            const Text(
              "Please scan this QR code on arrival to complete delivery",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            Image.asset(
              "assets/images/barcode.png",
              width: 160,
              height: 160,
            ),
            const SizedBox(height: 24),
            // User Name
            Text(
              userName,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}