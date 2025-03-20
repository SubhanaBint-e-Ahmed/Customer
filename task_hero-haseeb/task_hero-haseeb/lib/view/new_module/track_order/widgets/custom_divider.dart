import 'package:cocoon/res/constants/imports.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 1,
      width: double.infinity,
      color: Colors.grey[200],
    );
  }
}