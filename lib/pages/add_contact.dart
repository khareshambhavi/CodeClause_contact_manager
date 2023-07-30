import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void addContact() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection("contacts").add({
          "name": nameController.text.trim(),
          "phone": phoneController.text.trim(),
          "email": emailController.text.trim(),
        });
        if (mounted) {
          Navigator.pop(context);
        }
      } on FirebaseException {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xffF88379),
          content: Text("Failed to add contact",
              style: TextStyle(fontFamily: 'Montserrat')),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xffF88379),
          content: Text(
            "Please fill all the details",
            style: TextStyle(fontFamily: 'Montserrat'),
          )));
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Row(
            children: [
              SizedBox(width: 67),
              Text(
                "Add Contact",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
          backgroundColor: Color(0xffde5753),
        ),
        body: ListView(padding: EdgeInsets.all(20), children: [
          Form(
            key: _formKey,
            child: Column(children: [
              SizedBox(height: 15),
              TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: Colors.black,
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffde5753)),
                          borderRadius: BorderRadius.circular(50.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFFF5EE)),
                          borderRadius: BorderRadius.circular(50.0)),
                      filled: true,
                      fillColor: Color(0xffFFF5EE),
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.grey))),
              SizedBox(height: 20),
              TextFormField(
                  keyboardType: TextInputType.phone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: Colors.black,
                  controller: phoneController,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a phone number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffde5753)),
                          borderRadius: BorderRadius.circular(50.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFFF5EE)),
                          borderRadius: BorderRadius.circular(50.0)),
                      filled: true,
                      fillColor: Color(0xffFFF5EE),
                      hintText: "Phone",
                      hintStyle: TextStyle(color: Colors.grey))),
              SizedBox(height: 20),
              TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: Colors.black,
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter an email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffde5753)),
                          borderRadius: BorderRadius.circular(50.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFFF5EE)),
                          borderRadius: BorderRadius.circular(50.0)),
                      filled: true,
                      fillColor: Color(0xffFFF5EE),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey))),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Color(0xffde5753),
                    ),
                    onPressed: () {
                      addContact();
                    },
                    label: Text("Add contact",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600)),
                    icon: const Icon(
                      IconlyBroken.add_user,
                    )),
              )
            ]),
          )
        ]));
  }
}
