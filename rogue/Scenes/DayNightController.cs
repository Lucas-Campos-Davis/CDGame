using Godot;
using System;
public partial class DayNightController : CanvasModulate
{
	public float time = 0.0f;
	private const int MINUTES_PER_DAY = 1440;
	private const int MINUTES_PER_HOUR = 60;
	private const float INGAME_TO_REAL_MINUTE_DURATION = (2 * Mathf.Pi) / MINUTES_PER_DAY;
	public delegate void TimeTickEventHandler(int day, int hour, int minute);
	public event TimeTickEventHandler TimeTick;
	[Export]
	GradientTexture1D _gradientTexture;
	[Export]
	float INGAME_SPEED = 20.0f;
	[Export]
	int INITIAL_HOUR = 12;
	int past_minute = -1;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		time = WorldVariables.Instance.Time;
		//time = INGAME_TO_REAL_MINUTE_DURATION * MINUTES_PER_HOUR * INITIAL_HOUR;
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		time += (float)delta * (float)INGAME_TO_REAL_MINUTE_DURATION * INGAME_SPEED;
	
		var value = (Mathf.Sin(time - Mathf.Pi / 2.0f) + 1.0f) / 2.0f;
		Color = _gradientTexture.Gradient.Sample((float)value);
	
		RecalculateTime();
	}

	private void RecalculateTime()
	{
		var total_minutes = Mathf.FloorToInt(time / INGAME_TO_REAL_MINUTE_DURATION);

		var day = total_minutes / MINUTES_PER_DAY;

		var current_day_minutes = total_minutes % MINUTES_PER_DAY;

		var hour = current_day_minutes / MINUTES_PER_HOUR;
		var minute = current_day_minutes % MINUTES_PER_HOUR;

		if (past_minute != minute)
		{
			past_minute = minute;
			TimeTick(day, hour, minute);
		}
	}
}
