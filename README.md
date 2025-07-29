# Pocket GAD: A Mobile Application for the Gender and Development IDSS 

Courses: 
IT-331 – Application Development and Emerging Technologies
IT-332 – Integrative Programming and Technologies

Team Members: Augustin Christian F. de la Peña, Angela L. Hornilla, Rafael Matthew V. Libio

## Project Overview 

Pocket GAD is a mobile application developed to enhance the existing Gender and Development (GAD) Information and Decision Support System (IDSS) of Batangas State University. 
The current GAD system, which is predominantly accessed through desktop browsers, presents accessibility barriers to key stakeholders such as students and employees.

This application addresses these limitations by offering a mobile-based platform that facilitates user participation in GAD-related activities including needs assessment and attendance tracking.
Pocket GAD fosters a more inclusive, efficient, and mobile-friendly system that supports gender development initiatives within the university.

## Objectives

- To extend the existing GAD IDSS through a mobile application
- To allow users to submit assessments and mark attendance via mobile
- To ensure real-time synchronization with the university’s GAD database through RESTful API integration
- To provide administrators with a dashboard that includes descriptive analytics of stakeholder responses

This Flutter-based mobile application serves as an extension of the **GAD (Gender and Development)** main system. Designed for both stakeholders and administrators, the app streamlines **attendance management**, **survey participation**, and **response analytics**, providing a seamless mobile experience for on-the-go access and administrative control.

---

## Features

### Dual Role Access
- **Smart Login System**  
  - Determines user role on login: **Stakeholder** or **Admin**.
  - Role-based navigation and interface rendering.

### Stakeholder Tools
- **Attendance System**  
  - Allows stakeholders to check-in/out for activities or events.
- **Survey Participation**  
  - View and answer surveys published by the admin.
  - User-friendly forms with real-time validation.

### Admin Tools
- **Survey Management**  
  - Create, update, publish, and archive surveys.
- **Statistics Dashboard**  
  - Dynamic charts and summaries of survey responses.
  - Real-time data representation using Flutter chart libraries.
 
### Responsive Design
- Responsive design on all mobile platforms (android and IOS).

---

## Front-End Development Concepts Highlighted

This project leverages several best practices and concepts in Flutter front-end development:

| Concept | Implementation |
|--------|----------------|
| **Widget Composition** | Modular and reusable widgets for login, dashboard, forms, etc. |
| **State Management** | `setState`: used for efficient UI updates. |
| **Responsive Design** | Adaptive layouts with `MediaQuery`, `LayoutBuilder`, and `Flex widgets`. |
| **Navigation** | Named routes and arguments used to manage screen transitions. |
| **Theme and Styling** | Custom `ThemeData` for consistent UI across dark/light modes. |
| **Form Validation** | Inline validators with user feedback on text inputs and selections. |
| **Dynamic UI** | Dashboards and charts reflect real-time backend data with graceful fallbacks. |

---

## Tech Stack

- **Agile Methodology**: The development model used for this application is the Agile methodology. 
- **Figma**: The design tool used for wireframes and early drafts of the application. 
- **JSON**: Used for local storage of the application.
- **Flutter**: Cross-platform mobile development framework.
- **Dart**: Programming language used for Flutter apps.
- **REST API**: Backend integration for authentication and data sync.
- **fl_chart**: For admin dashboards.

---

## System Architecture Overview
The system supports two types of users:

1. Administrators: Have access to attendance records, assessment tools, and stakeholder responses
2. Stakeholders (Students and Employees): Can submit assessments and record attendance

Data collected through the mobile app is synchronized with the university’s centralized GAD database through secure API calls. All data exchanges are performed in real-time to ensure accuracy and consistency.

---

## License 

This project is developed solely for educational purposes under the IT-332 and IT-331 course. All rights reserved by the authors unless otherwise stated.

---

## Getting Started

### Prerequisites
- Flutter SDK
- Dart SDK
- Android Studio / VS Code

### Installation
```bash
git clone https://github.com/yourusername/gad-mobile-extension.git
cd gad-mobile-extension
flutter pub get
flutter run
