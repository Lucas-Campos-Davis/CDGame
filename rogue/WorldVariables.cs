using Godot;
using System;
using System.Linq;
public partial class WorldVariables : Node
{
	public static WorldVariables Instance { get; private set; }

	[Export]
	public float Time { get; set; }

	public override void _Ready()
	{
		Instance = this;
        Time = 0f;
	}
}
