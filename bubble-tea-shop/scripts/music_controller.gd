extends Node

@export var day_themes: Array[AudioStream]

@onready var music_player = $MusicPlayer
@onready var percussion_animator = $MusicPlayer/PercussionAnimator

func _set_day_music(day_index: int):
	music_player.stream = day_themes[clamp(day_index, 0, day_themes.size()-1)]
	music_player.play(0)

func _enter_prep_station():
	percussion_animator.play("fade_in")

func _exit_prep_station():
	percussion_animator.play_backwards("fade_in")
