import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Color containerColor = Colors.amber;

  Color getRandomColor()   //function for random color
  {
   return Color.fromARGB(
       255,
       Random().nextInt(256),
       Random().nextInt(256),
       Random().nextInt(256)
   );
  }

  void changeColor()   //called when button is pressed to change the color
  {
      containerColor = getRandomColor();
  }

  int count = 0;       //declaring the count

  String currentEmoji = "😊";   //declare default emoji
  void updateEmoji()          //function to change the emoji
  {
      if(count<=3)
      {
        currentEmoji = "😊";
      } else if(count<=6)
      {
        currentEmoji = "☺️";
      } else if(count<=9)
      {
        currentEmoji = "😋";
      } else if(count<=12)
      {
        currentEmoji = "🤩";
      } else if(count<=16)
        {
          currentEmoji = "😋";
        } else
          {
            currentEmoji = "🤓";
          }
  }

  double borderRadiusValue = 30;  //default rounded box

  void changeShapeRandomly(){   //code for change shape randomly
    int randomShape = Random().nextInt(3);
    if(randomShape==0)
      {
        borderRadiusValue=0;   //sqare
      } else if(randomShape==1)
        {
          borderRadiusValue=30;   //rounded rectangle
        } else
          {
            borderRadiusValue=125;   //circle
          }
  }

  void reset()   //reset function for reset button
  {
    setState(() {
      count = 0;
      currentEmoji = "😊";
      containerColor = Colors.amber;
      borderRadiusValue = 30;
      textFont = 24;
    });
  }

  double textFont = 24;   //default font size


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MoodBox', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),),     //appbar title
        backgroundColor: Colors.amber[500],
      ),

      body: Container(      //container for whole screen
        height: double.infinity,
        width: double.infinity,
        child: Column(      //column for whole page
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(height: 50,),
            Text('Mood Counter', style: TextStyle(fontSize: textFont, fontWeight: FontWeight.w600),),

            SizedBox(height: 150),  //sizedBox for distance b/w OUTPUT container
            Center(
              child: Container(   //Container to show output color
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(borderRadiusValue),
                  border: Border.all(
                    width: 3,
                    color: Colors.grey[500]!,
                  ),

                  boxShadow: [BoxShadow(       //boxshadow for Output container
                    color: Colors.grey[500]!,
                    blurRadius: 5,
                    spreadRadius: 5,
                  )]
                ),

                child: Center(       //center for EMOJI
                  child: Text('${currentEmoji}', style: TextStyle(fontSize: 60),),    //Emoji
                ),
              ),
            ),

            SizedBox(height: 20,),    //sizedBox distance b/w count and container
            Container(             //countainer for count
              width: 130,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    width: 5,
                    color: containerColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                boxShadow: [BoxShadow(
                  color: containerColor,
                  blurRadius: 3,
                  spreadRadius: 1,
                  offset: Offset(2, 3)
                )]
              ),

              child: Center(       //Center for COUNT
                child: Text('Count: ${count}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
              ),
            ),

            SizedBox(height: 20,),   //for distance between button and the container
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  child: ElevatedButton(  //elevated button for increment
                      onPressed: (){setState(() {
                        count++;      //count increment
                        updateEmoji();  //update emoji
                        changeShapeRandomly();   //change shape Randomly
                        changeColor();
                        if(textFont<45)
                          {
                            textFont += 5;   //increment font
                          }
                      });},
                      child: Text('+', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21))
                  ),
                ),

                SizedBox(width: 20,),  //sizedBox for distance between +,- button
                SizedBox(          //SizedBox for set the width for the elevated button
                  width: 120,
                  child: ElevatedButton(      //elevated button for decrement--
                      onPressed: (){
                        setState(() {
                          if(count>0) {
                            count--;       //count decrement
                          }
                            updateEmoji();     //calling update emoji
                          changeShapeRandomly();   //calling changeShapeRandomly
                          if(textFont>10)
                            {
                              textFont -=5;    //decrease font
                            }
                          }
                        );
                      },
                      child: Text('-', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10,),    //set the space b/w first and second button row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(              //set the width of elevated button
                  width: 120,
                  child: ElevatedButton(  //elevated button for RESET
                      onPressed: reset,
                      child: Text('Reset', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21))
                  ),
                ),

                SizedBox(width: 20,),  //sizedBox for distance between +,- button
                SizedBox(
                  width: 120,
                  child: ElevatedButton(    //elevated button for COLOR
                    onPressed: (){
                      setState(() {
                        changeColor();
                      });
                    },
                    child: Text('Colour', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
