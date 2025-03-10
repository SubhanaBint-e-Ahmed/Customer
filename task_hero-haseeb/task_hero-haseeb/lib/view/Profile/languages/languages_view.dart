import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/view/Profile/languages/languages_controller.dart';

class LanguagesView extends StatelessWidget {
  const LanguagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguagesController>(
      init: LanguagesController(),
      builder: (controller) => Scaffold(
      appBar: SimpleAppBar(
        title: 'Languages',
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Suggested',style: context.titleSmall!.copyWith(fontSize: 15),),
          LanguageWidget(title: 'English(US)',),
          LanguageWidget(title: 'English(UK)',),
          Text('Language',style: context.titleSmall!.copyWith(fontSize: 15),),
          10.h,
          Expanded(child: ListView.separated(itemBuilder: (context, index) => LanguageWidget(title: controller.languagesList[index]), separatorBuilder: (context, index) => 2.h, itemCount: controller.languagesList.length))

        ],
      ).paddingSymmetric(horizontal: 20),
    ),);
  }
}

class LanguageWidget extends StatelessWidget {
  final String title;
  const LanguageWidget({
   required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(title,style: context.bodyMedium!.copyWith(fontWeight: FontWeight.w500),),
      Radio(value: false, groupValue: 'groupValue', onChanged: (v){}),

    ],);
  }
}
