import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/res/constants/app_colors.dart';


class EmptyOfferScreen extends StatelessWidget {
  final VoidCallback onIconTap;  

  const EmptyOfferScreen({super.key, required this.onIconTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onIconTap,  
            child: SizedBox(
              width: 170,
              height: 170,
              child: SvgPicture.asset("assets/icons/offer.svg"),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 380,
            height: 85,
            alignment: Alignment.center,
            child: const Column(
              children: [
                Text(
                  "No offer avaliable",
                  style: TextStyle(
                    fontFamily: 'Gellix',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    height: 28.8 / 24,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: 380,
                  height: 44,
                  child: Text(
                    "To get offers you need to post a task.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Gellix',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 22.4 / 16,
                      letterSpacing: 0.2,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: onIconTap,  
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(218, 255, 255, 255),
              foregroundColor: AppColors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              fixedSize: const Size(250, 58),
            ),
            child: const Text(
              "Post a task",
              style: TextStyle(
                fontFamily: 'Gellix',
                fontWeight: FontWeight.w700,
                fontSize: 16,
                height: 22.4 / 16,
                letterSpacing: 0.2,
                color: AppColors.purple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
