import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final String title;
  final String change;
  final String description;
  final String image;
  const Box(this.title, this.description, this.image, this.change,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return 
      
      
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.03,),
                width: MediaQuery.of(context).size.width / 1.9,
                height: MediaQuery.of(context).size.height / 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  //color: Color.fromARGB(65, 255, 255, 255),
                  color: Colors.white.withValues(alpha: 0.13),
                ),
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height / 110,
                    // ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 22,
                        ),
                        Image.asset(
                          "assets/images/$image.png",
                          width: MediaQuery.of(context).size.width / 9,
                          height: MediaQuery.of(context).size.height / 9,
                        ),
                        
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 95,
                        ),
                        Column(
                          children: [
                            Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height / 35,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                            color: Color.fromARGB(170, 0, 0, 0),
                            blurRadius: 40,
                            
                          ),
                                ],
                              ),
                            ),
                            Text(
                              "$title/Usdt",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height / 65,
                                color: Color.fromARGB(88, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                
                                
                              ),
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                    
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 15,
                        ),
                        Text(
                          description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 45,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 15),
                        Text(
                          change,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 60,
                            color: Color.fromARGB(255, 255, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        
                        ),
                      ],
                    ),
                  ],
                ),
              
              
            
          
          
    );
  }
}
