# BACHELOR OF SCIENCE IN MECHATRONICS ENGINEERING
## ROBOTICS 2: PRELIMINARY PROJECT
### Forward Kinematics

---

### 📅 Important Dates

| Milestone | Date & Time | Venue |
| :--- | :--- | :--- |
| **Submission Date** | March 28, 2026, 11:59 PM | GitHub Repository |
| **Presentation Date** | March 29, 2026 | To Be Announced |

---

## 🎯 Objectives
By the end of this preliminary project, students will be able to:
1. Derive the kinematic model of the Spartan Robokit using Denavit-Hartenberg (D-H) parameters and graphical methods.
2. Successfully interface MATLAB with an Arduino-driven microcontroller based on the framework established by Balabag et al.
3. Translate theoretical forward kinematics into physical robotic motion by testing multiple joint variable configurations.
4. Execute a practical pick-and-place operation utilizing the programmed forward kinematics model.
5. Document physical circuitry, software integration, and mechanical assembly in a professional technical repository.

---

## 🧰 Materials
1. Laptops
2. MATLAB with Robotics Toolbox by Peter Corke
3. Spartan Robokit (Hardware & Circuitry)

---

## 📋 Team Member Responsibilities & Instructions

#### 1. Project Engineer
* **Repository Setup:** Create a private GitHub repository for the group project and add the lecturer as a collaborator.
* **Naming Convention:** Title the repository exactly as follows: 
  `Robotics2_Mechanical_Manipulator_Simulation_Section_Group#_PrelimProject_2026`
* **Documentation:** Write these project instructions and procedures into the repository's `README.md` file.
* **Kinematics & Formatting:** * Draw the kinematic diagram with proper labels for the Spartan Robokit.
  * Construct the parametric table.
  * Derive the Homogeneous Transformation matrices.
  * Upload and embed these images directly into the `README.md` file.
* **Data Integration:** Upload and organize the final project documentation, including pictures of the setup, source codes, and video demonstrations of the robot in motion.

#### 2. Programmer 1 & Programmer 2
* **Software Integration:** Study, analyze, and apply the existing program by Balabag et al. to successfully integrate MATLAB with the Arduino-driven Spartan Robokit.
* **Hardware Setup:** Assemble the physical components and wire the circuitry of the Spartan Robokit.
* **Testing:** Evaluate the physical robot using **5 distinct test points** (i.e., 5 different sets of values for the joint variables).
* **Application:** Program and execute a successful **pick-and-place task** relying exclusively on the Forward Kinematics method.
* **Submission:** Upload the finalized code into a designated folder within the GitHub repository created by the Project Engineer.

#### 3. Project Leader
* **Presentation Prep:** Prepare a strict **10-minute presentation** summarizing the preliminary project.
* **Presentation Content:** Ensure the presentation covers the following key areas:
  1. The labeled kinematic diagram, parametric table, and Homogeneous Transformation matrices of the Spartan Robokit.
  2. A review of the physical assembly and circuitry configuration.
  3. An explanation of the software integration between MATLAB and Arduino.
  4. Video/live demonstration of the physical forward kinematics motion.
  5. Mathematical verification proving the physical motion aligns with the calculated forward kinematics (based on lecture principles).
  6. Final conclusion.

---

## 📝 Standard D-H Transformation Matrix Reference
*Students: Utilize the standard Denavit-Hartenberg transformation matrix for your calculations:*

```text 
[ cos(θi)  -sin(θi)cos(αi)   sin(θi)sin(αi)  ai*cos(θi) ]
[ sin(θi)   cos(θi)cos(αi)  -cos(θi)sin(αi)  ai*sin(θi) ]
[   0         sin(αi)          cos(αi)          di      ]
[   0            0                0              1      ]

Intended Learning Outcome (ILO),Description,Points
ILO1 (SO1),Calculate the Forward and Inverse Kinematics of 3-DOF robotic manipulators using D-H parameters and Graphical Methods.,60 pts}
```

