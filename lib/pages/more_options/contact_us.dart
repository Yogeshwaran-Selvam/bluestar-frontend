import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

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
        padding: const EdgeInsets.fromLTRB(20, 50, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Write to us @", style: TextStyle(fontSize: 16),),
            Link(
              uri: Uri.parse('mailto:customerservice@bluestarindia.com'),
              builder: (context, followLink) => TextButton(
                onPressed: followLink,
                child: Text('customerservice@bluestarindia.com'),
              ),
            ),
            SizedBox(height: 50,),
            Text("Call to us @", style: TextStyle(fontSize: 16),),
            Link(
              uri: Uri.parse('tel:18002091177'),
              builder: (context, followLink) => TextButton(
                onPressed: followLink,
                child: Text('1800 209 1177'),
              ),
            ),
            SizedBox(height: 50,),
            Text("Visit us @", style: TextStyle(fontSize: 16),),
            Link(
              uri: Uri.parse('https://www.bluestarindia.com'),
              builder: (context, followLink) => TextButton(
                onPressed: followLink,
                child: Text('https://www.bluestarindia.com'),
              ),
            ),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}