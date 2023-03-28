# Smart Home Power Management System
## Overview
The Smart Home Power Management System is an Internet of Things (IoT) project that detects power outages in a home and alerts the user accordingly. The system also enables the user to control a home generator and provides them with comprehensive information about the power situation in their house.

## Project Details
### Aim
The aim of this project is to create a smart home IoT system that detects power outages and alerts the user accordingly. The system will also enable the user to control a home generator and provide them with comprehensive information about the power situation in their house. To achieve this, the project utilizes a microcontroller along with analog inputs and outputs.

### Theory
The underlying theory of this project is to devise a means of detecting power outages and recording the occurrences, as well as transmitting the data over the internet. In addition, the project explores ways to manage the home generator, including fuel level checks to ensure it can operate in the event of a power outage.

### Basic Idea Behind the Design
The basic idea behind the design is to leverage a microcontroller to read data from two analog inputs - a voltage sensor and liquid level sensor. This data is then transmitted to a real-time database. In the event of a power outage, the microcontroller sends an alert notification via an app that draws from the real-time database to inform the user of the outage. Subsequently, the microcontroller checks the fuel level in the home generator. If there is insufficient fuel, a notification is sent to the user via the app. However, if the generator has enough fuel, it starts functioning until the power returns. The app allows the user to control the generator and monitor power outages and fuel levels. This way, the user can keep track of the system's performance and make any necessary adjustments.

### System Components

#### Hardware Components
- Pi Pico RP2040W microcontroller
- Voltage Sensor
- Liquid Level Sensor
- 5v Motor
- White LED
- Wires
- Power supply
#### Software Components
- [Thonny compiler](https://thonny.org)
- [Micropython](https://micropython.org/) based on Python language
#### Database Components
- [Firebase](https://firebase.google.com/) Real-Time Database
#### Application Components
- [Visual Studio Code compiler](https://code.visualstudio.com/)
- [Flutter Framework](https://flutter.dev/)
- [Dart language](https://dart.dev/)
  #### Screenshots
  <p float="left">
    <img src="https://user-images.githubusercontent.com/40622528/228380621-90f40f43-c63d-43b3-b401-efd4e4f1ca60.jpg" height="500" /> 
    <img src="https://user-images.githubusercontent.com/40622528/228381084-80796358-f1cc-455e-b965-a75fd8d9058e.jpg" height="500" /> 
    <br />
    <img src="https://user-images.githubusercontent.com/40622528/228381150-d204e755-d5ce-4e10-baa9-e087a9759ad1.jpg" height="500" />
    <img src="https://user-images.githubusercontent.com/40622528/228381209-2475d628-1006-4a51-8dda-669382303bf1.jpg" height="500" />
</p>

### Circuit Diagram
![circuit diagram-1](https://user-images.githubusercontent.com/40622528/228377972-ddaed0ba-767c-4352-bef9-adbefdbe6836.png)

### Microcontroller Program Code
The microcontroller program code is attached as two separate files.
<br />
[Micropython code.zip](https://github.com/Aggir/Aggir-Smart-Home-Power-Management-System/files/11094735/Micropython.code.zip)

### Contributing
If you would like to contribute to this project, please submit a pull request. All contributions are welcome!
