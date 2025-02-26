import 'package:cocoon/view/Cart/Checkout3/Checkout3.dart';
import 'package:cocoon/res/constants/imports.dart';

class OrderConfirmationDialog extends StatelessWidget {
  const OrderConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(52),
      ),
      child: Container(
        width: 340,
        height: 511,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(52),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 185.93,
              height: 180,
              child: Image.asset('assets/images/Confirmpin.png', fit: BoxFit.contain),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: 276,
              height: 76,
              child: Column(
                children: [
                  Text(
                    "Order Successful!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4AAF57),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "You have successfully placed order",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 276,
              height: 128,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4AAF57),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      minimumSize: const Size(276, 58),
                    ),
                    child: const Text(
                      "Ok",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => const Checkout3Screen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 246, 253, 247),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      minimumSize: const Size(276, 58),
                    ),
                    child: const Text(
                      "Track Order",
                      style: TextStyle(color: Color(0xFF4AAF57), fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
