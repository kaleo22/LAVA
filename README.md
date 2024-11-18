# Localisation of a 1:8 Vehicle Model Using Stationary Cameras

This project focuses on localising a 1:8 scale vehicle model using stationary cameras, leveraging Dockerized ROS 2 Humble packages for accurate position and orientation detection. The system combines AprilTag detection, high-performance cameras, and coordinate transformation to provide real-time localisation data, forming a foundation for autonomous navigation and control.

## Key Features

1. **Dockerized Setup**
   - Utilizes a Docker container for seamless deployment in ROS 2 Humble.
   - Includes support for U3-3560XLE-C-HQ Rev.1.1 cameras from IDS Image using the `peak_cam` package.

2. **AprilTag Detection**
   - Uses the `apriltag_ros2` package for detecting AprilTags in ROS 2 Humble.
   - Provides precise localisation through robust visual markers.

3. **Coordinate Transformation**
   - Implements a flexible system for transforming camera coordinates into a user-defined world coordinate system using the `pose_transform` package.
   - Allows for adaptable positioning and alignment in various environments.

## Why This Project is Useful

### The Role of Localisation
- **Enabling Autonomous Systems**:  
  Localisation is pivotal in the development of autonomous systems, especially in robotics and automotive industries.
  
- **Ensuring Navigation and Safety**:  
  Precise positioning data is essential for:
  - Safe and efficient navigation.
  - Obstacle avoidance.
  - Environmental interaction.

### Applications in Automation
- **Real-Time Positioning**:  
  Tracks the exact position and orientation of the 1:8 vehicle model in real-time using AprilTags.
  
- **Foundation for Automation**:  
  Forms the basis for advanced processes, such as:
  - Path planning.
  - Autonomous vehicle control systems.

This project demonstrates a scalable and adaptable approach to localisation, contributing to the broader field of robotics and automated vehicle development.


