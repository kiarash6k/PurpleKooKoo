import 'package:flutter/material.dart';
import 'package:pruple_kookoo/HomeScreen.dart';
import 'crypto.dart';

class Long extends StatefulWidget {
  const Long({super.key});

  @override
  State<Long> createState() => _LongState();
}

class _LongState extends State<Long> {
  String dropdownValue = 'Option 1';
  String longValue = 'Option 1';

  final tp = TextEditingController();
  final sl = TextEditingController();
  final buy = TextEditingController();
  @override
  void dispose() {
    tp.dispose();
    sl.dispose();
    buy.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color.fromARGB(255, 24, 14, 86),
          Color.fromARGB(255, 54, 0, 90)
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back, color: Colors.white, size: 30,),),

            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    longValue == 'Option 1'
                        ? "assets/images/bull.png"
                        : "assets/images/bear.png",
                      scale:4.5,

                  ),
                  Text("Set Alarm",
                      style: TextStyle(color: Colors.white, fontSize: 40)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Choose your pair,Set your price",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ///////

            Expanded(
              child: Container(
                //User
                decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              DropdownButton(
                                isExpanded: true,
                                value: dropdownValue,
                                items: crypto,
                                onChanged: (value) {
                                  setState(() {
                                    dropdownValue = value;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              DropdownButton(
                                
                                isExpanded: true,
                                value: "Option 1",
                                items: [
                                  DropdownMenuItem(value: "Option 1", child:Text("Long",style: TextStyle(color: Colors.green),)),
                                  DropdownMenuItem(value: "Option 2", child:Text("Short",style: TextStyle(color: Colors.red))),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    longValue = value!;
                                  });
                                },
                              ),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.grey[200]!,
                                                width: 1),
                                            bottom: BorderSide(
                                                color: Colors.grey[200]!))),
                                    child: TextFormField(
                                      
                                      controller: buy,
                                      decoration: InputDecoration(
                                          hintText: "Buy Price",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your Buy Price';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      var current = 1234;
                                      buy.text = current.toString();
                                    },
                                    child: Text(
                                      "Current Price",
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                                blurRadius: 10,
                                                color: Color.fromARGB(
                                                    255, 24, 14, 86),
                                                offset: Offset(5, 5))
                                          ],
                                          color: Color.fromARGB(255, 54, 0, 90),
                                          fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.grey[200]!,
                                                width: 1),
                                            bottom: BorderSide(
                                                color: Colors.grey[200]!))),
                                    child: TextFormField(
                                      
                                      controller: tp,
                                      decoration: InputDecoration(
                                          hintText: "Tp",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your Tp';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(

                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.grey[200]!,
                                                width: 1),
                                            bottom: BorderSide(
                                                color: Colors.grey[200]!))),
                                    child: TextFormField(
                                      
                                      controller: sl,
                                      decoration: InputDecoration(
                                          hintText: "SL",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your Stop loss';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 75, vertical: 15), backgroundColor: Color.fromARGB(255, 24, 14, 86),
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: () {
                            buy.text.isNotEmpty ?
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreeen())) : null;
                          },
                          child: Text(
                            "Add Alarm",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
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

TextFormField target() {
  final targetSimple = TextEditingController();
  return TextFormField(
    controller: targetSimple,
    decoration: InputDecoration(
        hintText: "Target Price",
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none),
    keyboardType: TextInputType.number,
  );
}
