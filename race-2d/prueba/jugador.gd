extends CharacterBody2D

@export var controles: controlesDelPlayer
@export var velocidad = 300.0

@onready var sprite: Sprite2D = $Sprite2D


func _ready() -> void:
	if controles == null:
		controles = controlesDelPlayer.new()


func _physics_process(_delta: float) -> void:
	var dir = Input.get_vector(controles.movIzq, controles.movDer, controles.aceler, controles.desaceler)
	velocity = dir * velocidad
	if dir != Vector2.ZERO:
		sprite.rotation = dir.angle() + PI / 2
	move_and_slide()
