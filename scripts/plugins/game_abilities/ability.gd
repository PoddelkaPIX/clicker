class_name AbilityRes extends Resource
#signal canceled
#signal state_executed()
#signal state_stoped()
#
#signal state_ready_entered()
#signal state_ready_exited()
#signal state_preparation_entered()
#signal state_preparation_exited()
#signal state_execution_entered()
#signal state_execution_exited()
#signal state_recovery_entered()
#signal state_recovery_exited()
#signal state_cooldown_entered()
#signal state_cooldown_exited()

#enum EInputMode { ONE_PRESS, HOLD_PRESS }
#
#@export_multiline var description: String = ''
#@export var icon: CompressedTexture2D
#@export var scene: PackedScene
#
#@export_category('Timings')
#@export var cooldown_time: float = 0.2
#
#@export_category("Cost")
#@export var enegry: float = 0
#@export var mana: float = 0
#
#@export_category('Input')
#@export var input_mode: EInputMode = EInputMode.ONE_PRESS
#@export var is_cancelable: bool = true
#@export_category('Timings')
#@export var preparation_time: float = 0.1
#@export var execution_time: float = 0.01
#@export var recovery_time: float = 0.1
#@export var cancel_time: float = 0.2
#@export_category('Additionally')
#@export var key = 'm_1'
