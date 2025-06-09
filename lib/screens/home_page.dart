import 'package:flutter/material.dart';
import 'package:slide_team_project/datasource/data.dart';
import 'package:slide_team_project/models/college.dart';
import 'package:slide_team_project/screens/college_major.dart';
// import 'package:fluttertest/widgets/college_card.dart';
//import 'package:slide_team_project/constants//bottom_nav_bar.dart';
import 'package:slide_team_project/widgets/app_bar.dart';

import '../constants/bottom_nav_bar.dart';
import '../widgets/college_card.dart';

class CollegeGridScreen extends StatefulWidget {
  const CollegeGridScreen({super.key});
  //final String userId;
 // const CollegeGridScreen({super.key, required this.userId});
  @override
  State<CollegeGridScreen> createState() => _CollegeGridScreenState();
}

class _CollegeGridScreenState extends State<CollegeGridScreen> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  List<College> _filteredColleges = colleges;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }

  void _filterColleges(String query) {
    setState(() {
      _filteredColleges =
          colleges
              .where(
                (college) =>
                college.name.toLowerCase().contains(query.toLowerCase()),
          )
              .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _filterColleges(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      appBar: const CustomAppBar(
        title: 'University Colleges',
        showLeading: false,
        showActions: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Slide',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search colleges...',
                  filled: true,
                  fillColor: const Color(0xFFA3C1A8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Colleges',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refreshData,
                  child:
                  _filteredColleges.isEmpty
                      ? const Center(child: Text("No colleges found."))
                      : GridView.builder(
                    itemCount: _filteredColleges.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (context, index) {
                      final college = _filteredColleges[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => CollegeMajorsScreen(
                                collegeName: college.name,
                              ),
                            ),
                          );
                        },
                        child: CollegeCard(
                          imageUrl: college.imageUrl,
                          title: college.name,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
