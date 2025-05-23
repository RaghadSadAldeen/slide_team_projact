import 'package:flutter/material.dart';
import 'package:slide_app/constants/colors.dart';
import 'edit_profile_text.dart';

class EditableFields extends StatefulWidget {
 final Function({
 required String name,
 required String phone,
 required String address,
 required String email,
 required String major,
 }) onSave;
 final Function(String)? onNameChanged;
 const EditableFields({
  super.key,
  required this.onSave,
  this.onNameChanged,
 });

 @override
 State<EditableFields> createState() => _EditableFieldsState();
}
class _EditableFieldsState extends State<EditableFields> {
 final TextEditingController nameController = TextEditingController();
 final TextEditingController phoneController = TextEditingController();
 final TextEditingController addressController = TextEditingController();
 final TextEditingController emailController = TextEditingController();
 final TextEditingController majorController = TextEditingController();


 @override
 void dispose() {
  nameController.dispose();
  phoneController.dispose();
  addressController.dispose();
  emailController.dispose();
  majorController.dispose();
  super.dispose();
 }
 @override
 Widget build(BuildContext context) {
  return Column(
   crossAxisAlignment: CrossAxisAlignment.stretch,
   children: [
    EditProfileText(
     hintText: 'Name',
     icon: Icons.person,
     controller: nameController,
      onChanged: (value) {
       if (widget.onNameChanged != null) {
       widget.onNameChanged!(value); // 👈 نبلغ الصفحة الرئيسية بتغير الاسم
       }
      },
    ),
    EditProfileText(
     hintText: 'Phone',
     icon: Icons.phone,
     controller: phoneController,
     //keyboardType: TextInputType.phone,
    ),
    EditProfileText(
     hintText: 'Address',
     icon: Icons.location_on,
     controller: addressController,
    ),
    EditProfileText(
     hintText: 'Email',
     icon: Icons.email,
     controller: emailController,
     keyboardType: TextInputType.emailAddress,
    ),
    EditProfileText(
     hintText: 'Majoring',
     icon: Icons.school,
     controller: majorController,
    ),

    const SizedBox(height: 24),
    ElevatedButton(
     onPressed: () {
      widget.onSave(
       name: nameController.text,
       phone: phoneController.text,
       address: addressController.text,
       email: emailController.text,
       major: majorController.text,
      );
     },

     child: const Text(
      'Save',
      style: TextStyle(color: whiteColor),
     ),

     style: ElevatedButton.styleFrom(
      backgroundColor: deepForestGreen,
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(12),
      ),
     ),
    ),
   ],
  );
 }
}
