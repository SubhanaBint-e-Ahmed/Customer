import 'package:cocoon/res/constants/app_colors.dart';
import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/view/new_module/track_order/preview_label_screen.dart';
import 'package:cocoon/view/new_module/track_order/widgets/add_tracking_bottom_sheet.dart';
import 'package:cocoon/view/new_module/track_order/widgets/custom_outline_button.dart';
import 'package:cocoon/view/new_module/track_order/widgets/track_card.dart';
import 'package:cocoon/view/user_verification/widgets/custom_tag.dart';

class AddTrackingScreen extends StatefulWidget {
  const AddTrackingScreen({super.key});

  @override
  State<AddTrackingScreen> createState() => _AddTrackingScreenState();
}

class _AddTrackingScreenState extends State<AddTrackingScreen> {
  bool showAddNote = false;
  bool showTrackCard = false;
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
          "Tracking Details",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.black1),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/more.svg"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Images",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.black1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              20.h,
              const CustomTag(
                text: "Adding images helps conflict free service.",
                icon: Icons.info_outline,
                color: AppColors.deepSkyBlue,
              ),
              20.h,
              const Text(
                "Please attach images in the format of .jpg, .jpeg, .png, etc.",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.p1, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/camera1.svg"),
                      const SizedBox(height: 8),
                       Text(
                        "Add photo",
                        style: TextStyle(
                            color: context.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Tracking",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.black1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showAddNote = !showAddNote;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
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
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/add2.svg"),
                      const SizedBox(width: 14),
                       Text(
                        "Add a note",
                        style: TextStyle(
                          color: context.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              showAddNote
                  ? const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: CustomTextField(
                        hintText: "Placeholder",
                        maxLines: 4,
                        borderRadius: 16,
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(height: 24),
              const Text(
                "Orders Notes",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.black1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              showTrackCard ? TrackCard() : const SizedBox(),
              GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    showTrackCard = !showTrackCard;
                  });
                },
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(26)),
                    ),
                    builder: (context) => const AddTrackingBottomSheet(),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
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
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/add2.svg"),
                      const SizedBox(width: 14),
                       Text(
                        "Add Tracking",
                        style: TextStyle(
                          color: context.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Generate Label",
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.black1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              10.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomOutlineButton(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      onPressed: () {
                        Get.to(() => const PreviewLabelScreen());
                      },
                      backgroundColor: AppColors.p1,
                      textColor: Colors.white,
                      icon: SvgPicture.asset("assets/icons/print.svg"),
                      label: "Print label"),
                  20.w,
                  CustomOutlineButton(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/icons/eye.svg"),
                      label: "Print label"),
                ],
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: CustomOutlineButton(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    onPressed: () {},
                    icon: const SizedBox.shrink(),
                    textColor: Colors.grey.shade100,
                    backgroundColor: AppColors.primary,
                    borderColor: Colors.transparent,
                    label: "Done"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}