import 'package:flutter/material.dart';
import 'package:cocoon/res/constants/imports.dart';

class AppartmentcleaningScreen extends StatelessWidget {
  const AppartmentcleaningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; 

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           
            const Text(
              'Task',
              style: TextStyle(
                fontFamily: 'Gellix',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                height: 28.8 / 24,
              ),
              textAlign: TextAlign.left,
            ),
            SvgPicture.asset(
              'assets/icons/crcle.svg',
              height: 24,
              width: 24,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            
              const Text(
                'Apartment cleaning',
                style: TextStyle(
                  fontFamily: 'Gellix',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  height: 28.8 / 24,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(height: 16),

             
              Container(
                width: screenWidth * 0.9, 
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Budget',
                      style: TextStyle(
                        fontFamily: 'Gellix',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        height: 25.2 / 18,
                        letterSpacing: 0.2,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '\$13.7',
                        style: TextStyle(
                          fontFamily: 'Gellix',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          height: 25.2 / 18,
                          letterSpacing: 0.2,
                          color: Color(0xFF642D91),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Main Content Container (Made Responsive)
              Container(
                width: screenWidth * 0.9,
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(
                              fontFamily: 'Gellix',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 22.4 / 16,
                              letterSpacing: 0.2,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sodales nunc quis diam efficitur, nec fringilla lacus consequat.',
                            style: TextStyle(
                              fontFamily: 'Gellix',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 19.6 / 16,
                              letterSpacing: 0.2,
                              color: Color(0xFF9E9E9E),
                            ),
                          ),
                        ],
                      ),
                    ),

                  
                    _buildCard('Images', _buildImageGrid(screenWidth)),
                    const SizedBox(height: 16),
                    Container(
                      width: 332, 
                      height: 1, 
                      color: const Color(0xFFEEEEEE),
                    ),
                    const SizedBox(height: 16),
                    // Room Info
                    _buildInfoRow('Rooms', '4'),
                    _buildInfoRow('Bathrooms', '2'),
                    _buildInfoRow('Kitchen', '1'),
                    const SizedBox(height: 16),
                    Container(
                      width: 332, 
                      height: 1, 
                      color: const Color(0xFFEEEEEE), 
                    ),
                    const SizedBox(height: 16),

                    
                    _buildCard('Location', _buildLocationMap(screenWidth)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Container(
      width: 332,
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin:
          const EdgeInsets.only(bottom: 10), 
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Gellix',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 22.4 / 16,
              letterSpacing: 0.2,
              color: Colors.black, 
            ),
          ),
          Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontFamily: 'Gellix',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 19.6 / 14,
              letterSpacing: 0.2,
              color: Color(
                  0xFF642D91), 
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, Widget content) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Gellix',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 22.4 / 16,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 10),
          content,
        ],
      ),
    );
  }

 
  Widget _buildImageGrid(double screenWidth) {
    return SizedBox(
      width: double.infinity,
      height: 130,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            _buildImage('assets/images/image 32.png', screenWidth),
            const SizedBox(width: 10), 
            _buildImage('assets/images/image 32.png', screenWidth),
            const SizedBox(width: 10),
            _buildImage('assets/images/image 32.png', screenWidth),
            const SizedBox(width: 10), 
            _buildImage('assets/images/image 32.png', screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String imagePath, double screenWidth) {
    double imageSize = (screenWidth - 64) / 3; 

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        imagePath,
        width: imageSize,
        height: imageSize,
        fit: BoxFit.cover,
      ),
    );
  }

  // Fixed Location Map
  Widget _buildLocationMap(double screenWidth) {
    return Container(
      width: 332,
      height: 210,
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.only(bottom: 10), 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          const Text(
            '29 Park Road, Central Park, London, UK',
            style: TextStyle(
              fontFamily: 'Gellix',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 19.6 / 14,
              letterSpacing: 0.2,
              color: Color(0xFF9E9E9E),
            ),
          ),
          const SizedBox(height: 10),

          ClipRRect(
            borderRadius: BorderRadius.circular(16), 
            child: Container(
              width: 331,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                'assets/images/Map.png', 
                width: 331,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
