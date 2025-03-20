import 'package:cocoon/res/constants/app_colors.dart';
import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/view/new_module/track_order/widgets/timeline_widget.dart';
import 'package:cocoon/view/new_module/track_order/widgets/timeline_widget2.dart';
import 'package:cocoon/view/new_module/track_order/widgets/timeline_widget3.dart';
import 'package:cocoon/view/new_module/track_order/widgets/track_order_main_card.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  int change = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        centerTitle: false,
        title: const Text(
          "Track Order",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.black1),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                change = change + 1;
                if (change == 3) {
                  change = 0;
                }
              });
            },
            icon: SvgPicture.asset("assets/icons/more.svg"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TrackOrderMainCard(),
            20.h,
            change == 0
                ? const TimelineWidget()
                : change == 1
                    ? const TimelineWidget2()
                    : const TimelineWidget3(),
          ],
        ),
      ),
    );
  }
}