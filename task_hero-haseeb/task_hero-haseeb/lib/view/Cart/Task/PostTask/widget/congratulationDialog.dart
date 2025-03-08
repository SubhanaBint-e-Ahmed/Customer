
import 'package:cocoon/res/constants/imports.dart';

class CongratulationDialog extends StatelessWidget {
  const CongratulationDialog ({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(52),
      ),
      child: Container(
        width: 340,
        height: 441,
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
              child: Image.asset('assets/images/Group (2).png', fit: BoxFit.contain),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: 276,
              height: 76,
              child: Column(
                children: [
                  Text(
                    "Congratulations",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF642D91),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "You task is posted",
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
              height: 80,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF642D91),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      minimumSize: const Size(276, 50),
                    ),
                    child: const Text(
                      "Ok",
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
