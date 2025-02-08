; homex.g
; called to home the X axis
;
; generated by RepRapFirmware Configuration Tool v3.4.1 on Tue Jul 16 2024 15:15:08 GMT+0200 (Doğu Avrupa Standart Saati)
; homex.g
; called to home the X axis
 
M400                 ; wait until motion stops
M913 X30             ; set X Y  motors to 30% of their normal current
M915 X Y S1 R2       ; Configure motor stall detection
M400                 ; wait until motion stops
G92 X0               ; manual specification of the axis positions, i.e. set current position of X axis to 0
G91                  ; relative positioning 
;G1 H2 Z2 F300
G1 H1 X-250 F3000
;G1 X20 F2400
;G1 H2 Z-2 F300
G90                  ; absolute positioning 
M400                 ; wait until motion stops
M913 X50             ; set X motor to 50% of its max 
M400                 ; wait until motion stops
 
; offset by 1mm
G0 X120 F6000
G0 X10
G0 190 
G0 X20
G0 X130
G0 X10
G0 150
G0 X20
