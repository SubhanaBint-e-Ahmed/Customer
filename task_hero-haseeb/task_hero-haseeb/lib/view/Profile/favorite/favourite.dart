import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../res/constants/imports.dart';
import 'package:cocoon/res/constants/app_colors.dart';
import 'package:get/get.dart';
import 'hero_screen.dart'; 
import 'service_card.dart';
import 'grid_view.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  bool isGridView = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites', style: TextStyle(
                fontFamily: 'Gellix',
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
                height: 1.2,
                letterSpacing: 0.0,
              ),),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            const Text(
              "Bookmarked Heroes",
              style: TextStyle(
                fontFamily: 'Gellix',
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
                height: 1.2,
                letterSpacing: 0.0,
              ),
            ),
            const SizedBox(height: 10.0),

            const HeroScreen(),

            const SizedBox(height: 20.0),

          
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Liked Services",
                  style: TextStyle(
                    fontFamily: 'Gellix',
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                    height: 1.2,
                    letterSpacing: 0.0,
                  ),
                ),
                Row(
                  children: [
                  
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isGridView = false;
                        });
                      },
                      icon: SvgPicture.asset(
                        isGridView
                            ? 'assets/icons/list_view.svg' // Unselected
                            : 'assets/icons/list_filled.svg', // Selected
                        height: 24.0,
                        width: 24.0,
                      ),
                    ),
                    const SizedBox(width: 8),

                    
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isGridView = true;
                        });
                      },
                      icon: SvgPicture.asset(
                        isGridView
                            ? 'assets/icons/grid_filled.svg' 
                            : 'assets/icons/grid_view.svg', 
                        height: 24.0,
                        width: 24.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10.0),

          
            isGridView
                ? const GridViewScreen() 
                : Column(
                    children: List.generate(
                      5,
                      (index) => const ServiceCard(
                        title: 'Cleaning Service',
                        phoneNumber: '1234567890',
                        price: '25',
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