---
## 🖋️ Kinematic Diagram and Parametric Table
<p align="justify"> The Kinematic Diagram drawn was solely based on the values and variables present on the program provided. It shows an unconventional composition as the base frame is negatively pointing its axes. As for the following joints, most of them are natural as they follow the D-H frame rules. 

### ↕️ Kinematics & Formatting
Draw the kinematic diagram with proper labels for the Spartan Robokit.
|  Figure Title | Kinematic Diagram |
|---------------|-------------------|
|**`ARTICULATED 3-DOF`**|<p align="center"><img src="https://github.com/user-attachments/assets/21fcdf03-8ec4-4bf6-8e43-6f03fafaf45e" width="55%" height="50%">|

### 📊 Parametric Table
Construct the parametric table.
|  Figure Title | Parametric Table |
|---------------|-------------------|
|**`ARTICULATED 3-DOF`**|<p align="center"><img src="https://github.com/user-attachments/assets/0ae5d57f-39be-444e-9157-52cb4f461426" width="100%">|

### 🔢 Homogeneous Transformation Matrices
Derive the Homogeneous Transformation matrices of the articulated manipulator.
| Figure Title | Homogeneous Transformation Matrices |
|---------------|-------------------|
|**`ARTICULATED 3-DOF`**|<p align="center"><img src="https://github.com/user-attachments/assets/1888176f-96de-44c4-b013-3d3b285f3e5e" width="100%">|

---
## 💻 Program Files

The following program files in MATLAB, Arduino, and Python are provided by our instructor. Utilizing these programs allowed the students to explore the theoretical and practical application of ROBOTICS. 

**`MATLAB FILES`**

<div align="center">
  
