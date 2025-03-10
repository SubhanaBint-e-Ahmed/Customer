import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/widgets/custom_drop_down.dart';

class AddCashView extends StatelessWidget {
  const AddCashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: 'Add Cash',),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Enter Amount',style: context.titleSmall!.copyWith(fontSize: 14),),
          5.h,
          CustomDropDown(items: [DropDownItemModel(name: 'name')], hint: 'Enter amount',),
          26.h,
          Text('Choose Account',style: context.titleSmall!.copyWith(fontSize: 14),),
          10.h,
          Text('Your money will be drawn from your chosen account and will be transferred to your wallet.',style: context.bodySmall!.copyWith(),),
          10.h,
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(Assets.icons.logosMastercard),
                10.w,
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(fit: BoxFit.scaleDown,child: Text('•••• •••• •••• •••• 4679',style: context.bodyLarge!.copyWith(fontWeight: FontWeight.w600),)),
                    ],
                  ),
                ),
                5.w,
                SvgPicture.asset(Assets.icons.edit)
              ],
            ).paddingAll(20),
          ),
          20.h,
          CustomTextField(
            title: 'Reason',
            hintText: 'For shopping, etc.',
          ),
          20.h,
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(3),
                color: context.extraLightGrey,
              ),
              child: Text('Add Money',style: context.bodyLarge!.copyWith(color: context.grey),),
            ),
          )


        ],
      ).paddingSymmetric(horizontal: 20),

    );
  }
}
