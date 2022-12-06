import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Detail extends StatefulWidget {
  final String? image;
  final String? description;
  const Detail({this.image ,this.description,  super.key});
   
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(108, 30, 36, 50) ,
      body: SingleChildScrollView(
        child: Column(
          children: [
              Container(
                  margin: const EdgeInsets.only(top: 50),   
                  child: Image.network(
                    widget.image!,
                     fit: BoxFit.fill,
                  ),
                ),
                Card(
                  color: Color.fromARGB(216, 255, 223, 219),
                  margin: EdgeInsets.all(20),
                  elevation: 10,
                  child: Center(child: Text("${widget.description}",style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),)),)
          ],
        ),
      ),       
    );
  }
}