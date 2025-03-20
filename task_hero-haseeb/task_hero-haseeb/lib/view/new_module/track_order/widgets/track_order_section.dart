import 'package:cocoon/res/constants/imports.dart';
import '../../track_order/track_order_screen.dart';

class TrackOrderSection extends StatelessWidget {
  const TrackOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/images/burger.png',
      'assets/images/burger.png',
      'assets/images/shoesRepair.png',
    ];

    List<String> titles = [
      'Double Sausage and Egg Muffin',
      'Double Sausage and Egg Muffin',
      'Shoes Repair',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Track Order',
          style: context.headlineMedium,
        ),
        10.h,
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: images.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Get.to(() => const TrackOrderScreen());
            },
            child: Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        images[index],
                        width: 70,
                        height: 70,
                      ),
                      10.w,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            titles[index],
                            style: context.headlineMedium,
                          ),
                          Text(
                            '12/19/2023 03:32 PM',
                            style: context.bodySmall,
                          ),
                          Row(
                            children: [
                              Text(
                                'Status:  ',
                                style: context.bodyLarge,
                              ),
                              Text(
                                'Processing',
                                style: context.bodyLarge!.copyWith(
                                  color: context.primary,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Divider(
                    color: context.extraLightGrey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'See more',
                        style:
                            context.bodyMedium!.copyWith(color: context.primary),
                      ),
                      SvgPicture.asset(Assets.icons.arrowRight, width: 20, height: 20),
                    ],
                  )
                ],
              ).paddingAll(10),
            ),
          ),
          separatorBuilder: (context, index) => 12.h,
        ),
      ],
    );
  }
}
