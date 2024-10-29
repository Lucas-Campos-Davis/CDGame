using Godot;
using System;
using System.Linq;
public partial class PlayerVariables : Node
{
	public static PlayerVariables Instance { get; private set; }

	[Export]
	public Vector2 PlayerPosition { get; set; }

	public override void _Ready()
	{
		PlayerPosition = new Vector2(1033, 1018);
		Instance = this;
	}
}
