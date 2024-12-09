import 'package:flutter/material.dart';
import 'package:intelli_click/home.dart';
import 'package:intelli_click/homepage.dart';

class Congratualtions extends StatefulWidget {
  const Congratualtions({super.key});

  @override
  State<Congratualtions> createState() => _CongratualtionsState();
}

class _CongratualtionsState extends State<Congratualtions> {
  bool isButtonEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){Navigator.pop(context);},
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 120,),
            Image.asset("assets/SuccessfulRegistrationss.png",height: 200),
            SizedBox(height: 20,),
            Text("Congratulations",style: TextStyle(color: Colors.green,fontSize: 22),),
            Text("Your account has been registered",style: TextStyle(color: Colors.black,fontSize: 13),),
            SizedBox(height: 70,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomePage()));
              },

              style: ElevatedButton.styleFrom(
                backgroundColor:
                 Color(0xff5C27FE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                const EdgeInsets.symmetric(vertical: 17, horizontal: 120),
              ),
              child: SizedBox(
                width: 80,
                child: Center(
                  child: Text(
                    'Go to Home',
                    style: TextStyle(
                      fontSize: 14,
                      color:
                      Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
