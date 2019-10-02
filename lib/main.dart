import 'package:agenda_contatos/ui/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: true,
    title: 'Agenda de Contatos',
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: HomePage(title: "Agenda de contatos"),
  ));
}
