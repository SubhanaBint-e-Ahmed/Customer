import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/view/Profile/add_cash/add_cash.dart';
import 'package:cocoon/view/Profile/cash_out/cash_out.dart';
import 'package:cocoon/view/Profile/payment_methods/payment_methods.dart';

import '../all_transaction/all_transaction.dart';

class PaymentAndWallet extends StatelessWidget {
  const PaymentAndWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFC),
      appBar: SimpleAppBar(
        title: 'Payment & Wallet',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.h,
            Text('\$ 347.3',style: context.titleLarge!.copyWith(color: context.primary),),
            Text('Your Balance'),
            16.h,
            Row(children: [
              Expanded(child: AppButton.primary(title: 'Add Cash',borderRadius: BorderRadius.circular(10),background: Colors.green,                    onPressed: ()=>Get.to(()=>AddCashView()),
              )),
              16.w,
              Expanded(child: AppButton.primary(title: 'Cash Out',borderRadius: BorderRadius.circular(10),                    onPressed: ()=>Get.to(()=>CashOutView()),
              ),),
              
            ],),
            20.h,
            InkWell(
              onTap: ()=>Get.to(()=>PaymentMethods()),
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(Assets.icons.payCard),
                        10.w,
                        Text('Payment Method',style: context.bodyLarge!.copyWith(fontWeight: FontWeight.w600),),
                      ],
                    ),
                    SvgPicture.asset(Assets.icons.arrowRight)
                  ],
                ).paddingAll(20),
              ),
            ),
            14.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('Recent Transactions',style: context.headlineMedium!.copyWith(),),
              InkWell(
                onTap: ()=>Get.to(()=>TransactionsView()),
                  child: Text('See All',style: context.bodyLarge!.copyWith(color: context.primary),))
            ],),
            14.h,
            PaymentCard(),
            14.h,
            PaymentCard(),
            14.h,
            PaymentCard(),
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                FittedBox(fit: BoxFit.scaleDown,child: Text('Bank Transfer - Freida Varnes',style: context.bodyLarge!.copyWith(fontWeight: FontWeight.w600),)),
                Text('09/12/23')
              ],
            ),
          ),
          5.w,
          Expanded(child: FittedBox(fit: BoxFit.scaleDown,child: Text('\$401.5',style: context.bodyLarge!.copyWith(fontWeight: FontWeight.w600,color: context.error),))),

          SvgPicture.asset(Assets.icons.arrowRight)
        ],
      ).paddingAll(20),
    );
  }
}
