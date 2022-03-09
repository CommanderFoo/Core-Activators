--[[
Copyright 2021 Manticore Games, Inc.
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--]]
--[[ 

LAST UPDATED: 6/15/2021

{ META WEAPON TRAILS CC }
Created by: Outrun
Special Thanks to: Coderz


-------------------------------------------------
DESCRIPTION
  This CC utilizes the latest 2D Curves/Curve Editor!
 
 The CC allows creators to make use of the 2D Curves easily, and in the coolest way possible. . . Weapon trails! 
 Everything is already setup so NO CODING REQUIRED!!! 

 The weapon trail templates can be modified on the ROOT of the template. (Template itself)






Need assistance? reach out to me at my discord: Outrun#0001


--------------------------------------------------
STEPS FOR SUCCESS! --

STEP 1: Search the 'Project Content' for "Trail_"  This should return a list of premade ready-to-go templates from the CC,

STEP 2: Drag in a template of your choice into the hierarchy, personally, my favorite is the "Trail_HEART" template.

STEP 3: Search through 'Core Content' > 'Game Components' for a Weapon and drag your weapon into the scene.

STEP 4: Change the 'Bullet_Speed' custom property on the trail template you chose to match the chosen Weapons 'Projectile Speed' property, it is important that these are the same!

STEP 5: Update the 'Trail_' Template you've chosen, and attach the template to your weapon of choice, the trail template should be placed in 'Trail Template' property on the weapon.

STEP 6: Test the weapon! The template provides on/off (booleans) that allow you to change how to the trail should act! 

STEP 7: Feel free to adjust the 2D Curves, these can be found on the trail's template!


   !!!!PRO TIPS!!!!

I DON'T suggest changing the 'time' on ANY 'Arc_Curve' in the 2D Curve Editor! as ALL Arc_Curves start from 0 to 1 as it's normalized. This makes the trail always land on its mark! Changing this will cause problems.
 However, feel free to change the value and tangents of the Arc_Curves for neat effects as that is what its made for! 


FEEL FREE to change the 'time' on the VFX_Curves! Unlike the Arc_Curves, the VFX Curves are completely independent, the timing can be changed to whatever you may desire! 

KEEP IN MIND the pre (IN) and post (OUT) extrapolation settings in the curve editor for ONLY the VFX Curves. Linear or Constant is not desirable and will cause the VFX to "fly away"


MOST IMPORTANTLY, Have fun, if you need to reach out to me or show me what you created, feel free to send me a message on Discord! 

]]