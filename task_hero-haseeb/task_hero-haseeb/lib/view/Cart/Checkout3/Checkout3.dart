import 'package:cocoon/res/constants/imports.dart';
//import 'package:cocoon/res/constants/app_colors.dart';
import 'package:cocoon/view/Cart/widget/mailLayout.dart';
import 'package:cocoon/view/Cart/widget/LocationCard.dart';
import 'package:cocoon/view/Cart/widget/DeliverOptions.dart';
import 'package:cocoon/view/Cart/widget/driverInstructions.dart';
import 'package:cocoon/view/Cart/widget/shoesRepair.dart';
import 'package:cocoon/view/Cart/widget/mailLocation.dart';
import 'package:cocoon/view/Cart/widget/AddVoucher.dart';
import 'package:cocoon/view/Cart/widget/price.dart';
import 'package:cocoon/view/Cart/widget/payment.dart';
import 'package:cocoon/view/Cart/widget/promo.dart';
import 'PaymentCheckout3.dart';

class Checkout3Screen extends StatelessWidget {
  const Checkout3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(
            fontFamily: 'Gellix',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            height: 28.8 / 24,
            letterSpacing: 0,
          ),
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 10, 24, 110),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Maillayout(),
                  const SizedBox(height: 20),
                  const Text(
                    "Your Location",
                    style: TextStyle(
                      fontFamily: 'Gellix',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 21.6 / 16,
                      letterSpacing: 0.0,
                    ),
                  ),
                  const LocationCard(),
                  const SizedBox(height: 16),
                  const Text(
                    "Hero Location",
                    style: TextStyle(
                      fontFamily: 'Gellix',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 21.6 / 16,
                      letterSpacing: 0.0,
                    ),
                  ),
                  const mailLocation(),
                  const Divider(
                      height: 1, thickness: 1, color: Color(0xFFE0E0E0)),
                  const SizedBox(height: 16),
                  const Text(
                    "Mail Type",
                    style: TextStyle(
                      fontFamily: 'Gellix',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 21.6 / 16,
                      letterSpacing: 0.0,
                    ),
                  ),
                  const DeliveryOptionsScreen(),
                  const SizedBox(height: 16),
                  InstructionsScreen(
                    arrowIcon: SvgPicture.asset('assets/icons/greentick.svg',
                        width: 20, height: 20), 
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                      height: 1, thickness: 1, color: Color(0xFFE0E0E0)),
                  const ShoesRepairScreen(),
                  const SizedBox(height: 6),
                  const Divider(
                      height: 1, thickness: 1, color: Color(0xFFE0E0E0)),
                  const SizedBox(height: 16),
                  AddVoucherScreen(
                    arrowIcon: SvgPicture.asset('assets/icons/Right 2.svg',
                        width: 20, height: 20),
                  ),
                  const SizedBox(height: 2),
                  const PriceBreakdownScreen(),
                  PaymentMethod(
                    arrowIcon: SvgPicture.asset('assets/icons/Right 2.svg',
                        width: 20, height: 20),
                    paymentLogo: SvgPicture.asset('assets/icons/Pay card.svg',
                        width: 24, height: 24),
                    paymentText: 'Payment Method',
                  ),
                  const SizedBox(height: 2),
                  const PromoAndAllergiesScreen(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 428,
              height: 90,
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                  Get.to(() => const PaymentCheckout3Screen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF5F5F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    minimumSize: const Size(200, 50),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 16),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontFamily: 'Gellix',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      height: 22.4 / 16,
                      letterSpacing: 0.2,
                      color: Color(0xFF642D91),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
