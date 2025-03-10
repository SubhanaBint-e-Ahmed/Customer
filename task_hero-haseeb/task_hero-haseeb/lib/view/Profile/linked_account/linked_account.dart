import 'package:cocoon/res/constants/imports.dart';
import 'linked.dart';

class LinkedAccountView extends StatelessWidget {
  const LinkedAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: 'Linked accounts',
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                LinkedAccountCard(path: Assets.icons.google, title: 'Google'),
                15.h,
                LinkedAccountCard(path: Assets.icons.tapple, title: 'Apple'),
                15.h,
                LinkedAccountCard(path: Assets.icons.fb, title: 'Facebook'),
              ],
            ),
          ),
       AppButton.primary(
            title: "Apply",
            width: 200,
            onPressed: () {
              Get.to(() => LinkedAccountsScreen()); 
            },
          ),
          20.h
        ],
      ).paddingSymmetric(horizontal: 20),
    );
  }
}

class LinkedAccountCard extends StatelessWidget {
  final String path;
  final String title;
  const LinkedAccountCard({
    required this.path,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            SvgPicture.asset(path),
            10.w,
            Expanded(
              child: Text(
                title,
                style: context.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Switch(value: true, onChanged: (v) {}),
          ],
        ),
      ),
    );
  }
}
