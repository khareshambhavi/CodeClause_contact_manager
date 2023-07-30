import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_manager/pages/add_contact.dart';
import 'package:contacts_manager/pages/edit_contact.dart';
import "package:flutter/material.dart";
import 'package:iconly/iconly.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final contactsCollection =
      FirebaseFirestore.instance.collection("contacts").snapshots();
  void deleteContact(String id) async {
    await FirebaseFirestore.instance.collection("contacts").doc(id).delete();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color(0xffF88379),
          content: Text("Contact deleted",
              style: TextStyle(fontFamily: 'Montserrat'))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Center(
          child: const Text(
            "Contacts Manager",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        backgroundColor: Color(0xffde5753),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: StreamBuilder(
          stream: contactsCollection,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
              if (documents.isEmpty) {
                return Center(
                  child: Text("No contacts yet!",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          color: Color(0xffde5753))),
                );
              }
              return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final contact =
                        documents[index].data() as Map<String, dynamic>;
                    final contactId = documents[index].id;
                    final String name = contact["name"];
                    final String email = contact["email"];
                    final String phone = contact["phone"];
                    final String avatar =
                        'https://avatars.dicebear.com/api/avataaars/$name.png';
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                          title: Text(name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              )),
                          subtitle: Text("$phone \n$email"),
                          leading: Hero(
                            tag: contactId,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(avatar),
                            ),
                          ),
                          trailing:
                              Row(mainAxisSize: MainAxisSize.min, children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditContact(
                                              avatar: avatar,
                                              name: name,
                                              email: email,
                                              phone: phone,
                                              id: contactId,
                                            )));
                              },
                              icon: const Icon(IconlyBroken.edit),
                              splashRadius: 24,
                            ),
                            IconButton(
                              onPressed: () {
                                deleteContact(contactId);
                              },
                              icon: const Icon(IconlyBroken.delete),
                              splashRadius: 24,
                            )
                          ])),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text("there was an error"),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xffFBCEB1),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddContact(),
              ));
        },
        label: const Text("Add contact",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600)),
        icon: const Icon(
          IconlyBroken.document,
          color: Colors.black,
        ),
      ),
    );
  }
}
