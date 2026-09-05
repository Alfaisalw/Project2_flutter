import 'package:flutter/material.dart';
import 'package:project_2_faisal/model/course_model.dart';
import 'package:project_2_faisal/service/api.dart';

class CourseScreen extends StatelessWidget {
 

  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: 
      Container( 
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Tuwaiq_mounten.webp"),
            fit: BoxFit.cover,
          ),
        ),


        child: FutureBuilder <List<CourseModel>>
        
        (future: Api().getData(),
         builder:(context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("data");
            }

            if(snapshot.connectionState==ConnectionState.done){
             
                var allCourse=snapshot.data;
              
              return  GridView.builder(
              itemCount: allCourse!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.60, ), 
              itemBuilder: (context, index) {
                var course = allCourse[index];
                return Container(
                  margin: EdgeInsets.all(3),
                   
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        
                        color: const Color.fromARGB(108, 123, 92, 235),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 10),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(course.image!,fit: BoxFit.cover,width: double.infinity,),
                            ),

                          )
                          ,Divider(height: 10,)
                          ,Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Expanded(child: Text(course.type!,style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 12),maxLines:1 ,
                            overflow: TextOverflow.ellipsis ,))],)
                          
                          
                          ,Row(
                            
                            children: [
                              Text(course.isOpen== false ? "مغلق" : "متاح التسجيل",
                              style: TextStyle(color: course.isOpen==true ? Colors.greenAccent : Colors.redAccent
                              ,fontSize: 10, fontWeight: FontWeight.bold ),)
                              ,SizedBox(width: 4,)
                              ,Icon(Icons.circle ,size: 10,color: course.isOpen==true ? Colors.greenAccent: Colors.redAccent,)

                          ],)
                          ,SizedBox(height: 8,)
                          ,Text(course.title!,style: TextStyle(color: const Color.fromARGB(218, 255, 253, 253),fontSize: 15),maxLines: 2,overflow: TextOverflow.ellipsis,)
                          
                        ],
                      ),



                );
              },
            );
            


            }
           return Text("No DATA ");
         },),
      ),


    );
  }
}