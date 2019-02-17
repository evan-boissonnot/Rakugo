extends VBoxContainer

func _ready() -> void:
	$Slider.connect("value_changed", self, "on_change_value")
	connect("visibility_changed", self, "on_visibility_changed")

func on_change_value(value : float) -> void:
	var new_value = abs(1 - value/100) * Ren.get_value("auto_time")
	Ren.set_var("text_time", new_value)

func on_toggle(value : bool) -> void:
	if value:
		on_change_value(0)
	else:
		on_change_value(1)

func on_visibility_changed() -> void:
	if visible == false:
		return
	
	on_change_value(Ren.get_value("text_time"))