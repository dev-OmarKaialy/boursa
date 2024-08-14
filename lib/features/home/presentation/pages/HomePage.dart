import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:p_boursa/core/extensions/context_extensions.dart';
import 'package:p_boursa/core/utils/SideMenu.dart';
import 'package:p_boursa/features/advertisements/advertisements_screen.dart';
import 'package:p_boursa/features/auth/presentation/pages/MyTender.dart';
import 'package:p_boursa/features/home/presentation/pages/Search.dart';
import 'package:p_boursa/features/home/presentation/pages/favor_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.black.withOpacity(0.5),
      backgroundColor: Colors.white,
      drawer: const SideMenu(),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.format_list_bulleted,
              color: Colors.white,
            ),
          );
        }),
        backgroundColor: const Color(0xFF003B85),
        iconTheme: const IconThemeData(
          size: 35.0,
        ),
      ),
      body: SizedBox(
        width: context.width(),
        child: IndexedStack(
          index: currentIndex,
          children: [
            const My_tender(),
            const Search(),
            const My_tender(),
            const favorScreen(),
            AdvertisementsScreen(),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: const Color(0xFF003B85),
        animationDuration: const Duration(microseconds: 300),
        height: 55.0,
        index: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          SizedBox(
            height: 30.0,
            width: 30.0,
            child: SvgPicture.asset(
              "assets/icons/investigation.svg",
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 30.0,
            width: 30.0,
            child: SvgPicture.asset(
              "assets/icons/Search.svg",
              color: Colors.white,
            ),
          ),
          const Icon(
            Icons.home_outlined,
            color: Colors.white,
            size: 30.0,
          ),
          SizedBox(
            height: 30.0,
            width: 30.0,
            child: SvgPicture.asset(
              "assets/icons/Favorite.svg",
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 30.0,
            width: 30.0,
            child: SvgPicture.asset(
              "assets/icons/marketing.svg",
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
