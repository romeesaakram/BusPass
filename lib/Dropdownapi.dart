import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({Key? key}) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  final List<String> _categories = ['Place', 'Hotel'];
  String _selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Example'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: _selectedCategory.isEmpty ? null : _selectedCategory,
          hint: Text('Select a category'),
          onChanged: (String? value) {
            setState(() {
              _selectedCategory = value!;
            });
          },
          items: _categories.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            );
          }).toList(),
        ),
      ),
    );
  }
}
