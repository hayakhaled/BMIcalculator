import 'dart:math';

import 'package:bmicalculator/bmi_results_screen.dart';
import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {

  bool isMale = true;

  double height = 120.0;

  int age = 20;
  int weight =40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),

      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      GestureDetector(

                        onTap: (){
                          setState(() {
                            isMale =true;
                          });
                        },
                        child: Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: isMale ? Colors.blue : Colors.grey[400],

                                borderRadius: BorderRadius.circular(10)
                            ),
                            padding: EdgeInsets.all(16),
                           width: 150,
                            child: Column(
                              children: [
                                Image(image:AssetImage("assets/images/male-gender.png",),
                                  height:70.0, width: 70.0,),
                                Text("Male",style: TextStyle(fontSize: 25),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(20))
                      ,GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: !isMale ? Colors.blue : Colors.grey[400],

                            borderRadius: BorderRadius.circular(10)
                          ),

                          // width: 150,
                          width: 150,
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Image(image:AssetImage("assets/images/femenine.png",),
                                height:70.0, width: 70.0,),
                              Text("Female",style: TextStyle(fontSize: 25),)
                            ],
                          ),
                        ),
                      )
                    ],

                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child:
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.00),
                color: Colors.grey[400]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT",style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text("${height.round()}",style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold)),
                      Text("CM",style: TextStyle(fontSize: 13 ,))
                    ],
                  ),

                  Slider(value: height,
                      max: 220,
                      min: 80,
                      onChanged:(value){
                     setState(() {
                       height= value;
                     });
                  })

                ],
              ),
            ),
          ),
    ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(

                        decoration: BoxDecoration(
                            color: Colors.grey[400],

                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.all(20),
                        width: 150,
                        child: Column(
                          children: [
                            Text("Weight",style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold),),
                            Text("$weight",style: TextStyle(fontSize: 29 , fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                SizedBox(height: 50,width: 38,
                                  child: FloatingActionButton(onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  child: Icon(Icons.remove),
                                  ),
                                ),

                                SizedBox(width: 10,),
                                SizedBox(height: 50,width: 38,
                                  child: FloatingActionButton(onPressed: (){
                                    setState(() {
                                      weight++;
                                    });

                                  },
                                    child: Icon(Icons.add),

                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(20))
                      ,Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[400],

                            borderRadius: BorderRadius.circular(10)
                        ),

                        // width: 150,
                        width: 150,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text("Age",style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold),),
                            Text("$age",style: TextStyle(fontSize: 29 , fontWeight: FontWeight.bold),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                SizedBox(height: 50,width: 38,
                                  child: FloatingActionButton(onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                    child: Icon(Icons.remove),
                                  ),
                                ),

                                SizedBox(width: 10,),
                                SizedBox(height: 50,width: 38,
                                  child: FloatingActionButton(onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                    child: Icon(Icons.add),

                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      )
                    ],

                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            height: 50,
            child: MaterialButton(onPressed: (){
              setState(() {
                double result = weight / pow(height / 100 , 2);
                Navigator.push(context, MaterialPageRoute(builder:(context) => BimResult(
                  ismale: isMale,
                  age: age,
                  result: result.round(),

                )));
              });

            },
            child: Text(
              'Calculate'
            ),
            ),
          )


        ],
      ),
    );
  }
}

// Expanded(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text("AGE",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
// Text("180" ,style: TextStyle(fontSize: 27 , fontWeight: FontWeight.bold),),
//
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Container(
// height: 45,
// width: 45,
// child: FloatingActionButton(onPressed: (){},
// child: Icon(Icons.remove),
//
// backgroundColor: Colors.blue,
// ),
// ),
// SizedBox(width: 10,),
// Container(
// height: 45,
// width: 45,
// child: FloatingActionButton(onPressed: (){},
// child: Icon(Icons.add),
//
// backgroundColor: Colors.blue,
// ),
// ),
// ],
// )
// ],
// ),
// ),
//
//
