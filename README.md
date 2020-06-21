# CRT Shader
 CRT Shader
 
This shader tries to imitate de view of a Cathode-Ray Tube. Can be useful for retro games.
It works on Godot 3.2 and needs GLES3 if you use the blur effect.

Just create a ColorRect node and apply this shader to it. Then adjust the size to your display and choose the resolution you want imitate in the V_res and H_res controls. The shader itself is in the CRT.shader file.

You can activate the Scanlines with the Scanlines check. You can also adjust them with the sl_opacity and sl_blur controls to match the desired effect.
 
![image](https://github.com/oscar-1/CRT-Shader/blob/master/Images/ScanLines.PNG?raw=true)

The blur control tries to imitate the lack of sharpness of the old CRTs. I encorage you to use it to get a more realistic feeling. 

![image](https://github.com/oscar-1/CRT-Shader/blob/master/Images/Blur.PNG?raw=true)

You can activate the view of the vertical anode grid. This shader imitates Trinitron grid type. You can adjust the width of the grid through a control.

![image](https://github.com/oscar-1/CRT-Shader/blob/master/Images/Grid.PNG?raw=true)

Lastly you can activate the view of the RGB component subpixels. If your display don't has enough resolution can appear some artifacts in the image, be careful to get a good result.

![image](https://github.com/oscar-1/CRT-Shader/blob/master/Images/RGB.PNG?raw=true)

Due the scanlines and the grid add black to the image, it is posible that you want to compensate it rising the brightness using the boost control.

Hope you enjoy it.
