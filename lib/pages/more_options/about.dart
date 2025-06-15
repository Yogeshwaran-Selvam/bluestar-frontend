import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Contact Us'),
        toolbarHeight: 50,
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 350,),
            const Text('--Blue Star logo--'),
            const Text('1.0.0'),
            SizedBox(height: 50,),
            Link(uri: Uri.parse('https://www.bluestarindia.com'), builder: (context, followLink) {
              return TextButton(
                onPressed: followLink,
                child: const Text('https://www.bluestarindia.com'),
              );
            }),
            const Text(
              'This app is owned and operated by Blue Star Limited.\nCopyrights 2024 Blue Star Limited\nAll Rights Reserverd.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}