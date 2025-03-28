import 'package:flutter/material.dart';
import 'package:cocoon/res/constants/app_colors.dart';
import 'package:cocoon/view/Cart/widget/EmptyCartScreen.dart';
import 'package:cocoon/view/Cart/Task/EmptyTaskScreen.dart';
//import 'package:cocoon/view/Cart/widget/TaskItem.dart';
import 'package:cocoon/view/Cart/FoodOrderList.dart';
import 'package:cocoon/view/Cart/Task/TaskList.dart';
import 'package:cocoon/view/Cart/Offers/appartCleaning.dart';
import 'package:cocoon/view/Cart/Offers/EmptyOfferScreen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isCartEmpty = true;
  bool _isTasksEmpty = true;
    bool _isOfferEmpty = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _updateCartScreen() {
    setState(() {
      _isCartEmpty = false;

      /// _isTasksEmpty = false; // Change state to show food items
    });
  }

  void _updateTaskScreen() {
    setState(() {
      _isTasksEmpty = false; // Change state to show food items
    });
  }

  void _updateOfferScreen() {
    setState(() {
      _isOfferEmpty = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const Text(
            'Cart',
            style: TextStyle(
              fontFamily: 'Gellix',
              fontWeight: FontWeight.w700,
              fontSize: 20,
              height: 24 / 20,
              color: AppColors.purple,
            ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(41),
            child: Container(
              color: AppColors.white,
              child: TabBar(
                controller: _tabController,
                labelColor: AppColors.purple,
                unselectedLabelColor: const Color(0xFF9E9E9E),
                indicator: UnderlineTabIndicator(
                  borderSide:
                      const BorderSide(width: 4, color: AppColors.purple),
                  insets: const EdgeInsets.symmetric(horizontal: 75),
                  borderRadius: BorderRadius.circular(100),
                ),
                labelStyle: const TextStyle(
                  fontFamily: 'Gellix',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  height: 25.2 / 18,
                  letterSpacing: 0.2,
                ),
                tabs: const [
                  Tab(text: "Cart"),
                  Tab(text: "Tasks"),
                  Tab(text: "Offers"),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _isCartEmpty
              ? EmptyCartScreen(onIconTap: _updateCartScreen)
              : const FoodOrderList(),
          _isTasksEmpty
              ? EmptyTaskScreen(onIconTap: _updateTaskScreen)
              : const TaskList(),
          _isOfferEmpty
              ? EmptyOfferScreen(onIconTap: _updateOfferScreen)
              :  ListingScreen(),
        ],
      ),
    );
  }
}

