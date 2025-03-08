import 'package:flutter/material.dart';
import 'package:cocoon/res/constants/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'widget/image_picker_bottom_sheet.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  _TaskDetailsScreenState createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  final TextEditingController _detailsController = TextEditingController();
  final List<File> _imageFiles = [];

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFiles.add(File(pickedFile.path));
      });
    }
    Navigator.pop(context);
  }

  void _showImagePickerBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(48.0)),
      ),
      backgroundColor: Colors.white,
      builder: (context) => ImagePickerBottomSheet(onPickImage: _pickImage),
    );
  }

  void _removeImage(int index) {
    setState(() {
      _imageFiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStep1(),
          ],
        ),
      ),
    );
  }

  Widget _buildStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Describe task details',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _detailsController,
            decoration: InputDecoration(
              hintText: 'Enter details',
              hintStyle: TextStyle(color: Color(0xFF9E9E9E)),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.all(12),
            ),
            maxLines: 4,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Attach Images',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            GestureDetector(
              onTap: _showImagePickerBottomSheet,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.purple),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/camera1.svg',
                      width: 24,
                      height: 24,
                      colorFilter: const ColorFilter.mode(
                          AppColors.purple, BlendMode.srcIn),
                    ),
                    const SizedBox(height: 4),
                    Text('Add photo',
                        style: TextStyle(color: AppColors.purple)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(child: _buildImagePreview()),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Please attach images in the format of .jpg, .jpeg, .png, etc.',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildImagePreview() {
    return _imageFiles.isNotEmpty
        ? SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _imageFiles.length,
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(_imageFiles[index],
                            width: 100, height: 100, fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      child: GestureDetector(
                        onTap: () => _removeImage(index),
                        child: SvgPicture.asset(
                          'assets/icons/close.svg',
                          width: 36,
                          height: 36,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        : Container();
  }
}
