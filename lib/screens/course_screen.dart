import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_2_faisal/model/course_model.dart';
import 'package:project_2_faisal/screens/slug_details.dart';
import 'package:project_2_faisal/service/api.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  String _formatDate(String? isoDate) {
    if (isoDate == null || isoDate.isEmpty) return "غير محدد";
    try {
      DateTime date = DateTime.parse(isoDate);
      return "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
    } catch (e) {
      return isoDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.25),
        elevation: 0,
        centerTitle: true,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          "المعسكرات والبرامج ",
          style: TextStyle(
            color: Color(0xFF1A0638),
            fontWeight: FontWeight.w900,
            letterSpacing: 1.0,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF1A0638)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_rounded),
            tooltip: 'الإعدادات',
            splashRadius: 24,
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Tuwaiq_mounten.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                // --- قسم التصنيفات (Categories) ---
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: FutureBuilder(
                      future: Api().getCatagories(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const SizedBox(
                            height: 90,
                            child: Center(
                              child: CircularProgressIndicator(color: Colors.white),
                            ),
                          );
                        }
                        if (snapshot.hasData) {
                          var allCategories = snapshot.data as List<dynamic>;
                          return SizedBox(
                            height: 85,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: allCategories.length,
                              itemBuilder: (context, index) {
                                var cat = allCategories[index];
                                return Semantics(
                                  button: true,
                                  label: 'تصنيف: ${cat.name}',
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF5214b5).withOpacity(0.35),
                                            borderRadius: BorderRadius.circular(16),
                                            border: Border.all(
                                              color: Colors.white.withOpacity(0.2),
                                              width: 1,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ConstrainedBox(
                                                constraints: const BoxConstraints(maxWidth: 180),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                                  child: Text(
                                                    cat.name!,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.bold,
                                                      height: 1.3,
                                                    ),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Image.network(
                                                  cat.image!,
                                                  width: 60,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ),

                // --- شريط البحث الجديد ---
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF5214b5).withOpacity(0.35), // لون زجاجي متناسق مع التصنيفات
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: const TextField(
                            style: TextStyle(color: Colors.white),
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                              hintText: 'ابحث عن معسكر أو برنامج...',
                              hintStyle: TextStyle(color: Colors.white70),
                              border: InputBorder.none,
                              icon: Icon(Icons.search_rounded, color: Colors.white70),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // --- فاصل ---
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(
                      color: Colors.white30,
                      thickness: 1,
                      indent: 32,
                      endIndent: 32,
                    ),
                  ),
                ),

                // --- قسم الدورات (Courses) ---
                FutureBuilder<List<CourseModel>>(
                  future: Api().getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SliverFillRemaining(
                        child: Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                      var allCourse = snapshot.data!;
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            var course = allCourse[index];
                            return _buildCourseCard(context, course);
                          },
                          childCount: allCourse.length,
                        ),
                      );
                    }
                    return const SliverToBoxAdapter(
                      child: Center(child: Text("لا توجد بيانات")),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, CourseModel course) {
    bool isOpen = course.isOpen ?? false;
    String? rawDate = (course as dynamic).startDate;

    return Semantics(
      button: true,
      label: 'دورة ${course.title}. في الرياض. الحالة: ${isOpen ? 'متاح التسجيل' : 'مغلق'}.',
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SlugDetails(slug: course.slug!),
            ),
          );
        },
        borderRadius: BorderRadius.circular(32),
        child: Container(
          height: 380,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            image: DecorationImage(
              image: NetworkImage(course.image!),
              fit: BoxFit.cover,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              // مؤشر التسجيل
              Positioned(
                top: 20,
                right: 20,
                child: ExcludeSemantics(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFfcfbf2),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isOpen ? Colors.greenAccent : Colors.redAccent,
                            boxShadow: [
                              BoxShadow(
                                color: (isOpen ? Colors.greenAccent : Colors.redAccent).withOpacity(0.6),
                                blurRadius: 6,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isOpen ? "متاح التسجيل" : "مغلق",
                          style: TextStyle(
                            color: isOpen ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // المربع السفلي 
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A0A5E).withOpacity(0.40),
                        border: Border(
                          top: BorderSide(
                            color: Colors.white.withOpacity(0.15),
                            width: 1,
                          ),
                        ),
                      ),
                      child: ExcludeSemantics(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              course.title ?? 'بدون عنوان',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                height: 1.4,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  color: Colors.white.withOpacity(0.8),
                                  size: 18,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  "الرياض",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: [
                                _buildInfoPill("النوع: ${course.type ?? 'غير محدد'}"),
                                _buildInfoPill("تاريخ البداية: ${_formatDate(rawDate)}"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoPill(String text) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF5214b5).withOpacity(0.35),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.25), width: 1),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}