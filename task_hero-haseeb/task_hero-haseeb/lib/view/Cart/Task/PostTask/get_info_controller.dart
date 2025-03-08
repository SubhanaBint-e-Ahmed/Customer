

import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/view/Cart/Task/PostTask/widget/congratulationDialog.dart';

import '../../../../widgets/custom_drop_down.dart';

class GetInfoController extends GetxController with LocalStorageMixin {
  DropDownItemModel? selectedState;
  DropDownItemModel? selectedCity;
    final int totalPages = 6; 
 final bool forEdit;
  GetInfoController({this.forEdit=false});
  final int animationDuration = 500;
  final PageController pageViewController = PageController();
  DropDownItemModel? selectedDropDownValue;
  String? radioSelectedValue;
  int pageViewIndex = 0;
  TextEditingController tfPlaceName = TextEditingController();
  List<DropDownItemModel> locationsStatesList = [];
  List<DropDownItemModel> locationCitiesList = [];

  String? selectedValueDescribeYou= 'Businessman';
  String? selectedValueGender= 'Male';


  void setSelectValueDescribeYou(String s) {
    selectedValueDescribeYou= s;
    update();
  }


  void setSelectValueGender(String s) {
    selectedValueGender= s;
    update();
  }
  void incrementPageViewIndex() {
      if (pageViewIndex < totalPages - 1) {
        pageViewIndex++;
        pageViewController.animateToPage(
          pageViewIndex,
          duration: Duration(milliseconds: animationDuration),
          curve: Curves.easeInOut,
        );
        update();
      } else {
        showDialog(
          context: Get.context!,
          builder: (context) {
            return const CongratulationDialog();
          },
        );
      }

  }

  void decrementPageViewIndex() {
    if (pageViewIndex > 0) {
      pageViewIndex--;
      pageViewController.animateToPage(
        pageViewIndex,
        duration: Duration(milliseconds: animationDuration),
        curve: Curves.easeInOut,
      );
      update();
    }
  }



  double get getInfoProgress => ((pageViewIndex + 1) / totalPages) * 0.95;



}
