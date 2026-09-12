# Tuwaiq Academy App 🚀
A comprehensive and interactive mobile application designed to explore educational bootcamps and programs offered by **Tuwaiq Academy**. The app delivers a premium, modern user experience built on a consistent **Glassmorphism Design System** across all screens.

## 📌 Core Features
* **Explore Categories:** Browse through various tech domains and main fields easily.
* **Bootcamps & Initiatives:** View available programs with real-time registration status (Open/Closed).
* **Detailed Insights:** Access comprehensive details for each bootcamp, including the description, goals, and requirements.
* **Welcome Screen:** A stunning landing page with a full-screen background, animated company logos (Meta, Microsoft, Apple, IBM, etc.), and a frosted glass bottom panel with a call-to-action button.
* **Explore Categories:** Browse through various tech domains displayed as interactive horizontal glass cards (with image + name).
* **Bootcamps & Programs:** View available programs as large immersive cards with real-time registration status indicator (Open 🟢 / Closed 🔴) using an LED Glow effect.
* **Detailed Insights:** Access comprehensive details for each bootcamp including Description, Goals, Features, and Requirements via an interactive dropdown selector.



## 📱  Before Improving the design 
<div align="center">
  <img width="500"  alt="Screenshot_1788699795" src="https://github.com/user-attachments/assets/5e188746-0faa-4534-9b25-6d475c2bcfa4" />

  <img width="500"  alt="Screenshot_1788699806" src="https://github.com/user-attachments/assets/b4f3c176-5c75-4caf-9fb2-d9b6f9f02733" />

  <img width="500"  alt="Screenshot_1788699811" src="https://github.com/user-attachments/assets/1ddcd9e8-4f59-4400-8b53-0ec025372609" />


<img width="500"  alt="Screenshot_1788699828" src="https://github.com/user-attachments/assets/09b12513-55e0-421f-ab2d-50ee2c62d961" />

<img width="500"  alt="Screenshot_1788699846" src="https://github.com/user-attachments/assets/55c37a62-d7f1-47c4-ac45-57fc1f88a76c" />


  


</div>

## _______________________________________________________________________________________________________________________________________________________________________________________________________________
## 📱  After Improving the design 
<div align="center">
<img width="500"  alt="Screenshot_1789173164" src="https://github.com/user-attachments/assets/d2897fb7-338c-4ff5-bc5e-f99808a95e59" />

<img width="500"  alt="Screenshot_1789214399" src="https://github.com/user-attachments/assets/02915835-b7e3-43dc-92e9-0a215a64a6a4" />

<img width="500"  alt="Screenshot_1789173213" src="https://github.com/user-attachments/assets/c00a19ac-d347-4f67-bfd2-2291d6fc4251" />

<img width="500" alt="Screenshot_1789173223" src="https://github.com/user-attachments/assets/1510db83-d470-43b6-90e4-8fa53a5b4948" />

<img width="500"  alt="Screenshot_1789173231" src="https://github.com/user-attachments/assets/57552c31-a494-4e2f-a68f-90c50fe968c9" />
<img width="500"  alt="Screenshot_1789173228" src="https://github.com/user-attachments/assets/cde17067-f09d-43f9-848f-71884a6f250f" />




</div>









## 🎥 Demo Video
[Click here to watch the App Demo](                                                                  


https://github.com/user-attachments/assets/d3ba392f-964e-4f93-99dd-3816d68515c7



)
## ✨ Additional Features & Technical Highlights
### 🎨 Glassmorphism UI
A unified visual identity is applied across all screens using:
- `BackdropFilter` with `ImageFilter.blur` for frosted glass effects.
- Consistent color palette: `#5214B5` · `#8833FF` · `#2A0A5E` · `#FCFBF2` · White · Black.
- Transparent borders (`Colors.white.withOpacity(0.2)`) to simulate real glass depth.

### 🔍 Search Bar
An inline glass-styled search bar integrated below the Categories section for filtering bootcamps and programs.
### 🧭 Navigation & Routing
- Standard `Navigator.push` with `MaterialPageRoute` for screen transitions.
- `slug` passed between `CourseScreen` → `SlugDetails` for API-driven detail fetching.
### ⚡ Asynchronous Data Handling
- RESTful API integration using `FutureBuilder` across all data-driven screens.
- Graceful loading states with `CircularProgressIndicator` and fallback empty-state messages.
- Date formatting utility to parse and simplify ISO 8601 timestamps (e.g. `2026-09-21T18:00:00+03:00` → `2026/09/21`).
### ♿ Accessibility (A11y)
- **RTL Support:** Full `Directionality(textDirection: TextDirection.rtl)` for Arabic language.
- **Screen Reader Support:** Meaningful `Semantics` labels on all interactive elements (buttons, images, cards).
- **Decorative Exclusions:** `ExcludeSemantics` applied to decorative images and redundant UI elements.
- **Tap Target Sizes:** All interactive elements meet or exceed the 48×48dp minimum guideline.
- **Color Contrast:** Text colors verified against WCAG contrast ratio guidelines on all glass backgrounds.
### 🏗️ Architecture
- Clean widget structure with helper methods (`_buildCourseCard`, `_buildInfoPill`, `_buildStatusIndicator`) to reduce duplication.
- Reusable `SectionCard` widget in `SlugDetails` for consistent section rendering.
- Stateful `DynamicDetailsSection` widget for the interactive dropdown detail viewer.


## 🛠️ Tech Stack
* **Framework:** Flutter
* **Language:** Dart
* **Network:** HTTP, REST API, JSON Parsing


---
made by faisal alwarthan
