import 'package:flutter/material.dart';
import 'package:fullstack_taskmanagement/core/theme/app_palette.dart';
import 'package:fullstack_taskmanagement/presentation/pages/create-task/create_task.dart';
import 'package:fullstack_taskmanagement/presentation/pages/favorite-task/favorite_task.dart';
import 'package:fullstack_taskmanagement/presentation/pages/home/home.dart';

class NavigationBarBasic extends StatefulWidget {
  const NavigationBarBasic({super.key});

  @override
  State<NavigationBarBasic> createState() => _NavigationBarBasicState();
}

class _NavigationBarBasicState extends State<NavigationBarBasic> {
  int selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan
  final List<Widget> _pages = [
    const Home(), // Menggunakan Home() pada index 0
    const CreateTask(),
    const FavoriteTask(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: selectedIndex,
        selectedItemColor: AppPalette.buttonColorPrimary,
        unselectedItemColor: Colors.grey[500],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.add_box),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}
