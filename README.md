# Gesture recognition in embodied mirroring setup


We developed an efficient algorithm for **gesture recognition** to be exploited within an embodied mirroring setup for **autistic children**. The use of robot-mediated therapy has been suggested as a potentially powerful tool to improve *social*, *cognitive*, and *motor skills* in autistic children. Embodied mirroring setups (including a **robot**, a **motion tracking**, and a **feedback system** where the robot is able to mirror the movement of a tracked person and give a feedback on the execution of the movement) are being developed to this aim. The implementation of a feedback system is fundamental to achieve the best training: only correctly executed gestures should be mirrored by the robot during the execution of an exercise, in order to train functional motor skills. To reach this goal, in this project an algorithm for the recognition of gestures, captured by a Kinect, was developed, it was trained on a dataset acquired by ourselves and it will be used in an embodied mirroring setup.

*Python* and *MATLAB (R)* were used to analyze the gathered data and implement the algorithm.

### Papers:
- *So et al., Molecular autism, 2018*.
It describes a robotic gesture therapy. It gives a general overview of these kinds of therapies and their most frequently encountered problems.
- *Paraskevopoulos et al., Algorithms, 2019*.
Describes the main issues related with arm gesture recognition and compares several machine learning approaches.
- *Yang et al., Arxiv, 2019.*
Describes a deep learning solution for action recognition presenting a lightweight network tested in two different datasets.

This project was carried out as a discussion teaching activity inside Nearlab, a laboratory born in Politecnico di Milano, whose mission is to *impact on the health and well-being of citizens in the world changing society by smart medical and personal robots and personalized technologies*.

---

### Gestures caputured
We worked on five gestures concerning upper limbs only:
- "waving"
- "small"
- "pointing"
- "yes"
- "come"

### Motion capture system: Microsoft Kinect
Main specs:
- Contact-less motion capture system
- 25Hz sampling rate
The depth camera identifies pixels in 3D through stereoscopic vision. The SDK is in charge of the skeletal tracking (25 joints tracked).

### Requirements
- PC with one available USB 3.0 port rinning Windows
- Kinect environment - [Kinect SDK](https://www.microsoft.com/en-us/download/details.aspx?id=44561)
- A Python IDE (e.g. Visual Studio, Atom, PyCharm)
- Python 2.7 with the following package:
  - [PyKinect 2](https://github.com/Kinect/PyKinect2)

<img src="https://github.com/AlessioRatti/Guess_my_gesture/blob/master/gifs/ciao_crop.gif" width="300" height="320" />
