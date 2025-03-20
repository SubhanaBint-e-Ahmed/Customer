
import 'package:cocoon/res/constants/app_colors.dart';
import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/view/new_module/track_order/widgets/timeline_card.dart';
import 'package:cocoon/view/new_module/track_order/widgets/timeline_widget.dart';
import 'package:cocoon/view/set_location/set_locatoin.dart';

import '../delay_screen.dart';
import 'end_process_bottom_sheet.dart';

class TimelineWidget2 extends StatelessWidget {
  const TimelineWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0x15060F14),
            blurRadius: 6,
            spreadRadius: 1,
            offset: Offset(0, 0),
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          TimelineCard(
            indicator: const DotIndicator(),
            lineColor: context.primary,
            content: TimelineContent(
              description: "Rider is on the way to deliver your order.",
              title: "Being Delivered",
              timestamp: "09-01-2023 10:34 PM",
              remaining: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppButton.primary(
                    height: 32,
                    width: 130,
                    title: "Track Live Location",
                    onPressed: () {
                     Get.to(()=> SetLocationView());
                    },
                  ),


                ],
              ),
            ),
          ),
          20.h,
          const TimelineCard(
              indicator: DotIndicator(
             //   color: AppColors.orange,
              ),
             // lineColor: AppColors.orange,
              content: TimelineContent(
                description: "Start service by clicking the button below.",
                title: "Picked up",
                timestamp: "09-01-2023 10:34 PM",
               // titleColor: AppColors.orange,
              )),
          20.h,
          TimelineCard(
            indicator: const DotIndicator(),
            lineColor: context.primary,
            content: TimelineContent(
              description: "Start service by clicking the button below.",
              title: "Processing",
              timestamp: "09-01-2023 10:34 PM",
              remaining: AppButton.primary(
                height: 32,
                width: 96,
                background: Colors.grey[200],
                title: "Start",
                textColor: Colors.grey[600],
              ),
            ),
          ),
          20.h,
           TimelineCard(
            indicator: DotIndicator(),
            lineColor: context.primary,
            content: TimelineContent(
              description: "You have accepted this service request.",
              title: "Accepted",
              timestamp: "09-01-2023 10:34 PM",
            ),
          ),
          20.h,
          TimelineCard(
            indicator: DotIndicator(),
            lineColor: context.primary,
            content: TimelineContent(
              description: "You have accepted this service request.",
              title: "Pending",
              timestamp: "09-01-2023 10:34 PM",
            ),
          ),
        ],
      ),
    );
  }
}