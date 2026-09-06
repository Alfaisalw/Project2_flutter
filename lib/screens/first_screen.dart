import 'package:flutter/material.dart';
import 'package:project_2_faisal/screens/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/32a38a76a4e5-59076.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,

              child: Image.asset("assets/images/logo-h.png", fit: BoxFit.cover),
            ),
            SizedBox(height: 400),
            Container(
              width: double.infinity,
              height: 125,
              decoration: BoxDecoration(
                color: const Color.fromARGB(148, 128, 59, 255),
                borderRadius: BorderRadius.circular(16),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Image.asset(
                    "assets/images/Tuwaiq_mounten.webp",
                    fit: BoxFit.cover,
                  ),
                  Column(
                    children: [
                      Text(
                        "تعلم تقنيات المستقبل ",
                        style: TextStyle(
                          fontSize: 22,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      Text(
                        "في مكــــانٍ واحــــــد",
                        style: TextStyle(
                          fontSize: 19,
                          color: const Color.fromARGB(255, 253, 248, 248),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(color: Colors.purple, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 254, 250, 255),
                                offset: Offset(0, 0),
                                blurRadius: 0,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: const Color.fromARGB(148, 128, 59, 255),
                              ),
                              Text("ابـــدأ", style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
