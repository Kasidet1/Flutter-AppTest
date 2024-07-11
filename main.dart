import 'package:flutter/material.dart';
import 'add_person.dart'; // Import AddPerson widget
import 'contact.dart';
import 'contact_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.green),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contact> contactList = [
    Contact("Pu", "094-382-7090", "assets/images/1.jpg"),
    Contact("Oak", "093-708-2963", "assets/images/3.jpg"),
  ];

  void _addNewContact(String name, String phoneNumber) {
    setState(() {
      contactList.add(Contact(name, phoneNumber, "assets/images/placeholder.jpg"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact App"),
      ),
      body: ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (BuildContext context, int index) {
          Contact contact = contactList[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactDetailPage(contact: contact),
                ),
              );
            },
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactDetailPage(contact: contact),
                  ),
                );
              },
              child: ClipOval(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: Image.asset(contact.imageSource, fit: BoxFit.cover),
                ),
              ),
            ),
            title: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactDetailPage(contact: contact),
                  ),
                );
              },
              child: Text(contact.name),
            ),
            subtitle: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactDetailPage(contact: contact),
                  ),
                );
              },
              child: Text(contact.phoneNumber),
            ),
            trailing: Icon(Icons.person),
          );
        },
      ),
      floatingActionButton: Tooltip(
        message: 'Add',
        child: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPerson()),
            );
            if (result != null && result is Map<String, String>) {
              _addNewContact(result['name']!, result['phoneNumber']!);
            }
          },
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
