extends Control


@onready var carrera: Node2D = $GridContainer/SubViewportContainer/SubViewport/Carrera2D

# estso son los subviewport que dan interfaz al usuario y lo dividimos en las 4 pantllas
@onready var viewPortP1: SubViewport = $GridContainer/SubViewportContainer/SubViewport
@onready var viewPortP2: SubViewport = $GridContainer/SubViewportContainer2/SubViewport
@onready var viewPortP3: SubViewport = $GridContainer/SubViewportContainer3/SubViewport
@onready var viewPortP4: SubViewport = $GridContainer/SubViewportContainer4/SubViewport

# ponemos en variable cada camara de los distintos players
@onready var camaraP1: Camera2D = $GridContainer/SubViewportContainer/SubViewport/Camera2D
@onready var camaraP2: Camera2D = $GridContainer/SubViewportContainer2/SubViewport/Camera2D_P2
@onready var camaraP3: Camera2D = $GridContainer/SubViewportContainer3/SubViewport/Camera2D_P3
@onready var camaraP4: Camera2D = $GridContainer/SubViewportContainer4/SubViewport/Camera2D_P4

# ponemos en variable los autos
@onready var autoP1: CharacterBody2D = carrera.get_node("auto")
@onready var autoP2: CharacterBody2D = carrera.get_node("auto2")
@onready var autoP3: CharacterBody2D = carrera.get_node("auto3")
@onready var autoP4: CharacterBody2D = carrera.get_node("auto4")




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# los viewports restantes ( osea todos los que no son el principal )
	# comparten el mismo mundo/mapa que el principal 
	# esto permite que todos existan en el mismo espacio fisico
	viewPortP2.world_2d = viewPortP1.world_2d
	viewPortP3.world_2d = viewPortP1.world_2d
	viewPortP4.world_2d = viewPortP1.world_2d


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if autoP1:
		camaraP1.global_position = autoP1.global_position
	if autoP2:
		camaraP2.global_position = autoP2.global_position
	if autoP3:
		camaraP3.global_position = autoP3.global_position
	if autoP4:
		camaraP4.global_position = autoP4.global_position
