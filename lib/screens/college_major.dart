import 'package:flutter/material.dart';
import 'package:slide_team_project/datasource/data.dart';
import 'package:slide_team_project/models/college.dart';
import '../constants/bottom_nav_bar.dart';
import 'main_navigation.dart';
import 'package:slide_team_project/widgets/major_card.dart';
import 'package:slide_team_project/widgets/app_bar.dart';
import 'materials_page.dart';

class CollegeMajorsScreen extends StatefulWidget {
  final String collegeName;

  const CollegeMajorsScreen({super.key, required this.collegeName});

  @override
  State<CollegeMajorsScreen> createState() => _CollegeMajorsScreenState();
}

class _CollegeMajorsScreenState extends State<CollegeMajorsScreen> {
  int _selectedIndex = 0; // Default to home

  late final College? selectedCollege;

  @override
  void initState() {
    super.initState();
    selectedCollege = colleges.firstWhere(
          (college) => college.name == widget.collegeName,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainNavigation(initialIndex: index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final majors = selectedCollege?.majors ?? [];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "${widget.collegeName} Majors",
        showTitle: true,
        showLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Majors',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: majors.length,
                  itemBuilder: (context, index) {
                    final major = majors[index];
                    return MajorCard(
                      name: major.name,
                      icon: '🎓',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MaterialsPage(
                              majorName: major.name,
                              materials: major.materials
                                  .map((m) => {'title': m.name})
                                  .toList(),
                            ),
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
      ),
    );
  }
}
