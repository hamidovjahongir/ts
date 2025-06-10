import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ts/core/utils/images.dart';
import 'package:ts/features/home/presentation/pages/home_screen.dart';

class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar({super.key});
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);
  final List<Widget> _screens = const [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  Color getIconColor(int index, int currentIndex) {
    if (currentIndex == index) {
      return Colors.black;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentIndexNotifier,
      builder: (context, currentIndex, _) {
        return Scaffold(
          body: IndexedStack(index: currentIndex, children: _screens),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) => _currentIndexNotifier.value = index,
            selectedLabelStyle: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
            unselectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon:
                    _currentIndexNotifier.value == 0
                        ? SvgPicture.asset(
                          AppImages.home2,
                          width: 24,
                          height: 24,
                        )
                        : SvgPicture.asset(
                          AppImages.home1,
                          width: 24,
                          height: 24,
                        ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon:
                    _currentIndexNotifier.value == 1
                        ? SvgPicture.asset(AppImages.t2, width: 24, height: 24)
                        : SvgPicture.asset(AppImages.t, width: 24, height: 24),
                label: '',
              ),
              BottomNavigationBarItem(
                icon:
                    _currentIndexNotifier.value == 2
                        ? SvgPicture.asset(AppImages.m2, width: 24, height: 24)
                        : SvgPicture.asset(AppImages.m1, width: 24, height: 24),
                label: '',
              ),
              BottomNavigationBarItem(
                icon:
                    _currentIndexNotifier.value == 3
                        ? SvgPicture.asset(
                          AppImages.instagiram2,
                          width: 24,
                          height: 24,
                        )
                        : SvgPicture.asset(
                          AppImages.instagram,
                          width: 24,
                          height: 24,
                        ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon:
                    _currentIndexNotifier.value == 3
                        ? SvgPicture.asset(
                          AppImages.chat,
                          width: 24,
                          height: 24,
                        )
                        : SvgPicture.asset(
                          AppImages.chat,
                          width: 24,
                          height: 24,
                        ),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
