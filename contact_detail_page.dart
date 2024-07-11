import 'package:flutter/material.dart';
import 'contact.dart';

class ContactDetailPage extends StatelessWidget {
  final Contact contact;
  const ContactDetailPage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(contact.imageSource, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Name: ${contact.name}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Tel: ${contact.phoneNumber}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
