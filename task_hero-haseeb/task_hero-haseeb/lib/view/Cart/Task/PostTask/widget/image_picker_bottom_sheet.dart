import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cocoon/res/constants/app_colors.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  final Function(ImageSource) onPickImage;

  const ImagePickerBottomSheet({super.key, required this.onPickImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 249,
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 48),
      child: Column(
        children: [
          // Top divider
          Container(
            width: 38,
            height: 3,
            decoration: BoxDecoration(
              color: Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(height: 16),

          // Title
          const Text(
            "Choose from",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24),

          // Row with two options
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildOption(
                context,
                iconPath: 'assets/icons/gallery1.svg',
                label: "Gallery",
                onTap: () => onPickImage(ImageSource.gallery),
              ),
              _buildOption(
                context,
                iconPath: 'assets/icons/empCamera.svg',
                label: "Camera",
                onTap: () => onPickImage(ImageSource.camera),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOption(BuildContext context,
      {required String iconPath,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4, 
        height: 104,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(15, 6, 15, 20),
              blurRadius: 60, 
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 32,
              height: 32,
             // colorFilter:
                 // const ColorFilter.mode(AppColors.purple, BlendMode.srcIn),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
