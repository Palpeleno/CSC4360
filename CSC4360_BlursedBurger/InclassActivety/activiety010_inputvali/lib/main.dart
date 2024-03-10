// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      initialRoute: '/',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildNameField(),
          buildEmailnContactField(),
          buildPasswordField(),
          buildSubmitButton(),
        ],
      ),
    );
  }

  Widget buildNameField() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 100,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'First Name',
                labelText: 'First Name',
              ),
              validator: (firstName) {
                if (firstName == null || firstName.isEmpty) {
                  return 'Please enter First Name';
                }
                return null;
              },
            ),
          ),
        ),
        SizedBox(width: 16), // Add spacing between first and last name fields
        Expanded(
          child: SizedBox(
            height: 100,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Last Name',
                labelText: 'Last Name',
              ),
              validator: (lastName) {
                if (lastName == null || lastName.isEmpty) {
                  return 'Please enter Last Name';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildEmailnContactField() {
    return Row(children: [
      Expanded(
        child: SizedBox(
          width: 200,
          height: 100,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter your email',
              labelText: 'Email',
            ),
            validator: (email) {
              //email validation logic grep
              if (email == null || email.isEmpty) {
                return 'Please enter your valid Email';
              }
              // grep email validation
              if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                  .hasMatch(email)) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
        ),
      ),
      SizedBox(width: 16),
      Expanded(
        child: SizedBox(
          width: 200,
          height: 100,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter your contact #',
              labelText: 'Contact Number',
            ),
            validator: (contactnum) {
              //email validation logic grep
              if (contactnum == null || contactnum.isEmpty) {
                return 'Please enter your valid Email';
              }
              if (!RegExp(
                      r'^\+?1?\s?[-.\s]?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$')
                  .hasMatch(contactnum)) {
                return 'Enter a valid contact number';
              }
              return null;
            },
          ),
        ),
      ),
    ]);
  }

  Widget buildPasswordField() {
    return SizedBox(
      width: 300,
      // height: 100,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Enter your password',
          labelText: 'JohnDoe74!',
        ),
        validator: (password) {
          //email validation logic grep
          if (password == null || password.isEmpty) {
            return 'Password must be at least 6 chracters long';
          }
          if (password.length < 4) {
            return 'Password must be at least 4 characters long';
          }

          // Check if the password contains at least one digit
          if (!RegExp(r'\d').hasMatch(password)) {
            return 'Password must contain at least one digit';
          }

          // Check if the password contains at least one special character
          if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
            return 'Password must contain at least one special character';
          }

          if (password.length > 16) {
            return 'Password must not be longer than 16 characters';
          }
          return null;
        },
      ),
    );
  }

  Widget buildSubmitButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          onSubmitPressed();
        },
        child: Text('submit'),
      ),
    );
  }

  void onSubmitPressed() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Processing Data')),
      );
    }
  }
}
