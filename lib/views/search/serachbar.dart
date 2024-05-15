import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 20,),
    Container(
    decoration: BoxDecoration(
    color: Colors.white,
      borderRadius: BorderRadius.circular(24),
    ),
    child: TextField(
    controller: _controller,
    decoration: InputDecoration(
    hintText: 'Rechercher',
    prefixIcon: Icon(Icons.search),
    border: InputBorder.none,
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    onChanged: (value) {
    // Effectuez la recherche ici
    },
    ),
    )

    ],);
  }
}
