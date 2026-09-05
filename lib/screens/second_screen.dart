import 'package:flutter/material.dart';
import 'package:project_2_faisal/screens/course_screen.dart';
import 'package:project_2_faisal/service/api.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("الــمــجـالات الرئــيـسية"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Tuwaiq_mounten.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          future: Api().getCatagories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("data");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              var allcatagory = snapshot.data;

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const PageScrollPhysics(),
                itemCount: allcatagory!.length,
                itemBuilder: (context, index) {
                  var catagory = allcatagory[index];

                  return Container(
                    width: MediaQuery.of(context)
                        .size
                        .width, //////nnnnnnn111111
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(108, 123, 92, 235),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 10),
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.network(catagory.image!, height: 250),
                          SizedBox(height: 16),
                          Text(
                            catagory.name!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16),
                          ExpansionTile(
                            backgroundColor: const Color.fromARGB(
                              71,
                              150,
                              131,
                              236,
                            ),
                            title: Text(
                              "لـلــتــفــاصــيــل ",
                              style: TextStyle(color: Colors.white),
                            ),
                            children: [
                              Text(
                                catagory.details!,
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    246,
                                    255,
                                    255,
                                    255,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CourseScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.purple,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 254, 250, 255),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.arrow_back,
                                    color: const Color.fromARGB(
                                      148,
                                      128,
                                      59,
                                      255,
                                    ),
                                  ),
                                  Text(
                                    "ابـــدأ",
                                    style: TextStyle(fontSize: 22),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Text("No data");
          },
        ),
      ),
    );
  }
}
