import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buyer Personal Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Buyer(),
    );
  }
}

class Buyer extends StatefulWidget {
  @override
  _BuyerState createState() => _BuyerState();
}

class _BuyerState extends State<Buyer> {
  late String name;
  late String email;
  late String phoneNumber;
  late String dob;
  late String address;
  late String dateOfBirth;
  late File idImage;
  late File photo;
  final _formKey = GlobalKey<FormState>();
  Future<void> _pickImage(ImageSource source, bool isIdImage) async {
    final pickedImage = await ImagePicker().getImage(source: source);
    setState(() {
      if (pickedImage != null) {
        if (isIdImage) {
          idImage = File(pickedImage.path);
        } else {
          photo = File(pickedImage.path);
        }
      }
    });
  }

  Widget buildTextField({
    String? labelText,
    String? hintText,
    Function(String)? onChanged,
    bool isObscureText = false,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
      onChanged: onChanged,
      obscureText: isObscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter $labelText';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buyers Registration Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              buildTextField(
                labelText: 'Name',
                hintText: 'Enter your name',
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Email',
                hintText: 'Enter your email',
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Address',
                hintText: 'Enter your address',
                onChanged: (value) {
                  setState(() {
                    address = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              buildTextField(
                labelText: 'DOB',
                hintText: 'Enter your DOB in DD/MM/YY',
                onChanged: (value) {
                  setState(() {
                    dob = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ListTile(
                title: Text('Upload Photo'),
                trailing: Icon(Icons.photo),
                onTap: () async {
                  var gallery;
                  await _pickImage(ImageSource.gallery, false);
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform form submission or data processing here
                    print('Name: $name');
                    print('Email: $email');
                    print('Phone Number: $phoneNumber');
                    print('Address: $address');
                    print('Date of Birth: $dateOfBirth');
                    print('Date of Birth: $dob');
                    print('Photo: $photo');
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
