import 'package:cocoon/res/constants/app_colors.dart';
import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/view/Hero/WashmanService.dart';

class WashmanPickupOption extends StatelessWidget {
  const WashmanPickupOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 52,
      padding: const EdgeInsets.all(5),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 116,
            height: 48,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xFFEEEEEE),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () { Get.to(() => const Washmanservice());},
                  child: SvgPicture.asset(
                    'assets/icons/m2.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {   },
                  child: SvgPicture.asset(
                    'assets/icons/pickup2.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          Container(
            width: 50,
            height: 20,
            padding: const EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
              color: Colors.transparent.withOpacity(0.0),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.yellow,
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  '4.3',
                  style: TextStyle(
                    fontFamily: 'Gellix',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 19.6 / 14,
                    letterSpacing: 0.2,
                    color: AppColors.purple,
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
