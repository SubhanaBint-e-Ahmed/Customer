import 'package:cocoon/res/constants/app_colors.dart';
import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/view/Hero/widget/FeaturedIcon.dart';
import 'package:cocoon/view/Hero/widget/FoodMenu.dart';
import 'package:cocoon/view/Hero/widget/taskRating.dart';
import 'package:cocoon/view/Hero/widget/orderbar.dart';
import 'Washman.dart';
import 'package:cocoon/view/Hero/widget/ReviewCard.dart';
import 'package:cocoon/view/Hero/widget/DeliveryInfo.dart';

class ResServiceScreen extends StatelessWidget {
  const ResServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Service',
                style: TextStyle(
                  fontFamily: 'Gellix',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  height: 28.8 / 24,
                ),
                textAlign: TextAlign.left,
              ),
              SvgPicture.asset(
                'assets/icons/crcle.svg',
                height: 24,
                width: 24,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 91,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 60,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    left: 24,
                    right: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: Image(
                            image: AssetImage('assets/images/Rlogo.png'),
                            fit: BoxFit.cover,
                            width: 49,
                            height: 49,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Kebab Restaurant',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Trusted By Us',
                                  style: TextStyle(
                                    color: AppColors.purple,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SvgPicture.asset(
                                  'assets/icons/Trust.svg',
                                  height: 16,
                                  width: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: SvgPicture.asset(
                          'assets/icons/Heart.svg',
                          height: 20,
                          width: 20,
                          color: AppColors.purple,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const OrderOptions(),
                const SizedBox(height: 24.0),
                const DeliveryInfo(),
                const SizedBox(height: 20.0),
                const FeaturedIconSection(),
                const SizedBox(height: 16.0),
                const FoodMenuScreen(),
                const SizedBox(height: 20.0),
                const Text(
                  'Reviews',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 22.4 / 16,
                    letterSpacing: 0.2,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 20.0),
                const TaskerRating(),
                const SizedBox(height: 20.0),
                const ReviewCard(),
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 200,
              height: 55,
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF212121),
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const WashmanScreen());
                  },
                  child: const Text(
                    'View in Cart (1)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
