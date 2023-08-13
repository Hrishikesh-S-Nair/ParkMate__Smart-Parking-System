# Intelligent Raspberry-Pi based Parking Slot Identification System

![download](https://github.com/Hrishikesh-S-Nair/ParkMate__Smart-Parking-System-master/assets/125496407/696f9d1d-065b-4700-a427-886239bf84af)


## Abstract

With the growing population and increased transportation, the demand for parking spaces has surged. Manual parking systems are still prevalent, leading to congestion, accidents, and inefficiency. To address this, an automatic parking spot identification system using computer vision and IoT technology is proposed. This system aims to detect and classify available parking spots, thereby improving traffic flow and reducing environmental impact.

## Table of Contents

- [Introduction](#introduction)
- [Related Work](#related-work)
- [Methodology](#methodology)
  - [System Requirements](#system-requirements)
  - [Detection Mechanism](#detection-mechanism)
  - [Frontend](#frontend)
  - [Backend](#backend)
  - [System Design](#system-design)
- [Results and Discussion](#results-and-discussion)
- [Conclusion and Future Remarks](#conclusion-and-future-remarks)

## Introduction

The growing number of vehicles in urban areas has led to parking problems and traffic congestion. Manual parking systems are inefficient and lead to improper parking and congestion. This project proposes an intelligent parking system based on Raspberry Pi and computer vision. The system utilizes cameras placed in parking spaces to detect and classify available and occupied spots, allowing drivers to efficiently locate parking spaces.

## Related Work

Several smart parking systems have been proposed, including sensor-based and computer vision-based approaches. These systems aim to optimize parking space usage and reduce traffic congestion. The project draws inspiration from existing systems and focuses on real-time parking spot detection and classification.

## Methodology

### System Requirements

- DroidCam: Android app to use smartphone as a wireless camera for PC.
- Raspberry Pi 3B+: Single-board computer with Wi-Fi, Bluetooth, and GPIO pins.

### Detection Mechanism

The system uses computer vision to detect parking slot occupancy. The ML model analyzes images from cameras and identifies the percentage of green and blue colors in the image. Based on color percentages, the system classifies parking slots as empty, partially occupied, or fully occupied.

### Frontend

The frontend of the mobile application is developed using Flutter, enabling cross-platform compatibility. The app displays parking slots' availability and occupancy status, retrieved from the backend.

### Backend

Cloud Firestore, a NoSQL cloud database, is used to store real-time data about parking slot occupancy. The database enables real-time synchronization of data across connected clients.

### System Design

The system algorithm involves capturing images from cameras, analyzing color percentages, updating Firestore with occupancy information, and displaying this information on the mobile app.

## Results and Discussion

The proposed system accurately detects parking slot occupancy. Different scenarios are tested, including fully empty, fully occupied, and partially occupied parking slots. The system's accuracy in identifying available and occupied slots is demonstrated.

## Conclusion and Future Remarks

The intelligent Raspberry-Pi based parking slot identification system offers an efficient solution to the parking problem. By utilizing computer vision and IoT technology, the system optimizes parking space usage, reduces traffic congestion, and improves overall traffic management. Future enhancements may include scalability, integration with smart city infrastructure, and additional features for drivers' convenience.

---

## APK Link

If you are unable to download the apk, please download it from here : https://drive.google.com/file/d/1K7qvA5RqvICvPByfwDE4hPRbTcwwSjaX/view?usp=share_link
