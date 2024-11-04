import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:swift_rides/providers/car_provider.dart';
import 'package:swift_rides/providers/user_provider.dart';
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
    {"icon": HugeIcons.strokeRoundedHome13, "title": "Home"},
    {"icon": HugeIcons.strokeRoundedSearch01, "title": "Search"},
    {"icon": HugeIcons.strokeRoundedArrowReloadHorizontal, "title": "History"},
    {"icon": HugeIcons.strokeRoundedUser, "title": "Profile"},
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshData();
    });
  }

  Future<void> _refreshData() async {
    await Provider.of<UserProvider>(context, listen: false).fetchUserData(context);
    await Provider.of<CarProvider>(context, listen: false).fetchCars();
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: _screens[_selectedIndex],
      ),
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
