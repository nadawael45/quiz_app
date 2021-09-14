import 'package:angelaquizapp/questions.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color? color;
  IconData? icon;
  int index=0;
  bool? checkAns;
List<Icon>ans=[];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body:SafeArea(
          child:
          Center(
            child: Column(
              children: [
              Expanded(flex:5,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(questionBank[index].question.toString(),textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                  ))),
                Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20),
                  child: Container(
                    width: double.infinity,
                    child: Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Padding(
                      padding: const EdgeInsets.only(right: 20,left: 20),
                      child: Container(
                        width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                               if(questionBank[index].answer==true){
                                 checkAns=true;
                               }else{
                                 checkAns=false;
                               }
                                checkMark();
                                nextquestion();
                             });
                            },
                            child: Text('True',style: TextStyle(color: Colors.white),),
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green,),
                                shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))  ),
                          ),
                      ),
                    ),

                          SizedBox(height: 15,),
                          Padding(
                            padding: const EdgeInsets.only(right: 20,left: 20),
                            child: Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    if(questionBank[index].answer==false){
                                      checkAns=true;
                                    }else{
                                      checkAns=false;
                                    }
                                    checkMark();
                                    nextquestion();                        });
                                },
                                child: Text('False',style: TextStyle(color: Colors.white),),
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red,),
                                    shape:MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))  ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Row(children:
                          ans
                            ,),
                          SizedBox(height: 15,),

                        ],
                      ),
                    ),
                  ),
                ),


              ],

            ),
          ),
        ) ,
      ) ,
    );
  }

   checkMark(){

      if(checkAns==true){
        ans.add(Icon(Icons.check,color:Colors.green ,));

      }else if(checkAns==false){
        ans.add(Icon(Icons.clear,color:Colors.red ,));
      };



  }
  nextquestion(){
  if(index<questionBank.length-1){
    index++;
  }else{

    ans=[];
    index=0;

  }
  }

}
