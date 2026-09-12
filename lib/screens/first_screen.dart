import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_2_faisal/screens/course_screen.dart';
import 'package:project_2_faisal/screens/second_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  
  final List<String> logoUrls = const [
    'https://cdn.vectorstock.com/i/1000v/88/07/meta-logo-facebook-rebrand-vector-40208807.jpg',
    'https://opportunitiesforyoungkenyans.co.ke/wp-content/uploads/2025/04/Microsoft.-Microsoft.png',
    'https://cdn-tp2.mozu.com/16951-m3/cms/files/CompTIA-logo.png',
    'https://programmingoceanacademy.s3.ap-southeast-1.amazonaws.com/images/IBM.webp',
    'https://media.datacenterdynamics.com/media/images/alibaba_cloud.2e16d0ba.fill-279x140.png',
    'https://1000logos.net/wp-content/uploads/2017/02/Apple-Logo.png',
    'https://cdn.hashnode.com/res/hashnode/image/upload/v1694815011481/d98d13fd-17c1-472c-a7d9-65f0bb7ab0a7.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 1. صورة الخلفية
            ExcludeSemantics(
              child: Image.asset(
                "assets/images/32a38a76a4e5-59076.jpg",
                fit: BoxFit.cover,
              ),
            ),

            // 2. منطقة الشعار العلوية
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Semantics(
                    image: true,
                    label: 'شعار التطبيق',
                    child: Image.asset(
                      "assets/images/logo-h.png",
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            // 3. منطقة الضبابية والمحتوى بالأسفل
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF8833ff).withOpacity(0.1),
                    ),
                    padding: const EdgeInsets.only(
                      top: 40,
                      bottom: 48,
                      left: 24,
                      right: 24,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // يقلص مساحة الضبابية لأسفل الشاشة لتشمل المحتوى فقط
                      children: [
                        Semantics(
                          header: true,
                          child: const Column(
                            children: [
                              Text(
                                "تعلم تقنيات المستقبل",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: 1.3,
                                ),
                              ),
                              Text(
                                "في مكــــانٍ واحــــــد",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 36),

                        // ترتيب الشعارات من اليمين لليسار، وتنتقل لسطر جديد تلقائياً
                        Semantics(
                          label: 'شركات تقنية عالمية',
                          child: Wrap(
                            spacing: 20.0, // المسافة الأفقية بين الشعارات
                            runSpacing: 20.0, // المسافة العمودية بين الأسطر
                            alignment: WrapAlignment.center,
                            children: logoUrls.map((url) {
                              return ExcludeSemantics(
                                // منع القراءة المزعجة لكل صورة
                                child: SizedBox(
                                  width: 65,
                                  height: 45,
                                  child: Image.network(
                                    url,
                                    fit: BoxFit.contain,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(
                                              Icons.broken_image,
                                              color: Colors.white54,
                                            ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                        const SizedBox(height: 48),

                        // الزر بالتصميم السابق
                        SizedBox(
                          width: 220,
                          height: 56, // ارتفاع الزر مناسب لسهولة الوصول
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CourseScreen (),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3B3936)
                                  .withOpacity(0.70),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              "ابـــدأ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
