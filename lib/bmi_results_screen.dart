import 'package:flutter/material.dart';

class BimResult extends StatelessWidget {
   final int result;
   final bool ismale;
   final int age;

  BimResult({

   required this.result,
    required this.ismale,
    required this.age
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Results")
      ),
      body: Column(
        children: [
          
          Text("Gender : ${ismale ? "Male" : "Female"}" ,
          style: TextStyle(

            fontWeight: FontWeight.bold,
            fontSize: 25,

          ),
          ),
          Text("Result : ${result}" ,
            style: TextStyle(

              fontWeight: FontWeight.bold,
              fontSize: 25,

            ),
          ),
          Text("Age : ${age}" ,
            style: TextStyle(

              fontWeight: FontWeight.bold,
              fontSize: 25,

            ),
          ),

        ],
      )
      ,
    );
  }
}