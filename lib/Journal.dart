import 'package:flutter/material.dart';

class Journal extends StatefulWidget {
  const Journal({Key? key}) : super(key: key);

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Learn to Fly'),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('/Images/bg.png'),
                  fit: BoxFit.cover
              )
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 100, right: 100, top: 40),

            child: Container(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text('Welcome Back',
                    style: TextStyle( fontSize: 16, color: Colors.white60)),
                  SizedBox(height: 20,),
                  Text('Daily Journal',
                    style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white ),),

                  //  Image.asset('assets/images/mht.png'),
                  SizedBox(height: 20,),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('/Images/mht.png'),
                  ),
                  SizedBox(height: 20,),
                  Text('Enter Passcode to proceed',
                      style: TextStyle( fontSize: 16,  color: Colors.white70)),
              SizedBox(height: 20,),
                  SizedBox(height: 40,),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your passcode',

                      border: OutlineInputBorder(),


                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),


                ],
              ),
            ),
          )


      ),
      // floatingActionButton:  ElevatedButton(
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => const Questions()),
      //       );
      //     },
      //     child: const Text("Continue")
      // ),
      //const SizedBox(height: 20),

    );
  }
}
