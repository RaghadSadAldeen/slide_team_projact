import 'package:flutter/material.dart';
import 'package:slide_team_project/constants/colors.dart';
import 'package:slide_team_project/constants/text_styles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sageGreen,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset('images/slide.png', height: 25),
            SizedBox(width: 10),
            Text(
              'Slide App',
           style: appBarTitleStyle,
           ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: Icon(Icons.close),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(),
            Container(
              //decoration: BoxDecoration(
                color: Colors.white,
              padding: EdgeInsets.only(bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: deepForestGreen,
                    width: 2,

                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hintText: 'Write your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'send',
                      style:  buttonTextStyle.copyWith(color: deepForestGreen),
                      ),
                    ),
                ],
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
