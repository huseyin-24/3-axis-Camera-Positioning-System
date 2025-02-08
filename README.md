# 3-axis-Camera-Positioning-System

The aim of the project is to position the high-speed camera in 3D Cartesian coordinates. Duet 3 Mainboard 6HC is used as a control card. Please refer to https://docs.duet3d.com for more information since this documentation only covers specific issues. Control card setup files can be reached in attachments.

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
Please refer to https://reprap.org/wiki/Mechanical_Endstop for further information. Note that A: Simple configuration in figure 5 is used for wiring end stops.

<p align="center">
  <img src="https://github.com/user-attachments/assets/46314d7c-70af-4e88-bdec-38ccd8addc46" width="402" /></p>
<p align="center">Figure 3. Power Supply</p>

  #### Steppers
Please refer to https://www.instructables.com/Wiring-Your-Z-Stepper-Motors-in-Series/ for the series connection of z-axis motors.

figure 

  
## 3. x-axis Assembly Photos
   Though the assembly size is slightly different, the y-axis is very similar to the x-axis construction.
   fig12
   fig 
   
## 4. General Notes on Steppers and How to Calibrate Them 
  ### Notes  
  
These notes are collected from various online sources: 
- 
- 
