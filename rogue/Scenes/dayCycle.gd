extends ColorRect

var day_duration = 30 # day duration in seconds
var night_duration = 30 # night duration in seconds
var current_duration = 0;

var is_day = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func turnNight():
	while color.a <= 0.9:
		color.a += 1
		
func turnDay():
	while color.a >= 0.1:
		color.a -= 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_duration += 1;
	if current_duration == day_duration && is_day:
		turnNight();
		is_day = false;
	if is_day == false && current_duration == night_duration:
		turnDay()
		is_day = true;
