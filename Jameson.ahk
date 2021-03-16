#include LLMouse.ahk

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;TODO: 
;	create slowclick() and slowpress() to make code more readable
;	change numeric values to variables that can be set based on screen resolution
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

F5::
	if WinExist("Elite - Dangerous (CLIENT)") {
		WinActivate
		
		Loop
		{
		
		Black := "0x000000"
		PixelGetColor, NotBlack, "333", "946", RGB
		
		while NotBlack = Black {
			sleep 500
			PixelGetColor, NotBlack, "333", "946", RGB
		}
		
		sleep 3000
		
		reset()
		
		sleep 2000
		
		Send {U}
		
		sleep 2000
		
		scan_all_beacons()
		
		sleep 500
		
		logout_login()
		
		sleep 500
		}
	}

F6::ExitApp
	
logout_login() {

	Send {Esc}
	
	sleep 2000
	
	;Exit
	Send {up down}
	
	sleep 100
	
	Send {up up}
	
	sleep 1000
	
	press_enter()
	
	sleep 2000
	
	;Exit to Main Menu
	press_enter()
	
	sleep 2000
	
	ArxColor := "0x00AEFE"
	PixelGetColor, ScreenColor, "1716", "228", RGB
	
	while ScreenColor != ArxColor {
		sleep 500
		PixelGetColor, ScreenColor, "1716", "228", RGB
	}
	
	;Continue
	press_enter()
	
	sleep 2000
	
	;Solo Play
	press_right()
	
	sleep 1000
	
	press_right()
	
	sleep 1000
	
	press_enter()
}

scan_all_beacons() {
	
	scan_beacon(270, true)
		
	sleep 500
		
	move_vertically(5, false)
		
	sleep 500
		
	scan_beacon(120, false)
		
	sleep 500
		
	move_vertically(5, true)
		
	sleep 500
		
	scan_beacon(60, false)
		
	sleep 500
		
	scan_beacon(200, false)

}

move_vertically(pan, down) {
	
	if down
		LLMouse.Move(0, 20, pan, 2)
	else
		LLMouse.Move(0, -20, pan, 2)
	
	sleep 1000
}
	
scan_beacon(pan, left) {
	
	if left
		LLMouse.Move(-20, 0, pan, 2)
		
	else
		LLMouse.Move(20, 0, pan, 2)
	
	sleep 1000
	
	Send {rbutton down}
	
	sleep 8000
	
	Send {rbutton up}
}

reset() {
	Send {Esc}
	
	sleep 1500
	
	Send {Click 960, 540, 0}
	
	sleep 1500
	
	Send {Esc}
	
	sleep 1500
	
	Send {MButton}

}

press_enter() {
	Send {Enter down}
	
	sleep 100
	
	Send {Enter up}
}

press_right() {
	Send {right down}
	
	sleep 100
	
	Send {right up}
}