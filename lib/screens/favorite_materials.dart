import 'package:flutter/material.dart' as flutter;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:slide_team_project/constants/bottom_nav_bar.dart';
import 'package:slide_team_project/constants/colors.dart';
import 'package:slide_team_project/view_models/favorites_view_model.dart';

class FavoriteMaterialsPage extends StatefulWidget {
  const FavoriteMaterialsPage({super.key});

  @override
  State<FavoriteMaterialsPage> createState() => _FavoriteMaterialsPageState();
}

class _FavoriteMaterialsPageState extends State<FavoriteMaterialsPage> {
  int _selectedIndex = 1;
  final FavoritesViewModel _viewModel = FavoritesViewModel();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid ?? "guest_user";

    return flutter.Scaffold(
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
                    color: deepForestGreen,
                  ),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<Map<String, dynamic>>>(
                stream: _viewModel.getFavoritesForUser(userId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const flutter.Center(child: flutter.CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const flutter.Center(child: Text("No favorites yet."));
                  }

                  final favorites = snapshot.data!;
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      final fav = favorites[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: sageGreen,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.menu_book, color: Colors.black),
                                const SizedBox(width: 10),
                                Text(
                                  fav['name'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () async {
                                await _viewModel.removeFavorite(fav['id']);
                              },
                            )
                          ],
                        ),
                      );
                    },
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
