import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/view/Cart/Task/PostTask/Category.dart';
import 'package:cocoon/view/Cart/Task/PostTask/Location.dart';
import 'package:cocoon/view/Cart/Task/PostTask/scheduleTask.dart';
import 'package:cocoon/view/Cart/Task/PostTask/houseSelection.dart';
import 'package:cocoon/view/Cart/Task/PostTask/taskdetail.dart';
import 'package:cocoon/view/Cart/Task/PostTask/Budget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'get_info_controller.dart';


class GetInfoPage extends StatelessWidget {
  final bool forEdit;
  const GetInfoPage({this.forEdit = false, super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetInfoController>(
      init: GetInfoController(forEdit: forEdit),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Post a Task',
              style: TextStyle(
                fontFamily: 'Gellix',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                height: 28.8 / 24,
                letterSpacing: 0,
              ),
            ),
            centerTitle: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Center(
                  child: LinearPercentIndicator(
                    barRadius: const Radius.circular(10),
                    width: context.width - 40,
                    lineHeight: 16.0,
                    percent: controller.getInfoProgress,
                    backgroundColor: context.secondary,
                    progressColor: context.primary,
                  ),
                ),
                30.h,
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.pageViewController,
                    children: [
                      const CategoryScreen(),
                      const LocationScreen(),
                      ScheduleTaskWidget(),
                      HouseSelectionScreen(),
                      TaskDetailsScreen(),
                      BudgetWidget(),
                     
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Custom Bottom Button
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
            child: SizedBox(
              width: 150, // Fixed width
              height: 50, // Fixed height
              child: ElevatedButton(
                onPressed: controller.incrementPageViewIndex,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100), 
                  ),
                  backgroundColor: const Color(0xFF642D91), 
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
