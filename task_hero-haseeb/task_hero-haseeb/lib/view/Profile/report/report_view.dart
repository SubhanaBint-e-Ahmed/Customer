import 'package:cocoon/res/constants/imports.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: 'Report',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Describe your problem or report any issue.',style: context.bodyLarge!.copyWith(fontSize: 15,fontWeight: FontWeight.w700),),
          10.h,
          Text('You can add pictures for prof or references (Optional)',style: context.bodySmall,),
          10.h,
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xfffafafa),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(children: [
              Expanded(child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut consequat lectus, eget tincidunt justo. Donec eu est tort|')),
              10.w,
              Icon(Icons.link)
            ],),
          ),
          10.h,
          Text('Note: Action will be taken after the thorough check up of your issue.',style: context.bodySmall,)
        ],
      ).paddingSymmetric(horizontal: 20),
    );
  }
}
