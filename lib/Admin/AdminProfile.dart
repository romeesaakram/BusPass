import 'package:flutter/material.dart';
class AdminProfil extends StatefulWidget {
  const AdminProfil({super.key});

  @override
  State<AdminProfil> createState() => _AdminProfilState();
}

class _AdminProfilState extends State<AdminProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(   appBar: AppBar(
      backgroundColor: Colors.teal.shade400,
      title: Text('Profile'),
    ));
  }
}
