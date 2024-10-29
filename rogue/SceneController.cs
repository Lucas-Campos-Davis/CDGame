using Godot;
using System;
using System.Linq;
using System.Threading.Tasks;


public partial class SceneController : Node2D
{
	CanvasLayer _canvasLayer;
	DayNightController _canvasModulate;
	TimeDisplayUI _ui;

	ColorRect _sceneTransitionColor;
	AnimationPlayer _sceneTransitionPlayer;

	public override void _Ready()
	{
		_canvasLayer = (CanvasLayer)FindChild("CanvasLayer");
		_canvasModulate = (DayNightController)FindChild("CanvasModulate");
		_ui = (TimeDisplayUI)_canvasLayer.FindChild("DayNightCycleUI");

		_sceneTransitionColor = (ColorRect)_canvasLayer.FindChild("ColorRect");
		_sceneTransitionPlayer = (AnimationPlayer)_sceneTransitionColor.FindChild("AnimationPlayer");

		_canvasLayer.Visible = true;
 		_canvasModulate.TimeTick += _ui.SetDaytime;
		_sceneTransitionPlayer.Play("fade_to_normal");
	}
}


