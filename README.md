# 3-axis-Camera-Positioning-System

The aim of the project is to position the high-speed camera in 3D Cartesian coordinates. Duet 3 Mainboard 6HC is used as a control card. Please refer to https://docs.duet3d.com for more information since this documentation only covers specific issues. Control card setup files can be reached in attachments.


https://github.com/user-attachments/assets/9651e623-7c86-4147-bee2-e84220608de8


<p align="center">
  <img src="https://github.com/user-attachments/assets/486e7d98-34f1-423d-bb43-f92b5da7f263" width="402" /></p>
<p align="center">Figure 1. General Assembly</p>

## 1. Components
- Control card: Duet 3 Mainboard 6HC

- Motors: 2x Nema23 56mm-length 2A stepper (one for x- and one for y-axis), 2x Nema23 112mm-length 3A stepper (both for z-axis)

- Motor drivers: Included in control card

- Power supply: 24V Power Supply

- End switch: 3x mechanical end stop (one for each axis)

- Mechanical components: Aluminum sigma profiles with varying sizes, linear bearings and their rails, lead screw and its nut, x-axis motor holder and lead screw housing elements, belts and pulleys, flexible couplings, bolts, and nuts in varying sizes. Other parts are manufactured by machining or 3D printing.

- Raspberry Pi 3B+ and its power supply: Pi is connected to the control board for WLAN connection.

## 2. Wiring
<p align="center">
  <img src="https://github.com/user-attachments/assets/4d843850-6bf4-4938-af6c-c611ee6fb31a" width="402" /></p>
<p align="center">Figure 2. Duet3 6HC and Raspberry Pi 3B+</p>

- The white wire indicated via the blue rectangle is the power supply of the Pi and directly connects to mains electricity.

- The wires indicated via the green rectangle are for the 24V power supply. (Follow Figure 3.)

- The wires indicated via the red rectangle are for end stops. (Follow Figure 4.)

- The wires indicated via the black rectangle are for steppers. (Note that only one wire plugs into the control card for 2 steppers of the z-axis. Please refer to the related section below for how to connect 2 motors.)

#### Power Supply
<p align="center">
  <img src="https://github.com/user-attachments/assets/46314d7c-70af-4e88-bdec-38ccd8addc46" width="402" /></p>
<p align="center">Figure 3. Power Supply</p>

- Green wires are coming from the control card.

- Yellow wires directly connect to mains electricity.

#### End Stops
Please refer to https://reprap.org/wiki/Mechanical_Endstop for further information. Note that A: Simple configuration in Figure 4 is used for wiring end stops.

<p float="center">
  <img src="https://github.com/user-attachments/assets/0ecdf3fe-7bc6-4dcc-bee3-5814bbd8fc82" width="350" />
  <img src="https://github.com/user-attachments/assets/75ab63d2-dabd-4630-ae80-4092e36df9ed" width="550" /> 
</p>
<p align="center">Figure 4. Mechanical End Stops and Their Wiring Configurations</p>

#### Steppers
Please refer to https://www.instructables.com/Wiring-Your-Z-Stepper-Motors-in-Series/ for the series connection of z-axis motors.

<p float="center">
  <img src="https://github.com/user-attachments/assets/fdce0e29-82d9-4f18-996f-8694462ab924" width="350" />
  <img src="https://github.com/user-attachments/assets/89e4b79b-0d7e-4b4d-b215-527d86ad397c" width="442" /> 
</p>
<p align="center">Figure 5. Series Connection of z-axis Steppers</p>

  
## 3. x-axis Assembly Photos
Though the assembly size is slightly different, the y-axis is very similar to the x-axis construction.

<p float="center">
  <img src="https://github.com/user-attachments/assets/b4421895-dd66-4015-b861-6056b39888e4"/>
  <img src="https://github.com/user-attachments/assets/d973216c-6b91-4565-9283-91f2432abade"/> 
</p>
<p align="center">Figure 6. Drivetrain of x-axis</p>


<p align="left">
  <img src="https://github.com/user-attachments/assets/36a028b9-6368-49f9-a495-da2d3c2393de" /></p>
<p align="center">Figure 7. General assembly of x-axis without top table which carries the camera. Recognize that tension of the belt is adjusted via parts indicated with hand in the image. </p>

