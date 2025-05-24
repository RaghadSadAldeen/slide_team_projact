// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:slide_team_project/constants/colors.dart';
// import 'package:slide_team_project/constants/text_styles.dart';
// import 'package:slide_team_project/widgets/edit_profile_screen/edit_able_Fields.dart';
// import 'package:slide_team_project/widgets/edit_profile_screen/profile_image_picker.dart'; // استيراد ويدجت الصورة
// import 'package:slide_team_project/screens/profile_screen.dart';
//
// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({super.key});
//
//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }
//
// class _EditProfileScreenState extends State<EditProfileScreen> {
//   String userName = '';
//   File? _imageFile;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           'Edit Profile',
//           style: sectionTitleStyle,
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Container(
//             padding: const EdgeInsets.all(16.0),
//             constraints: const BoxConstraints(maxWidth: 400),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const SizedBox(height: 20),
//                 ProfileImagePicker(
//                   imageFile: _imageFile,
//                   onImagePicked: (pickedFile) {
//                     setState(() {
//                       _imageFile = pickedFile;
//                     });
//                   },
//                 ),
//                 const SizedBox(height: 12),
//                 Text(
//                   userName.isEmpty ? 'Your Name' : userName,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 EditableFields(
//                   onSave: ({
//                     required String name,
//                     required String phone,
//                     required String address,
//                     required String email,
//                     required String major,
//                   }) {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => ProfileScreen(
//                     //       name: name,
//                     //       phone: phone,
//                     //       address: address,
//                     //       email: email,
//                     //       major: major,
//                     //     ),
//                     //   ),
//                     // );
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ProfileScreen(
//                           name: name,
//                           phone: phone,
//                           address: address,
//                           email: email,
//                           major: major,
//                           imageFile: _imageFile,
//                         ),
//                       ),
//                     );
//                   },
//                   onNameChanged: (value) {
//                     setState(() {
//                       userName = value;
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:slide_team_project/constants/text_styles.dart';
import 'package:slide_team_project/widgets/edit_profile_screen/edit_able_Fields.dart';
import 'package:slide_team_project/widgets/edit_profile_screen/profile_image_picker.dart';
import 'package:slide_team_project/screens/profile_screen.dart';
import 'package:slide_team_project/screens/add_slide_screen.dart'; // استيراد AddSlideScreen

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String userName = '';
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Edit Profile',
          style: sectionTitleStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: "Go to Add Slide",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddSlideScreen(profileImage: _imageFile),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                ProfileImagePicker(
                  imageFile: _imageFile,
                  onImagePicked: (pickedFile) {
                    setState(() {
                      _imageFile = pickedFile;
                    });
                  },
                ),
                const SizedBox(height: 12),
                Text(
                  userName.isEmpty ? 'Your Name' : userName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                EditableFields(
                  onSave: ({
                    required String name,
                    required String phone,
                    required String address,
                    required String email,
                    required String major,
                  }) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                          name: name,
                          phone: phone,
                          address: address,
                          email: email,
                          major: major,
                          imageFile: _imageFile,
                        ),
                      ),
                    );
                  },
                  onNameChanged: (value) {
                    setState(() {
                      userName = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
