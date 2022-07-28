import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learntofly/Questions.dart';
import 'package:learntofly/Utilities/ActivityTile.dart';

class Activity extends StatefulWidget {
  const Activity ({Key? key}) : super(key: key);
  @override
  State<Activity> createState() => _LoginState();
}

class _LoginState extends State<Activity> {
  TextEditingController timeGoalController = TextEditingController();
   List activityList =  [
      //[activityName, activityStarted, timeSpent 9sec), timeGoal (min)
      ['Exercise', false, 0, 1],
      ['Watch movies', false, 0, 50],
      ['Go for a trip', false, 0, 40],
      ['Meditate', false, 0, 10],
      ['Meet with Friends', false, 0, 30],
      ['Read', false, 0, 20],
      ['Code', false, 0, 17],
    ];
  @override
  void initState() {

    super.initState();
  }



  void activityStarted(int index) {
    //Note the start time
    var startTime = DateTime.now();

    //Time elapsed
    int elapsedTime = activityList[index][2];
    //habit started Habit stopped
    setState(() {
      activityList[index][1] = !activityList[index][1];
    });
    // Keep time going
    if (activityList[index][1]) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (activityList[index][1] == false) {
            timer.cancel();
          }
          //Calculate time elapsed by comparing current time and start time
          var currentTime = DateTime.now();
          //neg
          activityList[index][2] = elapsedTime +
              (currentTime.second - startTime.second) +
              (60 * (currentTime.minute - startTime.minute)) +
              (60 * 60 * (currentTime.hour - startTime.hour));

        });
      });
    }
  }

  void settingsOpened(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Settings for ${activityList[index][0]}",
              style: TextStyle(fontSize: 22 ),),
            content: SizedBox(
              height: 200,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text('Enter the number of minutes that you are comfortable with like (10)',
                      style:  TextStyle( fontSize: 16)),
                  const SizedBox(height: 20),
                  Material(
                    child: TextFormField(
                      controller: timeGoalController,

                    ),
                    color: Colors.grey[200],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  ElevatedButton(
                    onPressed: () {

                      Navigator.of(context).pop();
                      int result = int.parse(timeGoalController.text);

                      setState(() {
                         activityList[index][3] = result;
                      if (kDebugMode) {
                        print("pressed value $result");
                      }
                      });
                      timeGoalController.clear();
                    },
                    child: const Text('Update'),
                  ),
                ],
              ),
            ),
          );
        });
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timeGoalController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,

        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:const Text('Consistency is Key. '),
          centerTitle: false,
        ),
        body: ListView.builder(

            itemCount: activityList.length,
            itemBuilder: ((context, index) {
              return ActivityTile(
                activityName: activityList[index][0],
                onTap: () {
                  activityStarted(index);
                },
                settingsTapped: () {
                  settingsOpened(index);
                },
                activityStarted: activityList[index][1],
                timeSpent: activityList[index][2],
                timeGoal: activityList[index][3],

              );

            })),
        floatingActionButton:  ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Questions()),
              );
            },
            child: const Text("Questions")
        ),

    );
  }
}
