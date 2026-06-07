extends Node
# Game Manager
# A global script for storing global settings

# Go to Project -> Project Settings; Globals -> Autoload
# Add your script and give it a name (e.g. GameManager)
# It's now accessible globally from any script

# Access it directly by the name you gave it in Autoload
# GameManager.add_score(10)
# print(GameManager.score)

# The Autoload node is added to the root of the scene tree automatically on startup, before any other scene loads.
# It persists across scene changes, making it ideal for game state, settings, audio management, etc.
# You can use extends Node for pure logic, or extends Node2D / other types if you need scene capabilities.
# You can have multiple Autoloads — one for each concern (e.g. GameManager, AudioManager, SaveManager).

var score := 0
var player_health := 100
var _mutex := Mutex.new()	# Use Mutex to make it thread safe. Remove the Mutex if you only run single threaded.

func add_score(points: int) -> void:
	_mutex.lock()
	score += points
	_mutex.unlock()
	print("Score: ", score)

func reset() -> void:
	_mutex.lock()
	score = 0
	player_health = 100
	_mutex.unlock()
