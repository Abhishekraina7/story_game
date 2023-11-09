import 'package:flutter/material.dart';
import 'story_brain.dart';


void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
      return MaterialApp(
      theme: ThemeData.dark(), //learn about this from documentation
      home: StoryPage(),
        debugShowCheckedModeBanner: true,// This pulls the statefull widget wale sare functions
    );
  }
}


class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain brain = StoryBrain();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(    //SOMETHING NEW: Search and read about it.
          image:DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover
          )
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
               Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    brain.getStory(),
                    style: const TextStyle(
                        fontSize: 25.0,color:Colors.white
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                margin: const EdgeInsets.all(1.0),
                  color: Colors.red,
                  child:TextButton(

                  onPressed: (){
                     setState(() {
                       brain.nextStory(1);
                     });
                  },
                  child:  Text(
                    brain.getChoice1(),
                    style: const TextStyle( fontSize: 20.0,color: Colors.white),
                  ),
                ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),

              Visibility(
                visible: brain.buttonvisibility(),
                child: Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(1.0),
                    color: Colors.blue,
                    child:TextButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
                      onPressed: (){
                          setState(() {
                            brain.nextStory(2);
                          });
                      },


                      child:  Text(

                        brain.getChoice2(),
                        style: const TextStyle(
                            fontSize: 20.0,color:Colors.white
                        ),
                      ),
                    ),),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

