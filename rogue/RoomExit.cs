using Godot;
using System;
using System.Linq;
using System.Threading.Tasks;

public partial class RoomExit : Area2D
{
	[Export]
	String GO_TO_ROOM = "";
	
	[Export]
	Vector2 NEW_PLAYER_POSITION = new Vector2();

	CharacterBody2D _player;
	DayNightController _canvasModulate;

	ColorRect _sceneTransitionColor;
	AnimationPlayer _sceneTransitionPlayer;
	PackedScene _gotoScene;
	public override void _Ready()
	{
		_player = (CharacterBody2D)GetParent().GetParent().FindChild("player");
		_canvasModulate = (DayNightController)GetParent().GetParent().FindChild("CanvasModulate");
		_sceneTransitionColor = (ColorRect)GetParent().GetParent().FindChild("ColorRect");
		_sceneTransitionPlayer = (AnimationPlayer)_sceneTransitionColor.FindChild("AnimationPlayer");
		_gotoScene = GD.Load<PackedScene>(GO_TO_ROOM);
	}

	public override async void _Process(double delta)
	{
		if(OverlapsBody(_player))
		{
			PlayerVariables.Instance.PlayerPosition = NEW_PLAYER_POSITION;
			WorldVariables.Instance.Time = _canvasModulate.time;
			_sceneTransitionPlayer.Play("fade_to_black");
			await transitionScene();
			_sceneTransitionPlayer.Play("keep_black");
			GetTree().ChangeSceneToPacked(_gotoScene);
		}
	}
	
	private async Task transitionScene()
	{
		await ToSignal(GetTree().CreateTimer(0.5), "timeout");
	}
}
