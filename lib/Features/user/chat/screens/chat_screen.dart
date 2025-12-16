import 'package:flutter/material.dart';
import '../widgets/chat_vector.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../data/repos/dummy_properties.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Message'))),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('All Messages', style: AppTextStyles.heading2Bold,),
            SizedBox(
              width: 400,
              height: 750,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final property = dummyProperties[index];
                  return Column(
                    children: [
                      ChatVector(),
                      Divider(),
                    ],
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
