import 'package:flutter/material.dart';
import 'package:cocoon/res/constants/app_colors.dart';

class HouseSelectionScreen extends StatefulWidget {
  const HouseSelectionScreen({super.key});

  @override
  _HouseSelectionScreenState createState() => _HouseSelectionScreenState();
}

class _HouseSelectionScreenState extends State<HouseSelectionScreen> {
  String? _selectedHouseType = 'All';

  int? _selectedRooms = 1;
  int? _selectedBedrooms = 1;
  int? _selectedBathrooms = 1;
  String? _activeMoreInput;
  final Map<String, TextEditingController> _moreControllers = {
    'rooms': TextEditingController(),
    'bedrooms': TextEditingController(),
    'bathrooms': TextEditingController(),
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropdown(
              label: 'Select type of your house',
              value: _selectedHouseType,
              items: ['All', 'Apartment', 'House', 'Villa'],
              onChanged: (value) {
                setState(() {
                  _selectedHouseType = value;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildNumberSelection(
              label: 'Select the number of rooms?',
              selectedValue: _selectedRooms,
              onChanged: (value) {
                setState(() {
                  _selectedRooms = value;
                  _activeMoreInput = null;
                });
              },
              inputKey: 'rooms',
            ),
            const SizedBox(height: 20),
            _buildNumberSelection(
              label: 'Select the number of bedrooms?',
              selectedValue: _selectedBedrooms,
              onChanged: (value) {
                setState(() {
                  _selectedBedrooms = value;
                  _activeMoreInput = null;
                });
              },
              inputKey: 'bedrooms',
            ),
            const SizedBox(height: 20),
            _buildNumberSelection(
              label: 'Select the number of bathrooms?',
              selectedValue: _selectedBathrooms,
              onChanged: (value) {
                setState(() {
                  _selectedBathrooms = value;
                  _activeMoreInput = null;
                });
              },
              inputKey: 'bathrooms',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Gellix',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 22.4 / 16,
            letterSpacing: 0.2,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 380,
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1404060F),
                blurRadius: 60,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontFamily: 'Gellix',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 22.4 / 16,
                    letterSpacing: 0.2,
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
            decoration: const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNumberSelection({
    required String label,
    required int? selectedValue,
    required Function(int?) onChanged,
    required String inputKey,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Gellix',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 22.4 / 16,
            letterSpacing: 0.2,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildNumberButton(1, selectedValue, onChanged),
            const SizedBox(width: 10),
            _buildNumberButton(2, selectedValue, onChanged),
            const SizedBox(width: 10),
            _buildNumberButton(3, selectedValue, onChanged),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _activeMoreInput =
                      _activeMoreInput == inputKey ? null : inputKey;
                  if (_activeMoreInput == inputKey) {
                    if (inputKey == 'rooms') {
                      _selectedRooms = null;
                    } else if (inputKey == 'bedrooms') {
                      _selectedBedrooms = null;
                    } else if (inputKey == 'bathrooms') {
                      _selectedBathrooms = null;
                    }
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _activeMoreInput == inputKey
                    ? AppColors.purple
                    : Colors.white,
                foregroundColor: _activeMoreInput == inputKey
                    ? Colors.white
                    : AppColors.purple,
                minimumSize: const Size(70, 62),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(
                    color: Color(0xFF642D91),
                    width: 2,
                  ),
                ),
              ),
              child: const Text(
                'More',
                style: TextStyle(
                  fontFamily: 'Gellix',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  height: 22.4 / 12,
                  letterSpacing: 0,
                ),
              ),
            ),
          ],
        ),
        if (_activeMoreInput == inputKey) _buildMoreInputField(inputKey),
      ],
    );
  }

  Widget _buildNumberButton(
      int number, int? selectedValue, Function(int?) onChanged) {
    return ElevatedButton(
      onPressed: () {
        onChanged(number);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            selectedValue == number ? AppColors.purple : Colors.white,
        foregroundColor:
            selectedValue == number ? Colors.white : AppColors.purple,
        padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            color: Color(0xFF642D91),
            width: 2,
          ),
        ),
        fixedSize: const Size(70, 62),
      ),
      child: Text(
        number.toString(),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMoreInputField(String inputKey) {
    return Container(
      width: 380,
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: _moreControllers[inputKey],
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: 'Enter number',
          hintStyle: TextStyle(
            fontFamily: 'Gellix',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: 0.2,
            color: Color(0xFF9E9E9E),
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
