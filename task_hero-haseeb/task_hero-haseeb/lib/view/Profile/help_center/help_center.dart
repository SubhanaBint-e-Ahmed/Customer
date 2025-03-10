import '../../../res/constants/app_colors.dart';
import '../../../res/constants/imports.dart';
import '../../home/widgets/task_card.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: SimpleAppBar(
          title: 'Help Center',
        ),
        body: Column(
          children: [
            TabBar(
                dividerColor: Colors.grey.shade400,
                tabs: [
                  Tab(text: 'FAQ',),
                  Tab(text: 'Badges',),
                  Tab(text: 'Contact us',),
                ]),
            16.h,
            Expanded(
              child: TabBarView(
                  children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            AppButton.primary(
                              onPressed: () {},
                              width: 100,
                              title: "General",
                              elevation: 0,
                              textColor: Colors.white,
                              height: 32,
                              background: AppColors.p1,
                            ),
                            10.w,
                            AppButton.outline(
                              onPressed: () {},
                              width: 100,
                              title: "Account",
                              elevation: 0,
                              borderColor: AppColors.p1,
                              height: 32,
                              background: Colors.white,
                            ),
                            10.w,
                            AppButton.outline(
                              onPressed: () {},
                              width: 100,
                              title: "Service",
                              elevation: 0,
                              borderColor: AppColors.p1,
                              height: 32,
                              background: Colors.white,
                            ),
                            10.w,
                            AppButton.outline(
                              onPressed: () {},
                              width: 100,
                              title: "Payment",
                              elevation: 0,
                              borderColor: AppColors.p1,
                              height: 32,
                              background: Colors.white,
                            ),
                                
                          ],
                        ),
                      ),
                      20.h,
                      CustomTextField(
                        prefixIcon: Assets.icons.search,
                        hintText: 'Search',
                         suffixIcon: Assets.icons.tFilter,
                      ),
                      16.h,
                      Card(
                        child: ExpansionTile(
                  
                          tilePadding: EdgeInsets.symmetric(horizontal: 10),
                          shape: Border(),
                          title: Text('What is Tashhero?'),children: [
                          Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.').paddingSymmetric(horizontal: 10)
                        ],),
                      ),
                      16.h,
                      Card(
                        child: ExpansionTile(
                  
                          tilePadding: EdgeInsets.symmetric(horizontal: 10),
                          shape: Border(),
                          title: Text('How to make a payment?'),children: [
                          Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.').paddingSymmetric(horizontal: 10)
                        ],),
                      ),
                      16.h,
                      Card(
                        child: ExpansionTile(
                  
                          tilePadding: EdgeInsets.symmetric(horizontal: 10),
                          shape: Border(),
                          title: Text('How do i cancel order?'),children: [
                          Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.').paddingSymmetric(horizontal: 10)
                        ],),
                      ),
                      16.h,
                      Card(
                        child: ExpansionTile(
                  
                          tilePadding: EdgeInsets.symmetric(horizontal: 10),
                          shape: Border(),
                          title: Text('How can I exit the app?'),children: [
                          Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.').paddingSymmetric(horizontal: 10)
                        ],),
                      ),
                    ],
                  ),
                ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Level 1 - Bronze',style: context.titleSmall!.copyWith(color: context.primary,fontSize: 18),),
                                      5.h,
                                      Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla in bibendum lacus. Aenean sit amet congue ex, ac tempor augue.')
                                    ],
                                  ),
                                ),
                                SvgPicture.asset('assets/icons/tbadge.svg',width: 48, height: 48,),
                              ],
                            ).paddingAll(15),
                          ),
                          16.h,
                          Card(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Level 2 - Sliver',style: context.titleSmall!.copyWith(color: context.primary,fontSize: 18),),
                                      5.h,
                                      Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla in bibendum lacus. Aenean sit amet congue ex, ac tempor augue.')
                                    ],
                                  ),
                                ),
                                SvgPicture.asset('assets/icons/tbadge1.svg',width: 48, height: 48,),
                              ],
                            ).paddingAll(15),
                          ),
                          16.h,
                          Card(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Level 3 - Gold',style: context.titleSmall!.copyWith(color: context.primary,fontSize: 18),),
                                      5.h,
                                      Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla in bibendum lacus. Aenean sit amet congue ex, ac tempor augue.')
                                    ],
                                  ),
                                ),
                                SvgPicture.asset('assets/icons/tbadge2.svg',width: 48, height: 48,),
                              ],
                            ).paddingAll(15),
                          ),
                          16.h,
                          Card(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Level 4 - Platinum',style: context.titleSmall!.copyWith(color: context.primary,fontSize: 18),),
                                      5.h,
                                      Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla in bibendum lacus. Aenean sit amet congue ex, ac tempor augue.')
                                    ],
                                  ),
                                ),
                                SvgPicture.asset('assets/icons/tbadge3.svg',width: 48, height: 48,),
                              ],
                            ).paddingAll(15),
                          ),
                          16.h,
                        ],
                      ),
                    ),

                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ContactCard(imagePath: Assets.icons.service,title: 'Custom Service',),
                          16.h,
                          ContactCard(imagePath: Assets.icons.whatsapp,title: 'WhatsApp',),
                          16.h,
                          ContactCard(imagePath: Assets.icons.web,title: 'Website',),
                          16.h,
                          ContactCard(imagePath: Assets.icons.facebook,title: 'Facebook',),
                          16.h,
                          ContactCard(imagePath: Assets.icons.x,title: 'x',),
                          16.h,
                          ContactCard(imagePath: Assets.icons.insta,title: 'Instagram',),
                          16.h,
                        ],
                      ),
                    )
              ]),
            )
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String imagePath;
  final String title;
  const ContactCard({
    required this.imagePath,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          SvgPicture.asset(imagePath),
          12.w,
          Text(title,style: context.titleSmall!.copyWith(fontSize: 14),)
        ],
      ).paddingAll(15),
    );
  }
}
