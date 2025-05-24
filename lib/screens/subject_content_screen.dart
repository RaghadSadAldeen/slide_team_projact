// import 'package:flutter/material.dart';
// import '../constants/colors.dart';
// import '../constants/text_styles.dart';
// import '../widgets/show_material/get_slides_button.dart';
// import '../widgets/show_material/show_material_card.dart';
//
// class SubjectContentScreen extends StatelessWidget {
//   const SubjectContentScreen({super.key});
//
//   final List<String> materials = const [
//     'Recorded lectures',
//     'Slides',
//     'First Exams',
//     'Secondary exams',
//     'Final exams',
//     'Home work',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whiteColor,
//       appBar: AppBar(
//         title: const Text('Slide', style: appTitleStyle),
//         backgroundColor: whiteColor,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text('Materials name', style: appTitleStyle),
//               const SizedBox(height: 50),
//               Expanded(
//                 child: GridView.builder(
//                   itemCount: materials.length,
//                   itemBuilder: (context, i) {
//                     return ShowMaterialCard(title: materials[i]);
//                   },
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 12,
//                     crossAxisSpacing: 12,
//                     childAspectRatio: 1,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0, bottom: 18.0),
//                 child: GetSlidesButton(
//                   text: 'Get Slides',
//                   onPressed: () {
//                     //راوتينج للجيت سلايد مع سعدالدين
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../widgets/show_material/get_slides_button.dart';
import '../widgets/show_material/show_material_card.dart';

class SubjectContentScreen extends StatelessWidget {
  final String materialTitle;

  const SubjectContentScreen({super.key, required this.materialTitle});

  final List<String> materials = const [
    'Recorded lectures',
    'Slides',
    'First Exams',
    'Secondary exams',
    'Final exams',
    'Assignment',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text('Slide', style: appTitleStyle),
        backgroundColor: whiteColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(materialTitle, style: sectionTitleStyle),
              const SizedBox(height: 50),
              Expanded(
                child: GridView.builder(
                  itemCount: materials.length,
                  itemBuilder: (context, i) {
                    return ShowMaterialCard(title: materials[i]);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 18.0),
                child: GetSlidesButton(
                  text: 'Get Slides',
                  onPressed: () {
                    // Navigate to GetSlides screen if needed
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
