import 'package:call/fechtdata/apicall.dart';
import 'package:flutter/material.dart';

class EditionDetailScreen extends StatelessWidget {
  final String name;
  final String language;
  final String type;
  final String source;
  final String comments;
  final String link;

  const EditionDetailScreen({
    required this.name,
    required this.language,
    required this.type,
    required this.source,
    required this.comments,
    required this.link,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Language: $language', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Type: $type', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Source: $source', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Comments: $comments', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Open the link in a web browser or handle it as needed

                Apicall().fetchchdta('link:$link');
              },
              child: const Text('View Link'),
            ),
          ],
        ),
      ),
    );
  }
}
