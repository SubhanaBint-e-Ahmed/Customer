import 'package:cocoon/res/constants/imports.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: 'Payment Methods',),
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.h,
          MethodsCard(title: 'My Wallet',path: Assets.icons.tWallet,),
            14.h,
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: context.extraLightGrey
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                SvgPicture.asset(Assets.icons.add,color: context.primary,height: 18,),
                5.w,
                Text('Add account',style: context.titleSmall!.copyWith(fontSize: 12, color: context.primary),)
              ],),
            ),
            16.h,
            MethodsCard(title: 'PayPal',path: Assets.icons.tpaypal,),
            16.h,
            MethodsCard(title: 'Google Pay',path: Assets.icons.google,),
            16.h,
            MethodsCard(title: 'Apple pay',path: Assets.icons.tapple,),
            16.h,
            MethodsCard(title: '•••• •••• •••• •••• 7285',path: Assets.icons.logosMastercard,),
        
            40.h,
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
    );
  }
}

class MethodsCard extends StatelessWidget {
  final title;
  final path;
  const MethodsCard({
    required this.path,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          SvgPicture.asset(path),
          10.w,
          FittedBox(fit: BoxFit.scaleDown,child: Text(title,style: context.bodyLarge!.copyWith(fontWeight: FontWeight.w600),)),
          Spacer(),

          Text('Connected',style: context.titleSmall!.copyWith(fontSize: 12,color: context.primary),)
        ],
      ).paddingAll(20),
    );
  }
}
