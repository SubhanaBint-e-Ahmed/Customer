import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/view/onboard_question/original_documents.dart';
import 'package:cocoon/view/onboard_question/skill_and_education.dart';
import 'package:cocoon/view/onboard_question/Category.dart';
import 'package:cocoon/view/onboard_question/Location.dart';
import 'package:cocoon/view/onboard_question/scheduleTask.dart';
import 'package:cocoon/view/onboard_question/houseSelection.dart';
import 'package:cocoon/view/onboard_question/taskdetail.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'get_info_controller.dart';
import 'get_info_option_widget.dart';

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
        title: const Text('Post a Task', style: TextStyle(
            fontFamily: 'Gellix',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            height: 28.8 / 24,
            letterSpacing: 0,
          ),), centerTitle: false,
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
                    children:  [
                      CategoryScreen(),
                      LocationScreen(),
                      ScheduleTaskWidget(),
                      HouseSelectionScreen(),
                      TaskDetailsScreen(),
                      SkillAndEducationView(),
                      OriginalDocumentsView(),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Custom Bottom Button
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 8),
            child: SizedBox(
              width: 150, // Fixed width
              height: 50, // Fixed height
              child: ElevatedButton(
                onPressed: controller.incrementPageViewIndex,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100), // Rounded corners
                  ),
                  backgroundColor: const Color(0xFF642D91), // Background color
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white, // Text color
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
