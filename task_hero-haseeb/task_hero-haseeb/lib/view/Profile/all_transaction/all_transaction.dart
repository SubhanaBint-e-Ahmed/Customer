import 'package:cocoon/res/constants/imports.dart';

import '../payment_and_wallet/payment_and_wallet.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: 'Transactions',),
      body: SingleChildScrollView(
        child: Column(
          children: [
            14.h,
            TextContainer(text: 'Today',),
            10.h,
            PaymentCard(),
            14.h,
            TextContainer(text: '09/12/24',),
            10.h,
            PaymentCard(),
        
            14.h,
            TextContainer(text: '09/12/24',),
            10.h,
            PaymentCard(),
            14.h,
            TextContainer(text: '09/12/24',),
            10.h,
            PaymentCard(),
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
    );
  }
}

class TextContainer extends StatelessWidget {
  final String text;
  const TextContainer({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      decoration: BoxDecoration(
        color: context.extraLightGrey,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Text(text),
    );
  }
}
