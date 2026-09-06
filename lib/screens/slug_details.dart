import 'package:flutter/material.dart';
import 'package:project_2_faisal/service/api.dart';

class SlugDetails extends StatelessWidget {
  final String slug;
  final String name;
  const SlugDetails({required this.slug, required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(name!)),
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
          future: Api().getDetails(slug),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("data");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              var alldetail = snapshot.data!;

              return ListView(
                physics: const PageScrollPhysics(),

                children: [
                  Custim(
                    descripton: alldetail.description ?? "Not found",
                    title: "الوصف",
                  ),
                  SizedBox(height: 16),
                  Custim(
                    descripton: alldetail.goals ?? "Not found",
                    title: "الأهداف",
                  ),
                  SizedBox(height: 16),
                  Custim(
                    descripton: alldetail.features ?? "Not found",
                    title: "المميزات",
                  ),
                  SizedBox(height: 16),
                  Custim(
                    descripton: alldetail.requirements ?? "Not found",
                    title: "المتطلبات",
                  ),
                  SizedBox(height: 16),
                ],
              );
            }
            return Text("No data");
          },
        ),
      ),
    );
  }
}

class Custim extends StatelessWidget {
  final String title;
  final String descripton;

  Custim({required this.descripton, required this.title, super.key});

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, //////nnnnnnn111111
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(108, 123, 92, 235),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Column(
          children: [
            Text(
              this.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              this.descripton,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
