extends Node


func time_to_string(_time: float) -> String:
	var mins = 0
	var secs = 0

	while true:
		if _time >= 60:
			mins += 1
			_time -= 60
		else:
			break
	secs = int(_time)

	var secs_text = "00"
	var mins_text = '00'

	if int(secs) < 10:
		secs_text = '0'+str(secs)
	else:
		secs_text = str(secs)
		
	if mins < 10:
		mins_text = '0'+str(mins)
	else:
		mins_text = str(mins)
	
	return mins_text + ':' + secs_text
