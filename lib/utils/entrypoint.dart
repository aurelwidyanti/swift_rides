import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:swift_rides/views/history/history_screen.dart';
import 'package:swift_rides/views/home/home_screen.dart';
import 'package:swift_rides/views/profile/profile_screen.dart';
import 'package:swift_rides/views/search/search_screen.dart';

class Entrypoint extends StatefulWidget {
  const Entrypoint({super.key});

  @override
  State<Entrypoint> createState() => _EntrypointState();
}

class _EntrypointState extends State<Entrypoint> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _navitems = [
    {"icon": HugeIcons.strokeRoundedHome13},
    {"icon": HugeIcons.strokeRoundedSearch01},
    {"icon": HugeIcons.strokeRoundedArrowReloadHorizontal},
    {"icon": HugeIcons.strokeRoundedUser},
  ];

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 72,
        child: CupertinoTabBar(
          backgroundColor: Colors.white,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          currentIndex: _selectedIndex,
          items: List.generate(
            _navitems.length,
            (index) => BottomNavigationBarItem(
              icon: HugeIcon(
                icon: _navitems[index]["icon"],
                color: _selectedIndex == index
                    ? const Color.fromRGBO(23, 93, 227, 1)
                    : const Color.fromARGB(255, 0, 0, 0),
                size: 24,
              ),
              label: _navitems[index]["title"],
            ),
          ),
        ),
      ),
    );
  }
}
