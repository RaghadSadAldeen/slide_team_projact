import 'package:flutter/material.dart';
import 'package:fluttertest/widgets/bottom_nav_bar.dart';

class FavoriteMaterialsPage extends StatefulWidget {
  const FavoriteMaterialsPage({super.key});

  @override
  State<FavoriteMaterialsPage> createState() => _FavoriteMaterialsPageState();
}

class _FavoriteMaterialsPageState extends State<FavoriteMaterialsPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:

        break;
      case 1:

        break;
      case 2:

        break;
      case 3:

        break;
    }
  }

  final List<String> favoriteMaterials = [
    'Materials Name',
    'Materials Name',
    'Materials Name',
    'Materials Name',
    'Materials Name',
    'Materials Name',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  'Favorite Materials',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1D3B2A),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: favoriteMaterials.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF90A88F),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.menu_book, color: Colors.black),
                        const SizedBox(width: 10),
                        Text(
                          favoriteMaterials[index],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
