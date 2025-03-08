import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BudgetWidget extends StatefulWidget {
  @override
  _BudgetWidgetState createState() => _BudgetWidgetState();
}

class _BudgetWidgetState extends State<BudgetWidget> {
  double _budget = 0;
  bool _showSuggestion = false;
  double _suggestedBudget = 140.7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
       
            const Text(
              "Set your budget",
              style: TextStyle(
                fontFamily: "Gellix",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 22.4 / 16,
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(height: 12),

          
            Container(
              width: 380,
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/Cash.svg',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Gellix",
                      ),
                      decoration: const InputDecoration(
                        hintText: "\$ 0",
                        hintStyle: TextStyle(color: Color(0xFF9E9E9E)),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _budget = double.tryParse(value) ?? 0;
                        });
                      },
                      onSubmitted: (value) {
                        _budget = double.tryParse(value) ?? 0;
                        showSuggestionBottomSheet(context);
                      },
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  void showSuggestionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(48),
          topRight: Radius.circular(48),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          width: 428,
          height: 377,
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
             
              Container(
                width: 38,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Average current fare calculated by your task and other service providers is: \$150',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Gellix",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  height: 24 / 20,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'We recommend raising your fare to \$${_suggestedBudget.toStringAsFixed(2)}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Gellix",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 22.4 / 16,
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(height: 40),

              // Buttons
              Column(
                children: [
                  // Raise Fare Button
                  SizedBox(
                    width: 380,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _budget = _suggestedBudget;
                          _showSuggestion = false;
                        });
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF642D91),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                      ),
                      child: const Text(
                        'Raise to \$140.7',
                        style: TextStyle(
                          fontFamily: "Gellix",
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          height: 22.4 / 16,
                          letterSpacing: 0.2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Close Button
                  SizedBox(
                    width: 380,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _showSuggestion = false;
                        });
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFF5F5F5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                      ),
                      child: const Text(
                        'Close',
                        style: TextStyle(
                          fontFamily: "Gellix",
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          height: 22.4 / 16,
                          letterSpacing: 0.2,
                          color: Color(0xFF642D91),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
