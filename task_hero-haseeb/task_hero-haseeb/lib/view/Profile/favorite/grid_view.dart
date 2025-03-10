import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/res/constants/app_colors.dart';
import 'package:cocoon/view/Hero/ServiceScreen.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> serviceNames = [
      'Cleaning',
      'Wall painting',
      'Cleaning',
      
    ];
    List<String> ratings = ['4.8', '4.8', '4.8'];
    List<String> followers = ['900+', '900+', '900+'];
    List<String> images = [
      "assets/images/Rectangle 85 (2).png",
      "assets/images/Rectangle 85 (3).png",
      "assets/images/Rectangle 85 (2).png",
      
    ];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), // Scroll ko disable kar raha hai, taki parent scroll ho
        itemCount: serviceNames.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.74, // Card ki width-height ka ratio adjust karna
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(
                () => const ServiceDetailScreen(),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    offset: const Offset(0, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      images[index],
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: AppColors.yellow, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            ratings[index],
                            style: const TextStyle(fontSize: 12, color: AppColors.purple),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "(${followers[index]})",
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/icons/favorite.svg',
                        height: 18,
                        width: 18,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    serviceNames[index],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "I will clean your house",
                    style: TextStyle(fontSize: 12, color: AppColors.gry),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  const Row(
                  
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("From", style: TextStyle(fontSize: 12, color: AppColors.gry)),
                      SizedBox(width: 2),
                      Text(
                        "\$25/hr",
                        style: TextStyle(fontSize: 14, color: AppColors.purple, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
