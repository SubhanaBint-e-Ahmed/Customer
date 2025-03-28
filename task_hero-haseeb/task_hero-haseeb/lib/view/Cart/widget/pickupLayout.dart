import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/view/Cart/Checkout1/Checkout1.dart'; 

class Pickuplayout extends StatelessWidget {
  const Pickuplayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 60,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(44),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Delivery Button
          /*Expanded(
            flex: 2,
            child: Container(
              height: 32,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF642D91),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    height: 30,
                    child: SvgPicture.asset('assets/icons/Deliver (1).svg'),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Delivery',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Gellix',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 1.4,
                      letterSpacing: 0.2,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 4),*/

          
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                Get.to(() => const Checkout1Screen()); 
              },
              child: Container(
                height: 40,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 18,
                      height: 18,
                     // child: SvgPicture.asset('assets/icons/Pickup.svg'),
                      child: SvgPicture.asset('assets/icons/Deliver (1).svg', colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Delivery',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Gellix',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        height: 1.4,
                        letterSpacing: 0.2,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),   const SizedBox(width: 4),
          Expanded(
            flex: 2,
            child: Container(
              height: 32,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF642D91),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    height: 30,
                   child: SvgPicture.asset('assets/icons/Pickup.svg', colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Pickup',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Gellix',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      height: 1.4,
                      letterSpacing: 0.2,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
       
        ],
      ),
    );
  }
}
