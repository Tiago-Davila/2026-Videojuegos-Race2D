extends Line2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var linea_poligono = Geometry2D.offset_polyline(points, width/3)
	for poligono in linea_poligono:
		var area = CollisionPolygon2D.new()
		area.polygon = poligono
		$Area2D.add_child(area)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
