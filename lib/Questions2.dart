import 'package:flutter/material.dart';
import 'package:learntofly/Journal.dart';
enum SingingCharacter { awesome, great, fair, bad, veryBad }

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);




  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {

  SingingCharacter? _character = SingingCharacter.awesome;

  var child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Learn to Fly'),
      ),
      body: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 100, right: 100, top: 40),

                  child: Column(
                    children: [

                      Text('Take Quiz',
                        style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue[700] ),),

                      SizedBox(height: 20,),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('/Images/mht.png'),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Text('Welcome Back'),
                SizedBox(height: 10,),
                Text('Hey Samson, How are you doing today?'),
                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.only(left: 120, right: 20,top: 10),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Awesome'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.awesome,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Great'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.great,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Fair'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.fair,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Bad'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.bad,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Very Bad'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.veryBad,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          )


      ),
      floatingActionButton:  ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Journal()),
            );
          },
          child: const Text("Continue")
      ),
      //const SizedBox(height: 20),

    );


  }
}
