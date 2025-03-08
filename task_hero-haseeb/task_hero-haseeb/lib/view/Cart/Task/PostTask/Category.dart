import 'package:cocoon/res/constants/imports.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String? selectedCategory;
  String? selectedSubCategory;

  final List<String> categories = ["Cleaning"];
  final List<String> subCategories = ["Cleaning Apartment"];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildText("Category"),
          const SizedBox(height: 10),
          buildDropdown(selectedCategory, categories, (value) {
            setState(() {
              selectedCategory = value;
            });
          }),
          const SizedBox(height: 20),
          buildText("Sub Category"),
          const SizedBox(height: 10),
          buildDropdown(selectedSubCategory, subCategories, (value) {
            setState(() {
              selectedSubCategory = value;
            });
          }),
        ],
      ),
    );
  }

  Widget buildText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: "Gellix",
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 22.4 / 16,
        letterSpacing: 0.2,
      ),
    );
  }

  Widget buildDropdown(String? selectedValue, List<String> items, ValueChanged<String?> onChanged) {
    return Container(
      width: double.infinity,
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1404060F),
            offset: Offset(0, 4),
            blurRadius: 60,
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: selectedValue,
          hint: const Text(
            "Choose",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20), 
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ))
              .toList(),
          onChanged: onChanged,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
          itemHeight: 64, 
        ),
      ),
    );
  }
}
