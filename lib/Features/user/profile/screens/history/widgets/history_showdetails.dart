import 'package:flutter/material.dart';

class HistoryShowDetails extends StatelessWidget {
  const HistoryShowDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // This ListView was moved from the original HistoryScreen
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.palette, color: Colors.deepPurple),
          title: Text('Switched to Dark Mode'),
          subtitle: Text('2 hours ago'), //fawzy
        ),
        ListTile(
          leading: Icon(Icons.person, color: Colors.deepPurple),
          title: Text('Updated Profile Name'),
          subtitle: Text('Yesterday'),
        ),
        ListTile(
          leading: Icon(Icons.language, color: Colors.deepPurple),
          title: Text('Switched Language to Spanish'),
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
