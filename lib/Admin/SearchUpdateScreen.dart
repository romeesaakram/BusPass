import 'package:flutter/material.dart';
class SearchUpdateScreen extends StatefulWidget {
  const SearchUpdateScreen({super.key});

  @override
  State<SearchUpdateScreen> createState() => _SearchUpdateScreenState();
}

class _SearchUpdateScreenState extends State<SearchUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(   appBar: AppBar(
      backgroundColor: Colors.teal.shade400,
      title: Text('Search & Update'),
    ));
  }
}
