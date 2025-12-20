import 'package:flutter/material.dart';
import 'package:mabeet/core/theme/app_colors.dart';

class HistoryShowDetails extends StatelessWidget {
  const HistoryShowDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.palette, color: AppColors.primary600),
          title: Text('Switched to Dark Mode'),
          subtitle: Text('2 hours ago'), //fawzy
        ),
        ListTile(
          leading: Icon(Icons.person, color: AppColors.primary600),
          title: Text('Updated Profile Name'),
          subtitle: Text('Yesterday'),
        ),
        ListTile(
          leading: Icon(Icons.language, color: AppColors.primary600),
          title: Text('Switched Language to Arabic'),
          subtitle: Text('3 days ago'),
        ),
        Divider(),
        Center(
          child: Text(
            'End of recent activity.',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
