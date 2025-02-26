import 'package:cocoon/res/constants/imports.dart';
import 'package:cocoon/res/constants/app_colors.dart';

class PickupLocation extends StatelessWidget {
  const PickupLocation({super.key});

  // Helper function to build the text section with SVG icons
  Widget _buildText(
      {required String iconPath,
      required String title,
      required String subtitle}) {
    return Container(
      width: 380,
      height: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1404060F), 
            blurRadius: 60,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(iconPath, width: 60, height: 60), 
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Gellix',
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    letterSpacing: 0,
                    height: 21.6 / 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: 'Gellix',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    letterSpacing: 0.2,
                    height: 14.4 / 12,
                    color: Color(0xFF9E9E9E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white, 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                Container(
                  width: 331,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/Pickupmap2.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // Expand button
                Positioned(
                  top: 95,
                  left: 220,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 6), 
                    decoration: BoxDecoration(
                      color: AppColors.purple, 
                      borderRadius:
                          BorderRadius.circular(100), 
                    ),
                    child: const Text(
                      'Expand',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          _buildText(
            iconPath: 'assets/icons/Ayyaz.svg',
            title: 'Ayyaz Haider',
            subtitle: '6238, Central Park, London, UK',
          ),
          const SizedBox(height: 16),

    
          _buildText(
            iconPath: 'assets/icons/Distance.svg',
            title: 'Distance',
            subtitle: '0.5 miles',
          ),
        ],
      ),
    );
  }
}
