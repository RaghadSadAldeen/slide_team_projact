import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../view_models/get_slide_view_model.dart';
import '../view_models/user_provider.dart';
import '../widgets/get_slidew.dart';

class GetSlideScreen extends StatefulWidget {
  const GetSlideScreen({super.key});

  @override
  State<GetSlideScreen> createState() => _GetSlideScreenState();
}

class _GetSlideScreenState extends State<GetSlideScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<GetSlideViewModel>(context, listen: false).fetchSlides()
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = Provider.of<UserProvider>(context).userProfile;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shared Slides',
          style: sectionTitleStyle.copyWith(color: deepForestGreen),
        ),
        centerTitle: true,
      ),
      body: Consumer<GetSlideViewModel>(
        builder: (context, viewModel, _) {
          final slides = viewModel.slides;

          if (slides.isEmpty) {
            return const Center(child: Text("No slides yet."));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: slides.length,
            itemBuilder: (context, index) {
              final slide = slides[index];
              return GetSlideCard(
                slide: slide,
                currentUserId: userProfile.userId,
              );
            },
          );
        },
      ),
    );
  }
}