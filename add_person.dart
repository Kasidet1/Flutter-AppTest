import 'package:flutter/material.dart';

class AddPerson extends StatefulWidget {
  const AddPerson({super.key});

  @override
  State<AddPerson> createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Person'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                validator: (String? text) {
                  if (text!.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
                controller: _nameController,
                decoration: InputDecoration(hintText: 'Name'),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Phone number cannot be empty';
                  }
                  return null;
                },
                controller: _phoneNumberController,
                decoration: InputDecoration(hintText: 'Phone Number'),
              ),
              Expanded(child: SizedBox()),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      String name = _nameController.text;
                      String phoneNumber = _phoneNumberController.text;
                      Navigator.pop(context, {'name': name, 'phoneNumber': phoneNumber});
                    }
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
