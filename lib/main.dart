
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomePage(

      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('our bmi'),
      ),
      body: Container(
        color: Colors.amber,
        child: Center(
          child: SizedBox(

                  width: 300,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Normal weight: BMI between 18.5 and 24.9.',style:TextStyle(color:Colors.purple,)),
                  Text('BMI',style:TextStyle(
                      fontSize: 41,
                      fontWeight: FontWeight.w400
                  ),
                  ),
                  SizedBox(height: 21,),
                  TextField(
                    controller: wtController ,
                    decoration:  InputDecoration(
                      label: Text('Enter your weight in kgs '),
                      prefixIcon: Icon(Icons.line_weight)
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 11,),

                  TextField(
                    controller: ftController ,
                    decoration:  InputDecoration(
                        label: Text('Enter your height in Feet '),
                        prefixIcon: Icon(Icons.height_outlined)
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 11,),

                  TextField(
                    controller: inController,
                    decoration:  InputDecoration(
                      label: Text('Enter your height in Inch '),
                      prefixIcon: Icon(Icons.height)
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16,),
                  ElevatedButton(onPressed: (){
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if(wt!="" && ft!="" && inch!=""){

                            var iWt = int.parse(wt);
                            var iFt = int.parse(ft);
                            var iInch = int.parse(inch);

                            var tInch = (iFt*12) + iInch;

                            var tcm = tInch*2.54;

                            var tm = tcm/100;

                            var bmi = iWt/(tm*tm);
                            setState(() {

                              result = "your BMI is ${bmi.toStringAsFixed(2)}";
                            });




                    }else
                    {
                      setState(() {
                        result = "please fill all the required blanks!!";
                      });

                    }
                  }, child: Text('Calculate')),
                  SizedBox(height: 11,),
                  Text(result,style: TextStyle(fontSize: 21),),
                ],

            ),
          ),
        ),
      )
    );
  }
}
