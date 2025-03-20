import 'package:cocoon/res/constants/app_colors.dart';
import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/view/new_module/track_order/widgets/timeline_card.dart';
import 'package:cocoon/view/new_module/track_order/widgets/timeline_widget.dart';
import 'package:cocoon/view/set_location/set_locatoin.dart';

import '../delay_screen.dart';
import '../security_code_screen.dart';
import '../see_images_screen.dart';
import 'end_process_bottom_sheet2.dart';

class TimelineWidget3 extends StatelessWidget {
  const TimelineWidget3({super.key});

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
              description: "Rider has arrived. Show delivery security code or QR code to the rider & confirm you have received your order.",
              title: "Delivery confirmation",
              timestamp: "09-01-2023 10:34 PM",
              remaining: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppButton.primary(
                    height: 32,
                    width: 150,
                    title: "Delivery Security Code",
                    onPressed: () {
                      Get.to(() => SecurityCodeScreen());

                    },
                  ),

             ] ),
            ),
          ),
          20.h,
          TimelineCard(
            indicator: const DotIndicator(),
            lineColor: context.primary,
            content: TimelineContent(
              description: "Start service by clicking button.",
              title: "Being delivered",
              timestamp: "09-01-2023 10:34 PM",
              remaining: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppButton.primary(
                    height: 32,
                    width: 130,
                    title: "Track Live Location",
                    onPressed: () {
                      Get.to(()=>SetLocationView());
                    },
                  ),
                ],
              ),
            ),
          ),
          20.h,
          TimelineCard(
            indicator: const DotIndicator(),
            lineColor: context.primary,
            content: TimelineContent(
              description:
                  "Scan code on the package label to confirm you have received the package.",
              title: "Picked up",
              timestamp: "09-01-2023 10:34 PM",
              remaining: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

              ),
            ),
          ),
          20.h,
          const TimelineCard(
              indicator: DotIndicator(),
              content: TimelineContent(
                description: "Package is on its way to you.",
                title: "Processing",
                timestamp: "09-01-2023 10:34 PM",
              )),
          20.h,
           TimelineCard(
            indicator: DotIndicator(),
            lineColor: context.primary,
            content: TimelineContent(
              description: "Customer is preparing the to be mail.",
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