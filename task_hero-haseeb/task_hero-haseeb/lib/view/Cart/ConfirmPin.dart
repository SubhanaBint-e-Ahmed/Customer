import 'package:cocoon/res/constants/app_colors.dart';
import 'package:cocoon/res/constants/imports.dart';
import 'package:pinput/pinput.dart';
import 'package:cocoon/view/Cart/widget/order_confirmation_dialog.dart';

class ConfirmPinScreen extends StatelessWidget {
  const ConfirmPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 83,
      height: 61,
      textStyle: const TextStyle(fontSize: 31),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF4FF),
        border: Border.all(color: const Color(0xFFEEEEEE)),
        borderRadius: BorderRadius.circular(16),
      ),
    );

    final focusPinTheme = PinTheme(
      width: 83,
      height: 61,
      textStyle: const TextStyle(fontSize: 31),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF4FF),
        border: Border.all(color: AppColors.purple),
        borderRadius: BorderRadius.circular(16),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        centerTitle: false,
        title: const Text(
          "Confirm PIN",
          style: TextStyle(
            fontFamily: 'Gellix',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            height: 28.8 / 24,
            letterSpacing: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SB.h(120),
                const Text(
                  "Add your PIN to confirm order",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.black1,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SB.h(80),
                Pinput(
                  onTapOutside: (_) {
                    FocusScope.of(context).unfocus();
                  },
                  length: 4,
                  obscureText: true,
                  obscuringWidget: ClipOval(
                    child: SvgPicture.asset(
                      'assets/icons/Label (1).svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusPinTheme,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        const OrderConfirmationDialog(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF642D91),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  minimumSize: const Size(226, 50),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontFamily: 'Gellix',
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    letterSpacing: 0.2,
                    color: Color(0xFFEEF4FF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
