import 'package:classes/Models/book.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Book book;
  DetailScreen(this.book);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            height: 250,
            width: double.infinity,
            child: Image.network(
              book.imageUrl,
              fit: BoxFit.fill,
            )),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(book.title),
                  Column(
                    children: [
                      Text(book.star),
                      Text(book.genre),
                    ],
                  )
                ],
              ),
              Text(book.overview,style: TextStyle(fontFamily:'WaterBrush' ),),
              SizedBox(height: 150,),
              Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
              ),
                        minimumSize: Size(150, 50),
                        primary: Colors.blueAccent,
                      ),
                      onPressed: () {},
                      child: Text('Read Book')),
                  SizedBox(width: 30,),
                  OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        minimumSize: Size(100, 50),
                      ),

                      onPressed: () {

                  },
                      child: Text('More Info')
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
