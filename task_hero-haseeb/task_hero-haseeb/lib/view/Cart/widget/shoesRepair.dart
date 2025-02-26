import 'package:flutter/material.dart';

class ShoesRepairScreen extends StatelessWidget {
  const ShoesRepairScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Your Item",
                style: TextStyle(
                  fontFamily: 'Gellix',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 21.6 / 18,
                  letterSpacing: 0.0,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 380, 
                height: 90, 
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300]!,
                  ),
                  borderRadius: BorderRadius.circular(16), 
                ),

                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset(
                        'assets/images/shoesRepair.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shoe Repair',
                            style: TextStyle(
                              fontFamily: 'Gellix',
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              height: 25.2 / 18,
                              letterSpacing: 0.0,
                            ),
                          ),
                          Text(
                            '1 Item',
                            style: TextStyle(
                              fontFamily: 'Gellix',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 19.2 / 18,
                              letterSpacing: 0.0,
                              color: Color(0xFF9E9E9E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),   const SizedBox(height: 16),
              Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildRoundedButton('Shoe Laces'),
            const SizedBox(width: 16), 
            _buildRoundedButton('Black Polish'),
          ],
        ),
            ],
          ),
        ));
  }
  Widget _buildRoundedButton(String text) {
  return ElevatedButton(
    onPressed: () {
      print('$text button pressed');
    },
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100), 
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16), 
      backgroundColor:  const Color.fromARGB(255, 220, 209, 240), 
      foregroundColor: Colors.deepPurple, 
      fixedSize: const Size(109, 32), 
    ),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontFamily: 'Gellix',
        fontWeight: FontWeight.w600,
        fontSize: 12,
        height: 19.6 / 14, 
        letterSpacing: 0.2,
        color: Colors.deepPurple, 
      ),
    ),
  );
}

}
