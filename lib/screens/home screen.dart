import 'package:classes/Models/book.dart';
import 'package:classes/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    //final width = MediaQuery.of(context).size.width;
    final top = MediaQuery.of(context).padding.top;
    final actualHeight = height - 50 - top;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: AppBar(
            backgroundColor: Colors.blue,
            title: Text('Hi John,'),
            actions: [
              Icon(Icons.notification_add_outlined),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.search_rounded),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.network(
                      'https://media.istockphoto.com/photos/freedom-chains-that-transform-into-birds-charge-concept-picture-id1322104312?b=1&k=20&m=1322104312&s=170667a&w=0&h=VQyPkFkMKmo0e4ixjhiOLjiRs_ZiyKR_4SAsagQQdkk='),
                ),
                SizedBox(height: 20),
                Container(
                  height: 250,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        final book = books[index];
                        return InkWell(
                          onTap: (){
                           Get.to(()=> DetailScreen(book),transition: Transition.leftToRight);

                          },
                          child: Container(
                            height: height,
                            width: 370,
                            child: Row(
                              children: [
                                ClipRRect(
                                    borderRadius : BorderRadius.circular(15),
                                    child: Image.network(book.imageUrl)),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(book.title),
                                      Text(
                                        book.overview,
                                        maxLines: 7,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                      ),
                                      Text(book.star),
                                      Text(book.genre),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Align(
                     alignment: Alignment.centerLeft,
                      child: Text('You May also like',style: TextStyle(fontSize: 16),)),
                ),
                Container(
                  height: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        final book = books[index];
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          height: height,
                          width: 150,
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius : BorderRadius.circular(15),
                                  child: Image.network(book.imageUrl,fit:BoxFit.cover,)),
                              SizedBox(width: 10,),
                              Text(book.title),
                              SizedBox(height: 10,),
                              Text(book.genre),
                            ],
                          ),
                        );
                      }
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
