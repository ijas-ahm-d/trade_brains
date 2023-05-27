import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade_brains/utils/colors.dart';
import 'package:trade_brains/view/home_screen.dart';
import 'package:trade_brains/view/watchlist_screen.dart';
import 'package:trade_brains/view_model/main_view_model.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final List body = [
    const HomeScreen(),
    const WatchListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainViewModel>();
    return Scaffold(
      backgroundColor: blackBG,
      body: body[provider.currentBottomIndex],
      bottomNavigationBar: NavigationBar(
  
        backgroundColor: kblack,
        onDestinationSelected: (value) {
          provider.changeBottom(value);
        },
        selectedIndex: provider.currentBottomIndex,
        destinations: const [
          
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: kwhite,
            ),
            label: "Home",
            
          ),
          NavigationDestination(
            icon: Icon(
              Icons.grid_view_sharp,
              color: kwhite,
            ),
            label: "Watchlist",
          ),
        ],
      ),
    );
  }
}