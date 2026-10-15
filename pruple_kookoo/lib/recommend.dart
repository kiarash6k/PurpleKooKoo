import 'package:flutter/material.dart';

class Recommended extends StatelessWidget {
  final String title;
  final String change;
  final String description;
  final String image;
  final Color color;
  const Recommended(
      this.title, this.description, this.image, this.change, this.color,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.03,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withValues(alpha: 0.15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Image.asset(
                "assets/images/$image.png",
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.height / 8,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height / 95,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 85,
                  ),
                  
                  Container(
                    
                    
                    child: Text(
                      title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 50,
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
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "$title/Usdt",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 65,
                        color: Color.fromARGB(88, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                        
                        
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          
          Row(
       
            children: [
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 70,
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
                  
                  
                  Text(
                    change,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 60,
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
