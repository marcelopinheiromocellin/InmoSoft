import 'package:flutter/material.dart';

typedef Search = void Function(String);

class SearchInput extends StatefulWidget {
  final ThemeData themeType;
  final Search search;

  const SearchInput({
    Key key,
    @required this.themeType,
    @required this.search,
  }) : super(key: key);

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
   TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
       
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 45,
        child: TextField(
          autofocus: false,
          controller: searchController,
          onSubmitted: (value) => this.widget.search(searchController.text),
           style: TextStyle(color: Colors.grey),
          decoration: InputDecoration(
              border: new OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: widget.themeType.primaryColor, width: 1.0),
              ),
              labelStyle: TextStyle(color: widget.themeType.primaryColor),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: widget.themeType.primaryColor,
                ),
                onPressed: () {
                  this.widget.search(searchController.text);
                },
              ),
              suffixStyle: TextStyle(color: Color.fromRGBO(73, 163, 160, 1))),
        ),
      ),
    );
  }
}
