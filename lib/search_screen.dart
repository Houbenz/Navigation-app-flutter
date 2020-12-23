import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  bool odd=false;
  double height, width =50;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(50, (index) {
            if(index.isOdd){
              height=150;
              width=150;
            }else{
              height=50;
              width=50;
            }
            return Container (
                margin: EdgeInsets.all(1),

                child:Image(
                    width:  width,
                    height: height,
                    fit: BoxFit.cover,
                    image: NetworkImage("https://i.imgur.com/Wo98jHG.jpeg")));
          })),
    );
  }
}
