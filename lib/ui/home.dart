import 'dart:io';

import 'package:agenda_contatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Agenda de Contatos',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(title: "Agenda de Contatos"),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();
  List<Contact> contacts = List();

  @override
  void initState() {
    super.initState();

    bool debug = false;
    if (debug) {
      Contact c = Contact();
      c.name = "Gabriel Cunha";
      c.email = "gabriel@gmail.com";
      c.phone = "32329999";
      c.img = "imgTest";

      helper.saveContact(c);
    }

    helper.getAllContacts().then((list){
//      print(helper.getAllContacts());

      setState(() {
        contacts = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: contacts.length ,
              itemBuilder: (context, index) {
                return _contactsCard(context, index);
              },
            ),
    );
  }

  Widget _contactsCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Padding (
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: contacts[index].img != null ? FileImage(File(contacts[index].img)) : AssetImage("images/person.png"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      contacts[index].name ?? "",
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      contacts[index].email ?? "",
                      style: TextStyle(fontSize: 16.0),

                    ),
                    Text(
                      contacts[index].phone ?? "",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
