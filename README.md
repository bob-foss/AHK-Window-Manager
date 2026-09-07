## Autohotkey Window Manager

An AHK script to maximize screen space on a dual monitor setup. 
 
This is a program that helps you maintain the positions of your windows & programs. Everyone has their favorite programs and favorite places for them on the screen, and this program will allow the user to bring them all back to their desired locations no matter if the programs were closed, minimized, maximized, or moved, and it will do all of this quickly and at a push of a button. 

It assumes 2 monitors, side by side with the same resolutions.

Written for and by the easily distracted! 

### Set-up
1. Install [AutoHotKey v1](https://www.autohotkey.com/) 
2. Adjust these variables to your liking. You can get coordinates and pixel height using the Window Spy that's included with the AHK install. 
	1. Line 9, windowsbarheight. This variable is how tall the taskbar is in Windows. 
	2. The arrays of the 8 programs, lines 35-65. These are the variables that define:
		1. Program names
		2. Program titles (the windows can be moved around by their names)
		3. The X and Y coordinates of the program's window, and also each programs' width and depth. 

### Summary
First, the program defines important variables, such as the location of the programs in the file system & the window titles of the programs. It also defines variables for the total screen size, the size of the Windows bar, how much screen is really available without the Windows bar, and variables such as halfheight for later, so if a user wanted an app to take up half the height of the screen, they'd quickly be able to use the right variables. 

The second section of the program asks if a program is running or not based on if its title exists, and if it doesn't, it runs the program associated with it and increases a variable called programsopened by 1. Using if statements like this decreases the amount of time spent opening programs, making this program run as fast as it can. 

After launching all of the programs that did not exist, the program does nothing for 0.5 seconds per program launched. This section of code ensures that if many programs were opened by the previous section, an appropriately sized break is given before the program issues other commands to those windows. This is a nice piece of math because when the user didn't open many programs, they don't wait long, and when the user opened many programs, they wait long enough for all of them to load. 

Then, the program asks each window if it's minimized, maximized or neither, and stores that value in a variable called var. If the window is just on the screen and is neither minimized or maximized, var is equal to 0. We want var to equal 0. If var isn't equal to 0, then that means that the window is minimized or maximized, and then the program will use WinRestore to unminimize it or unmaximize it, making it equal 0. 

Then the program will get window information from it, such as the X and Y coordinates of its upper left most pixel, and the height and width of its window. These values will be stored in X, Y, H and W. X and Y are added & stored in a variable called sum_of_coordinates, and H and W are added & stored in a variable called sum_of_area. If these 2 values are different from the sums of the original values the user desires, the window will be moved to the appropriate X and Y coordinates with the proper height and width. Using a sum to quickly get an understanding of these variables has its drawbacks, it's theoretically possible for false negatives to occur, but I chose this for simplicity. 

All of the above is to ensure that the desired programs snap in to the desired place, every time, as quickly as possible. If the right windows are in the right place while the program is run, they can be quickly ignored. 
