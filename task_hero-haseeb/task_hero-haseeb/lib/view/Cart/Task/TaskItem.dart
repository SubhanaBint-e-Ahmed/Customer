import 'package:cocoon/res/constants/imports.dart';
//import 'package:cocoon/view/Cart/Checkout1/Checkout1.dart';
import 'package:cocoon/view/Cart/widget/CancleConfirmationDialog.dart';
import 'package:cocoon/view/Cart/Task/AppartmentCleaning.dart';

class TaskItem extends StatelessWidget {
  final int index;

  const TaskItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: 450,
            height: 210,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
        //    child: SingleChildScrollView( 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, 
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.asset(
                          'assets/images/cleaning 2.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Cleaning',
                              style: TextStyle(
                                fontFamily: 'Gellix',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                height: 1.4,
                                letterSpacing: 0.2,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '09:37 PM - 26 Jan, 2024',
                              style: TextStyle(
                                fontFamily: 'Gellix',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                letterSpacing: 0.2,
                                color: Color(0xFF9E9E9E),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                          'assets/icons/arrow_right.svg',
                          width: 24,
                          height: 24,
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color(0xFFEEEEEE),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () { 
                            Get.to(() =>  const AppartmentcleaningScreen ()); 
                          }, 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF642D91) ,
                                
                            textStyle: const TextStyle(fontSize: 16),
                            minimumSize: const Size(double.infinity, 38),
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: const Text(
                            'See offers',
                            style: TextStyle(
                              color:  Colors.white, 
                          )),
                        ),
                        const SizedBox(height: 2),
                        ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => CancleConfirmationDialog(
                                onConfirm: () {
                                  Navigator.pop(context);
                                },
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF5F5F5), 
                            textStyle: const TextStyle(fontSize: 16),
                            minimumSize: const Size(356, 38),
                            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              color: Color(0xFF642D91),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        
      ],
    );
  }
}
