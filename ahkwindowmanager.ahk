#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Part One - Variables

;Dimensions, Window Locations
windowsbarheight := 40
Sysget, totalwidth, 78
Sysget, totalheight, 79

usefulheight := totalheight - windowsbarheight
halfheight := usefulheight //2
quarterwidth := totalwidth //4


programsopened := 0
extrabuffer := 250

;Programs
SetTitleMatchMode, 2


;prgrm1 - left monitor, Upper left
;prgrm2 - left monitor Upper Right
;prgrm3 - left monitor Bottom Left
;prgrm4 - left monitor Bottom Right
;prgrm5 - Right monitor, Upper left
;prgrm6 - Right monitor, Upper Right
;prgrm7 - Right monitor Bottom Left
;prgrm8 - Right monitor Bottom Right


prgm1 := "C:\path\to.exe"
prgm1title := "prgm1title"
prgm1array := ["prgm1title", "C:\path\to.exe", 0, 0, quarterwidth, halfheight]

prgm2 := "https://website.com/"
prgm2title := "prgm2title"
prgm2array := ["prgm2title", "https://website.com/", quarterwidth, 0, quarterwidth, halfheight]

prgm3 := "C:\path\to.xlsx"
prgm3title := "prgm3title"
prgm3array := ["prgm3title", "C:\path\to.xlsx", 0, halfheight, quarterwidth, halfheight]

prgm4 := "C:\path\to.docx"
prgm4title := "prgm4title"
prgm4array := ["prgm4title", "C:\path\to.docx", quarterwidth,     halfheight, quarterwidth, halfheight]

prgm5 := "C:\path\to.pdf"
prgm5title := "prgm5title"
prgm5array := ["prgm5title", "C:\path\to.pdf", quarterwidth*2,   0, quarterwidth, halfheight]

prgm6 := "C:\path\to.exe"
prgm6title := "prgm6title"
prgm6array := ["prgm6title", "C:\path\to.exe", quarterwidth*3,   0, quarterwidth, halfheight]

prgm7 := "C:\path\to.exe"
prgm7title := "prgm7title"
prgm7array := ["prgm7title", "C:\path\to.exe", quarterwidth*2,   halfheight, quarterwidth, halfheight]

prgm8 := "C:\path\to.exe"
prgm8title := "prgm8title"
prgm8array := ["prgm8title", "C:\path\to.exe", quarterwidth*3,   halfheight, quarterwidth, halfheight]






; Functions
ifwinnotexist(a,b)
{
    global programsopened
    IfWinNotExist, %a%
{
Run, %b%
programsopened := programsopened + 1
}
}

getwindowmath(z)
{
; Find out if the window is minimized, maximized, or open and store it in var. If it's minimized or maximized, run WinRestore.
global sum_of_coordinates, sum_of_area
WinGet, var, MinMax, %z%
If var != 0
{
WinRestore, %z%
}

;Then get window info, store it in sum_of_coordinates and sum_of_area
WinGetPos X, Y, W, H, %z%
sum_of_coordinates := X + Y
sum_of_area := W + H
;msgbox, %z% `nSum of dimensions: %sum_of_coordinates% `nSum of area %sum_of_area%
}

;Part Two - Hotkeys 

f1:: ;Opening Programs



;Look up the first element in the array. it's a window title. if the window title does not exist, run the exe that runs it. 

ifwinnotexist(prgm1array[1],prgm1array[2])
ifwinnotexist(prgm2array[1],prgm2array[2])
ifwinnotexist(prgm3array[1],prgm3array[2])
ifwinnotexist(prgm4array[1],prgm4array[2])
ifwinnotexist(prgm5array[1],prgm5array[2])
ifwinnotexist(prgm6array[1],prgm6array[2])
ifwinnotexist(prgm7array[1],prgm7array[2])
ifwinnotexist(prgm8array[1],prgm8array[2])


;Sleep Time
sleeptime := (programsopened * 500) + extrabuffer
Sleep, %sleeptime%

