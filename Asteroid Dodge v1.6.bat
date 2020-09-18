 ::::::::::::::::::::::::
 ::   ASTEROID DODGE   ::
::::::::::::::::::::::::::
::Welcome to the        ::
::editor.               ::
::::::::::::::::::::::::::
::Only edit if you KNOW ::
::WHAT YOU ARE DOING.   ::
::::::::::::::::::::::::::
@echo off
title Asteroid Dodge (1.6)
goto menu
:begin
SET score=0
SET line4#=0
SET line3#=0
SET line2#=0
SET line1#=0
SET line4= .    .    .    .
SET line3= .    .    .    .
SET line2= .    .    .    .
SET playerY=1
:render
SET /a rand=%random% * 4 / 32768 + 1
cls
IF %rand%==1 (SET line1= O    .    .    .)
IF %rand%==2 (SET line1= .    O    .    .)
IF %rand%==3 (SET line1= .    .    O    .)
IF %rand%==4 (SET line1= .    .    .    O)

echo/
echo Asteroid Dodge (1.6)
echo/

echo %line1%
echo %line2%  Score: %score%
echo %line3%
echo %line4%

IF %playerY%==0 (set playerY=1)
IF %playerY%==5 (set playerY=4)
IF %playerY%==1 (echo  A    .    .    .)
IF %playerY%==2 (echo  .    A    .    .)
IF %playerY%==3 (echo  .    .    A    .)
IF %playerY%==4 (echo  .    .    .    A)

choice /c ad /n /m "Move: "
set /a score =score+1
if %ERRORLEVEL%==1 (set /a playerY=%playerY%-1)
if %ERRORLEVEL%==2 (set /a playerY=%playerY%+1)

SET line4=%line3%
SET line3=%line2%
SET line2=%line1%

SET line1#=%line2#%
SET line2#=%line3#%
SET line3#=%line4#%
SET line4#=%rand%

IF %playerY%==%line1#% (goto endgame)

goto render

:menu
echo easter egg
cls
echo "
echo " Welcome to                                                      
echo "  _______  _______  _______  _______  ______    _______  ___   ______     ______   _______  ______   _______  _______ 
echo " |       ||       ||       ||       ||    _ |  |       ||   | |      |   |      | |       ||      | |       ||       |
echo " |   _   ||  _____||_     _||    ___||   | ||  |   _   ||   | |  _    |  |  _    ||   _   ||  _    ||    ___||    ___|
echo " |  |_|  || |_____   |   |  |   |___ |   |_||_ |  | |  ||   | | | |   |  | | |   ||  | |  || | |   ||   | __ |   |___ 
echo " |       ||_____  |  |   |  |    ___||    __  ||  |_|  ||   | | |_|   |  | |_|   ||  |_|  || |_|   ||   ||  ||    ___|
echo " |   _   | _____| |  |   |  |   |___ |   |  | ||       ||   | |       |  |       ||       ||       ||   |_| ||   |___ 
echo " |__| |__||_______|  |___|  |_______||___|  |_||_______||___| |______|   |______| |_______||______| |_______||_______| 
echo "
echo "
echo "                                                                                Version 1.6
echo " <(A)Play! 
echo "
echo " <(B)How to Play?
echo "
echo " <(C):Leave
echo "
choice /c abc /n /m "A, B, or C? "
if %ERRORLEVEL%==1 (goto begin)
if %ERRORLEVEL%==2 (goto tutorial)
if %ERRORLEVEL%==3 (exit)

goto menu

:endgame
cls
echo/
echo            Game Over
echo/  
echo            X       X
echo             _______
echo/          
echo/
echo  Your died with a score of %score%.
echo  Better luck next time!
echo/
pause
goto menu

:tutorial
cls
echo/
echo You are the rocket ship. (A)
echo You use A and D to move.
echo You must dodge the asteroids (O) falling down.
echo If you crash, you lose.
echo Good luck. You'll need it.
echo/
pause
goto menu