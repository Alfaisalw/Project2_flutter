import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_2_faisal/service/api.dart';

class SlugDetails extends StatelessWidget {
  final String slug;

  const SlugDetails({required this.slug, super.key});

  // دالة لتنسيق التاريخ (لاستخراج السنة والشهر واليوم)
  String _formatDate(String? isoDate) {
    if (isoDate == null || isoDate.isEmpty) return "";
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
                  bottom: BorderSide(color: Colors.white.withOpacity(0.2), width: 1),
                ),
              ),
            ),
          ),
        ),
        title: const Text(
          "التفاصيل",
          style: TextStyle(
            color: Color(0xFF1A0638), 
            fontWeight: FontWeight.w900, 
            letterSpacing: 1.0, 
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF1A0638)),
        
        // --- الإضافة الجديدة: أيقونة الإعدادات ---
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_rounded), // أيقونة إعدادات عصرية
            tooltip: 'الإعدادات', // مهم جداً لـ Accessibility (قارئات الشاشة)
            splashRadius: 24, // تقليل دائرة الضغط لتبدو أنيقة
            onPressed: () {
              // أضف هنا كود الانتقال لصفحة الإعدادات أو فتح القائمة
              // Navigator.push(...);
            },
          ),
          const SizedBox(width: 8), // مسافة جمالية بسيطة عن حافة الشاشة
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
            child: FutureBuilder(
              future: Api().getDetails(slug),
              builder: (context, snapshot) {
                // حالة التحميل
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(color: Colors.white));
                }

                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  var alldetail = snapshot.data!; // استدعاء المودل

                  // تجهيز التواريخ
                  String dates = "";
                  String startD = _formatDate((alldetail as dynamic).startDate);
                  String endD = _formatDate((alldetail as dynamic).endDate);
                  if (startD.isNotEmpty && endD.isNotEmpty) {
                    dates = "$startD - $endD";
                  } else if (startD.isNotEmpty) {
                    dates = startD;
                  }

                  // تجهيز الأوقات
                  String times = "";
                  String startT = (alldetail as dynamic).startTimeText ?? "";
                  String endT = (alldetail as dynamic).endTimeText ?? "";
                  if (startT.isNotEmpty && endT.isNotEmpty) {
                    times = "$startT - $endT";
                  } else if (startT.isNotEmpty) {
                    times = startT;
                  }

                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1. المربع العلوي (تأثير الزجاج البنفسجي)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: _buildTopCard(alldetail, dates, times),
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // 2. الوصف أسفل المربع
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "الوصف",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                (alldetail as dynamic).description ?? "لا يوجد وصف متوفر.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(0.9),
                                  height: 1.7, // مسافة مريحة للقراءة
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // 3. قسم الاختيار التفاعلي (الأهداف، المميزات، المتطلبات)
                        DynamicDetailsSection(details: alldetail),
                        
                        const SizedBox(height: 40),
                      ],
                    ),
                  );
                }
                
                return const Center(
                  child: Text("لا توجد بيانات", style: TextStyle(color: Colors.white)),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // بناء الكرت العلوي الزجاجي
  Widget _buildTopCard(dynamic alldetail, String dates, String times) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF2A0A5E).withOpacity(0.75), // زجاج بنفسجي داكن
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: Colors.white.withOpacity(0.15), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // العنوان
              Text(
                alldetail.title ?? "بدون عنوان",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              
              // الموقع
              if (alldetail.locationText != null && alldetail.locationText.isNotEmpty)
                Row(
                  children: [
                    const Icon(Icons.location_on_rounded, color: Colors.white70, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        alldetail.locationText,
                        style: const TextStyle(color: Colors.white70, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              
              if (dates.isNotEmpty || times.isNotEmpty) const SizedBox(height: 20),
                 
              // التواريخ والأوقات
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  if (dates.isNotEmpty) _buildInfoChip(Icons.calendar_month_rounded, dates),
                  if (times.isNotEmpty) _buildInfoChip(Icons.access_time_rounded, times),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // بناء كبسولات المعلومات الصغيرة داخل الكرت العلوي
  Widget _buildInfoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3), // لون خلفية الكبسولة
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFF8833ff), size: 18),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 13)),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------
// عنصر تفاعلي (Stateful) لإدارة القائمة المنسدلة وعرض البيانات
// ---------------------------------------------------------
class DynamicDetailsSection extends StatefulWidget {
  final dynamic details;
  const DynamicDetailsSection({required this.details, super.key});

  @override
  State<DynamicDetailsSection> createState() => _DynamicDetailsSectionState();
}

class _DynamicDetailsSectionState extends State<DynamicDetailsSection> {
  String selectedKey = 'goals'; // الاختيار الافتراضي

  final Map<String, String> options = {
    'goals': 'الأهداف',
    'features': 'المميزات',
    'requirements': 'المتطلبات',
  };

  @override
  Widget build(BuildContext context) {
    // تحديد النص الذي سيتم عرضه بناءً على الاختيار
    String content = "";
    if (selectedKey == 'goals') {
      content = widget.details.goals ?? "لا توجد أهداف مسجلة.";
    } else if (selectedKey == 'features') {
      content = widget.details.features ?? "لا توجد مميزات مسجلة.";
    } else if (selectedKey == 'requirements') {
      content = widget.details.requirements ?? "لا توجد متطلبات مسجلة.";
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // قائمة منسدلة بتأثير الزجاج (Dropdown)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF5214b5).withOpacity(0.35), // زجاج بنفسجي للقائمة
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedKey,
                icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
                dropdownColor: const Color(0xFF2A0A5E), // لون القائمة عند الفتح لضمان الوضوح
                isExpanded: true,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                items: options.entries.map((entry) {
                  return DropdownMenuItem<String>(
                    value: entry.key,
                    child: Text(entry.value),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val != null) setState(() => selectedKey = val);
                },
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // المستطيل السفلي (تأثير الزجاج الأسود) لعرض البيانات
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.55), // زجاج أسود شفاف كما طلبت
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: Text(
                  content,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 15,
                    height: 1.7,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}