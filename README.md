# ☕ Smart Ahwa Manager

A Flutter point-of-sale app built for a Egyptian café (“قهوة”) workflow.  
("قهوة") workflow.\
It stores data locally with **Hive**, follows **OOP + SOLID + Clean
Architecture**,\
and uses **Cubit (flutter_bloc)** for state management.

------------------------------------------------------------------------

## ✨ Features

-   📝 **Order Management**
    -   Add new drink orders with:
        -   Customer name
        -   Drink type & quantity
        -   Special instructions
-   ✅ Mark orders as *completed* in real time
-   📊 Export a **plain-text sales report** (Arabic / EGP currency)
-   💾 **Offline first** -- all data saved locally with Hive

------------------------------------------------------------------------

## 🏗 Project Structure

    lib/
    ├── core/
    │   ├── di/                 # Dependency Injection (GetIt)
    │   ├── theming/            # App theme & styling
    │   ├── widgets/            # Shared UI components
    │   └── routing/            # Navigation
    ├── features/
    │   └── orders/
    │       ├── data/           # Hive data sources & repositories
    │       ├── domain/         # Entities & use-cases
    │       ├── logic/          # Cubit & states
    │       └── presentation/   # UI screens & widgets
    └── main.dart               # Entry point

This **feature-first** layout keeps code modular and testable.

------------------------------------------------------------------------

## 🛠 Tech Stack

-   **Flutter** (stable channel)
-   **Hive** for local database
-   **flutter_bloc / cubit** for state management
-   **GetIt** for dependency injection
-   **Dart** using OOP + SOLID principles

------------------------------------------------------------------------

## 🚀 Getting Started

1.  **Clone the repo**

    ``` bash
    git clone https://github.com/M7mdAbolila/smart_ahwa.git
    cd smart_ahwa_manager
    ```

2.  **Install packages**

    ``` bash
    flutter pub get
    ```

3.  **Run the app**

    ``` bash
    flutter run
    ```

    > Runs on Android, iOS, Windows, Linux, or Web.

------------------------------------------------------------------------

## 📂 Local Database

-   Orders are stored in a Hive box (`orders_box`) under the app's local
    directory.
-   No external server is required.

------------------------------------------------------------------------

## 🖼 Screenshots
<img width="1848" height="1237" alt="app_screens" src="https://github.com/user-attachments/assets/2165d930-aee7-4778-b0dd-27e1c9c204c6" />


------------------------------------------------------------------------

## 🤝 Contributing

1.  Fork the repository\
2.  Create a feature branch: `git checkout -b feature/my-feature`\
3.  Commit: `git commit -m "Add my feature"`\
4.  Push: `git push origin feature/my-feature`\
5.  Open a Pull Request 🎉

------------------------------------------------------------------------

### 🇪🇬 Notes
-   Designed for a *single-device with cashier* scenario (no multi-user
    sync).

------------------------------------------------------------------------

Built with ❤️ for local cafés.
