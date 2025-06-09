import 'package:flutter/material.dart';

class GetSlideViewModel extends ChangeNotifier {
  void onBorrowSlidePressed(BuildContext context) {
    print("Borrowing slide clicked");
    // مثال على التنقل: Navigator.pushNamed(context, '/borrow');

  }
}
