import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
class ActivityTile extends StatelessWidget {
  final String activityName;
  final VoidCallback onTap;
  final VoidCallback settingsTapped;
  final int timeSpent;
  final int timeGoal;
  final bool activityStarted;
  const ActivityTile(
  {
    Key? key,
    //required this.activityName,
    required this.onTap,
    required this.activityName,
    required this.settingsTapped,
    required this.timeSpent,
    required this.timeGoal,
    required this.activityStarted,
    }): super(key: key);

  //covert seconds into minutes
  String convertMinToSec(int totalSeconds){

    String secs = (totalSeconds % 60).toString();
    String mins = (totalSeconds / 60).toStringAsFixed(5);

    //if sec is a one digit number place a 0 infront of it
    if(secs.length == 1){
      secs = '0$secs' ;
    }

    //if min is a one digit number
    if(mins[1] == '.'){
      mins = mins.substring(0, 1);
    }
    return '$mins:$secs' ;
  }

  // Calculate progress
  double percentCompleted(){


    return (timeSpent/ (timeGoal*60)).toDouble();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
      child: Container(
          padding: const EdgeInsets.all(20.0),

          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 //Progress Circle
              Row(
                children:  [
                  GestureDetector(
                    onTap: onTap,
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Stack(
                        children: [
                          CircularPercentIndicator(
                            radius:20,
                            percent: percentCompleted() < 1.0 ? percentCompleted() : percentCompleted() < 0.0 ? 0.5: 1.0 ,
                            progressColor: percentCompleted() > 0.5 ?
                            (percentCompleted() > 0.75 ? Colors.green : Colors.orange):
                            Colors.red,
                          ),
                          //play, pause button
                          Center(
                              child: Icon(activityStarted ? Icons.pause : Icons.play_arrow),
                          )

                        ],
                      ),
                    ),
                  ),

                    const SizedBox(width: 30,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Activity
                        Text(activityName,
                        style:const TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 18,
                        ),),

                        const SizedBox(height: 4,),

                        //Progress
                       Text('${convertMinToSec(timeSpent)} / $timeGoal mins  =  ${(percentCompleted()*100).toStringAsFixed(0)}%',
                          style: const TextStyle(color: Colors.grey),
                         ),
                        ]
                    ),
                ],
              ),
                GestureDetector(
                  onTap: settingsTapped,
                    child:const Icon(Icons.settings)),

                  ],

                ),


          )

    );
  }
}