## 4. General Notes on Steppers and How to Calibrate Them 
### General Notes:  
These Notes are collected from various online sources.
- Stepper motors move in discrete steps, or fractions of a revolution. For example, a stepper motor with a 1.8-degree step angle will make 200 steps for every full revolution of the motor (360 ÷ 1.8). This discrete motion means the motor’s rotation isn’t perfectly smooth, and the slower the rotation, the less smooth it is due to the relatively large step size. One way to alleviate this lack of smoothness at slow speeds is to reduce the size of the motor’s steps. This is where microstepping comes in.
- Microstepping control divides each full step into smaller steps to help smooth out the motor’s rotation, especially at slow speeds. For example, a 1.8-degree step can be divided up to 256 times, providing a step angle of 0.007 degrees (1.8 ÷ 256), or 51,200 microsteps per revolution.
- Torque production from a stepper motor with microstepping control is only about 70 percent of the torque produced with full-step control.
- Single step gives the highest torque. (But the least practical torque, as resonance is nearly always the mechanism of failure (miss-stepping). x8 to x16 microstepping is normally the place to start for driving a stepper to keep resonance under control. Single steps are incredibly noisy and create severe vibration, not pleasant.) Use the current needed for the job. Running at maximum, things do get warm. Note that steppers still use full current even if they don't run. Powering down, disabling driver outputs, is one way to lower the heating. Note that there's no holding torque then.
- The rated current is the maximum current for one winding while the other winding carries no current. If both windings are active, the sum of the squares of the two currents should be equal or less than the square of the rated current (quadrature drive). Thus, with full steps, a 4.2A setting will send ~3A to both windings. If you look at datasheets for stepper driver chips, they will show you this in detail for each microstepping ratio. The upshot is that the power consumption is basically constant for a stepper (without mechanical load and at low speed).
- **Empty Resolution:** It’s important to avoid what is sometimes referred to as “empty resolution,” where the division level of the steps (i.e., the resolution) is higher than practical for the system constraints. This most often occurs when the torque produced by the microstep is insufficient to overcome the friction torque of the component that’s being driven (such as a leadscrew or ball screw). The incremental torque per microstep is determined by the following equation: $T_{INC} = T_{HFS} \cdot \sin \left(\frac{90}{SDR}\right)$ where $T_{INC}, T_{HFS}, SDR$ represent incremental torque produced with each microstep, holding torque (full-step operation) and step division ratio (number of microsteps per full step, respectively.

  For a motor with 0.35 Nm holding torque using a 256-step division ratio (SDR), the incremental torque produced by each microstep would be 0.002 Nm. If the screw has a friction torque of 0.06 Nm, it will take 30 microsteps (0.06 ÷ 0.002) to generate enough torque to cause the screw to move. In addition, operating with more steps per revolution requires a higher frequency for the pulse train driving the motor. Using the 256 SDR in the previous example means the motor takes 51,200 steps, or pulses, per revolution (200 full steps per revolution x 256 microsteps per step). At a motor speed of 100 rps (6000 rpm), the required pulse frequency is more than 5 MHz.


### Calibration: 

  In our system, 64 microsteps are used, which means each step is divided into 64 (micro)steps. Since the software of the control board demands us to provide a step per mm data, we need to calculate it using the microstepping value, the step angle of the motor, and the mechanical construction of the axis as follows:  
**Motor side:** 1.8 degrees/step  
**Microstepping:** 64 (micro)step/step = 64  
Than, $\frac{\frac{1.8 \ degrees}{step}}{64} = 0.028125 \ degrees/step$  
To find out step per revolution:  
$\frac{\frac{360 \, degree}{rev}}{\frac{0.028125 \, degree}{step}} = 12800 \ step/rev$, which means 12800 step is required for motor to turn one revolution.  

#### Mechanical Construction  
In this part, we need to relate one revolution of the motor to the linear displacement traveled for one revolution. In our system (for the x- and y-axis), we use belts with a 30mm pitch diameter, which corresponds to a linear displacement of:

$$
\pi \times d = \pi \times 30\ \text{mm} \cong 94.25\ \text{mm}
$$

This means that for one revolution of the stepper motor, the linear axis moves 94.25mm, i.e.,

$$
1\ \text{rev} = 94.25\ \text{mm}
$$

Then, let's combine the values found above:

$$
12800\ \frac{\text{step}}{\text{rev}} = 12800\ \frac{\text{step}}{94.25\ \text{mm}} = 135.8\ \frac{\text{step}}{\text{mm}}
$$

This is the required information that we are supposed to provide to the software.
  