;Moving The Programs
;Get the status of the named window. If it's either minimized or maximized, return it to a non minimized or maximized state. 
;Then get its current x y h w. Then add its x and y values and call that sum_of_coordinates, then add its w and h value and call it sum_of_area
;Those past two lines, we summarize all of that as a function called getwindowmath()
;If sum_of_coordinates or sum_of_area are not the ideal numbers, then move the named window to specific coordinates.

;Placeholder for program name
getwindowmath(prgm1array[1])
If (sum_of_coordinates != (prgm1array[3] + prgm1array[4])  Or sum_of_area != (prgm1array[5] + prgm1array[6]))
{
;msgbox, %prgm1title% `nSum of coordinates: %sum_of_coordinates% `nSum of area %sum_of_area%
Winmove, %prgm1title%,, prgm1array[3], prgm1array[4], prgm1array[5], prgm1array[6]
}

;Placeholder for program name
getwindowmath(prgm2array[1])
If (sum_of_coordinates != (prgm2array[3] + prgm2array[4])  Or sum_of_area != (prgm2array[5] + prgm2array[6]))
{
;msgbox, %prgm2title% `nSum of coordinates: %sum_of_coordinates% `nSum of area %sum_of_area%
Winmove, %prgm2title%,, prgm2array[3], prgm2array[4], prgm2array[5], prgm2array[6]
}

;Placeholder for program name
getwindowmath(prgm3array[1])
If (sum_of_coordinates != (prgm3array[3] + prgm3array[4])  Or sum_of_area != (prgm3array[5] + prgm3array[6]))
{
;msgbox, %prgm3title% `nSum of coordinates: %sum_of_coordinates% `nSum of area %sum_of_area%
Winmove, %prgm3title%,, prgm3array[3], prgm3array[4], prgm3array[5], prgm3array[6]
}

;Placeholder for program name
getwindowmath(prgm4array[1])
If (sum_of_coordinates != (prgm4array[3] + prgm4array[4])  Or sum_of_area != (prgm4array[5] + prgm4array[6]))
{
;msgbox, %prgm4title% `nSum of coordinates: %sum_of_coordinates% `nSum of area %sum_of_area%
Winmove, %prgm4title%,, prgm4array[3], prgm4array[4], prgm4array[5], prgm4array[6]
}

;Placeholder for program name
getwindowmath(prgm5array[1])
If (sum_of_coordinates != (prgm5array[3] + prgm5array[4])  Or sum_of_area != (prgm5array[5] + prgm5array[6]))
{
;msgbox, %prgm5title% `nSum of coordinates: %sum_of_coordinates% `nSum of area %sum_of_area%
Winmove, %prgm5title%,, prgm5array[3], prgm5array[4], prgm5array[5], prgm5array[6]
}


;Placeholder for program name
getwindowmath(prgm6array[1])
If (sum_of_coordinates != (prgm6array[3] + prgm6array[4])  Or sum_of_area != (prgm6array[5] + prgm6array[6]))
{
;msgbox, %prgm6title% `nSum of coordinates: %sum_of_coordinates% `nSum of area %sum_of_area%
Winmove, %prgm6title%,, prgm6array[3], prgm6array[4], prgm6array[5], prgm6array[6]
}

;Placeholder for program name
getwindowmath(prgm7array[1])
If (sum_of_coordinates != (prgm7array[3] + prgm7array[4])  Or sum_of_area != (prgm7array[5] + prgm7array[6]))
{
;msgbox, %prgm7title% `nSum of coordinates: %sum_of_coordinates% `nSum of area %sum_of_area%
Winmove, %prgm7title%,, prgm7array[3], prgm7array[4], prgm7array[5], prgm7array[6]
}

;Placeholder for program name
getwindowmath(prgm8array[1])
If (sum_of_coordinates != (prgm8array[3] + prgm8array[4])  Or sum_of_area != (prgm8array[5] + prgm8array[6]))
{
;msgbox, %prgm8title% `nSum of coordinates: %sum_of_coordinates% `nSum of area %sum_of_area%
Winmove, %prgm8title%,, prgm8array[3], prgm8array[4], prgm8array[5], prgm8array[6]
}





return
