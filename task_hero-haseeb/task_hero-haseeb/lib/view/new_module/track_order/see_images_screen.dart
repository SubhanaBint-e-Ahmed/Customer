import 'package:cocoon/res/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SeeImagesScreen extends StatelessWidget {
  const SeeImagesScreen({super.key});

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
          "Images",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.black1,
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: 5,
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 250,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          return Image.asset(
            "assets/images/pick.png",
            width: double.infinity,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}