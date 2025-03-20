import 'package:cocoon/res/constants/app_colors.dart';
import 'package:cocoon/res/constants/imports.dart';
import 'package:flutter/material.dart';

import 'custom_outline_button.dart';

class SelectPackagingBottomSheet extends StatelessWidget {
  const SelectPackagingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.h,
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
              const Text(
                "Select Packaging",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black1),
              ),
              const SizedBox(
                width: 40,
              )
            ],
          ),
          const SizedBox(height: 16),

          // Dimension Section
          const Text(
            "Dimension",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _PackagingOption(
                  imagePath: "assets/images/p1.png", isSelected: true),
              _PackagingOption(
                  imagePath: "assets/images/p2.png", isSelected: false),
              _PackagingOption(
                  imagePath: "assets/images/p3.png", isSelected: false),
            ],
          ),
          const SizedBox(height: 16),

          const Row(
            children: [
              _DimensionField(hintText: "20"),
              Text("   X   "),
              _DimensionField(hintText: "20"),
              Text("   X   "),
              _DimensionField(hintText: "20"),
              SizedBox(width: 8),
              _DropdownButton(items: ["cm", "m"], selectedItem: "cm"),
            ],
          ),
          const SizedBox(height: 16),

          // Weight Section
          const Text(
            "Weight",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: const TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "1040",
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              _DropdownButton(items: const ["g", "kg"], selectedItem: "g"),
            ],
          ),
          const SizedBox(height: 24),

          Center(
            child: CustomOutlineButton(
              onPressed: () {},
              label: "Done  ",
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              textColor: Colors.white,
              backgroundColor: AppColors.p1,
            ),
          )
        ],
      ),
    );
  }
}

class _PackagingOption extends StatelessWidget {
  final String imagePath;
  final bool isSelected;

  const _PackagingOption({
    super.key,
    required this.imagePath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
       // color: isSelected ? context.primary : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isSelected ? context.primary : Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: Image.asset(imagePath, width: 50, height: 50),
    );
  }
}

class _DimensionField extends StatelessWidget {
  final String hintText;

  const _DimensionField({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 16),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),
      ),
    );
  }
}

class _DropdownButton extends StatelessWidget {
  final List<String> items;
  final String selectedItem;

  const _DropdownButton({
    Key? key,
    required this.items,
    required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButton<String>(
        value: selectedItem,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item, style: const TextStyle(fontSize: 14)),
          );
        }).toList(),
        onChanged: (value) {
          // Handle dropdown selection
        },
        underline: const SizedBox(),
        icon: const Icon(Icons.arrow_drop_down),
      ),
    );
  }
}


