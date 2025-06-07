import 'package:flutter/material.dart' as flutter;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:slide_team_project/screens/favorite_materials.dart';
import 'package:slide_team_project/screens/subject_content_screen.dart';
import 'package:slide_team_project/widgets/app_bar.dart';
import 'package:slide_team_project/constants/bottom_nav_bar.dart';
import 'package:slide_team_project/view_models/favorites_view_model.dart';

class MaterialsPage extends StatefulWidget {
  final String majorName;
  final List<Map<String, String>> materials;

  const MaterialsPage({
    super.key,
    required this.majorName,
    required this.materials,
  });

  @override
  State<MaterialsPage> createState() => _MaterialsPageState();
}

class _MaterialsPageState extends State<MaterialsPage> {
  int _selectedIndex = 0;
  final FavoritesViewModel _viewModel = FavoritesViewModel();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.popUntil(context, (route) => route.isFirst);
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid ?? "guest_user";

    return flutter.Scaffold(
      appBar: CustomAppBar(
        title: widget.majorName,
        showTitle: true,
        showLeading: true,
        showActions: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoriteMaterialsPage(),
                ),
              );
            },
            icon: const Icon(Icons.favorite_outline, color: Colors.white),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Materials',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.materials.length,
                itemBuilder: (context, index) {
                  final material = widget.materials[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF90A88F),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => SubjectContentScreen(
                          //         materialTitle: material['title']!,
                          //       ),
                          //     ),
                          //   );
                          // },
                          child: Row(
                            children: [
                              const Icon(Icons.menu_book),
                              const SizedBox(width: 10),
                              Text(
                                material['title']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () async {
                            await _viewModel.addFavorite(
                              name: material['title']!,
                              userId: userId,
                              major: widget.majorName,
                            );
                            flutter.ScaffoldMessenger.of(context).showSnackBar(
                              const flutter.SnackBar(content: Text('Added to favorites')),
                            );
                          },
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
