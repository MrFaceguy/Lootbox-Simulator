class_name Reward extends TextureRect

@export var compendium : Control
var image : String
var item_name : String
var importsNumber : int
var imports : Array



# Called when the node enters the scene tree for the first time.
func _ready():
	importsNumber = randi_range(0, compendium.itemDictionary.size() - 1)
	imports = compendium.itemDictionary[importsNumber]
	item_name = imports[0]
	image = imports[1]
	texture = load(image)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass
