import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/view/Profile/currency/currency_controller.dart';
//import 'package:cocoon/view/languages/languages_controller.dart';

class CurrencyView extends StatelessWidget {
  const CurrencyView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CurrencyController>(
      init: CurrencyController(),
      builder: (controller) => Scaffold(
      appBar: SimpleAppBar(
        title: 'Languages',
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Suggested',style: context.titleSmall!.copyWith(fontSize: 15),),
          LanguageWidget(title: 'USD(\$)',),
          LanguageWidget(title: 'Pounds(£)',),
          Text('Currency',style: context.titleSmall!.copyWith(fontSize: 15),),
          10.h,
          Expanded(child: ListView.separated(itemBuilder: (context, index) => LanguageWidget(title: controller.currencyList[index]), separatorBuilder: (context, index) => 2.h, itemCount: controller.currencyList.length))

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