| TITLE/NAME | FILE LINK|
|---------------|-------------------|
|MATLAB Program| [ROBOT.m](https://github.com/iversonfermo/GROUP-6-MIDTERMS/blob/main/MATLAB/ROBOT.m) |
|ROBOTIC Figure| [ROBOT.fig](https://github.com/iversonfermo/GROUP-6-MIDTERMS/blob/main/MATLAB/ROBOT.fig) |

</div>

**`ARDUINO FILES`**

<div align="center">

| TITLE/NAME | FILE LINK|
|---------------|-------------------|
|Arduino Program| [ROBOT.ino](https://github.com/iversonfermo/GROUP-6-MIDTERMS/blob/main/Arduino/ROBOT.ino) |

</div>

**`PYTHON FILES`**

<div align="center">
  
| TITLE/NAME | FILE LINK|
|---------------|-------------------|
|Python Program| [ROBOT.py](https://github.com/iversonfermo/GROUP-6-MIDTERMS/blob/main/Python/ROBOT.py) |

</div>

---
## 🔌⚡ Hardware Setup
Assemble the physical components and wire the circuitry of the Spartan Robokit. Make sure that the program is uploaded to the Arduino Uno, and each pin assigned is connected to its corresponding servo motor.

### 📟 Arduino Circuit Setup
<p align="justify"> This diagram illustrates the complete wiring configuration of the Spartan Robokit. Each joint’s servo motor is connected to designated pins on the controller, ensuring proper signal routing and coordinated movement of the manipulator.
  
| Circuit Configuration |
|-----------------------|
|<p align="center"><img src="https://github.com/user-attachments/assets/e0df9e5b-4b00-4c77-a5a9-6516d644ee8f" width="100%">|

### 📏 Link Lengths
<p align="justify"> The following values were obtained by measuring each link lengths present in the Spartan Robotic Kit. Acquiring the intended values increases the accuracy and correctness of the MATLAB and Python program. This also improves the overall integrity of the simulation.
  
| n | Measurement in mm | Documentation |
|-----------|---------|---------|
| a1 | <p align="center">60mm | <p align="center"><img src="https://github.com/user-attachments/assets/896389be-df3a-483d-a1ac-a4a35dcd3376" width="55%" height="50%"> |
| a2 | <p align="center">110mm | <p align="center"><img src="https://github.com/user-attachments/assets/d89718f1-dac2-44ad-b851-5f7eceef8ee9" width="55%" height="50%"> |
| a3 | <p align="center">100mm | <p align="center"><img src="https://github.com/user-attachments/assets/425bedf9-fbab-4160-96d8-ea8d1cb5c79f" width="55%" height="50%"> |

---
## ⚖️ Theoretical and Practical Application

### 🖥️ Comparison of Output Numerical Values
1. After completing the programs in both software, such as Python and MATLAB, proceed to compare the results.
2. Ensure that the input values in each program are synchronized to prevent incorrect readings.
3. Once the results are validated and identical, proceed to compare the output for the next diagram.

**`Simulation Results`**
| Test Case | Results |
|-----------|---------|
| Test Case 1 | <img src="https://github.com/user-attachments/assets/d33ce21a-70b7-4a15-be46-b1151be04b7d" width="100%"> |
| Test Case 2 | <img src="https://github.com/user-attachments/assets/515c5144-4dd0-4aa9-acaf-ff94033ffdfb" width="100%"> |
| Test Case 3 | <img src="https://github.com/user-attachments/assets/3ba4a250-e987-4822-9a6c-241ca488e28f" width="100%"> |
| Test Case 4 | <img src="https://github.com/user-attachments/assets/8c7f4487-3a8c-4fb8-9aeb-f2184a229927" width="100%"> |
| Test Case 5 | <img src="https://github.com/user-attachments/assets/8799b66c-64cb-41eb-a86b-c16e0703e56e" width="100%"> |

### 🤖 Program Interaction With The Mechanical Manipulator
1. With the given MATLAB and Arduino Programs, the students are required to compare it side by side with the Mechanical Manipulator.
2. Ensure that each program are synchronized to prevent incorrect readings and position error.
3. Once the results are validated and identical, proceed to retreat the manipulator; Return it to its initial position.
4. Apply this process for at least five (5) test points.

**`Manipulator Results`**
| Test Case | Results |
|-----------|---------|
| Test Case 1 | <p align="center"><a href="https://www.youtube.com/watch?v=RmhTxU9ItHI"><img src="https://img.youtube.com/vi/RmhTxU9ItHI/0.jpg" alt="Watch Video" width="1000"></a></p> |
| Test Case 2 | <p align="center"><a href="https://www.youtube.com/watch?v=l92WfvhURJA"><img src="https://img.youtube.com/vi/l92WfvhURJA/0.jpg" alt="Watch Video" width="1000"></a></p> |
| Test Case 3 | <p align="center"><a href="https://www.youtube.com/watch?v=BeicOAHtNlM"><img src="https://img.youtube.com/vi/BeicOAHtNlM/0.jpg" alt="Watch Video" width="1000"></a></p> |
| Test Case 4 | <p align="center"><a href="https://www.youtube.com/watch?v=NsjPUNzSOHg"><img src="https://img.youtube.com/vi/NsjPUNzSOHg/0.jpg" alt="Watch Video" width="1000"></a></p> |
| Test Case 5 | <p align="center"><a href="https://www.youtube.com/watch?v=_CkyncTATko"><img src="https://img.youtube.com/vi/_CkyncTATko/0.jpg" alt="Watch Video" width="1000"></a></p> |

---
## 📍 Pick and Place
Program and execute a successful **pick-and-place task** relying exclusively on the Forward Kinematics method.

| Pick-and-place Execution |
|-----------------------|
| <p align="center"><a href="https://www.youtube.com/watch?v=Pq4bEYlt2qc"><img src="https://img.youtube.com/vi/Pq4bEYlt2qc/0.jpg" alt="Watch Video" width="1000"></a></p> |


---
## 📝 Conclusion

FERMO
