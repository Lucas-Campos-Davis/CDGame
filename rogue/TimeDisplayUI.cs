using Godot;
using System;
using System.Linq;
public partial class TimeDisplayUI : Control
{
	Label _dayLabel;
	Label _timeLabel;
	TextureRect _arrow;
	public override void _Ready()
	{
		_dayLabel = (Label)FindChild("DayLabel");
		_timeLabel = (Label)FindChild("TimeLabel");
		_arrow = (TextureRect)FindChild("Arrow");
	}
	public void SetDaytime(int day, int hour, int minute)
	{
		_dayLabel.Text = "Day " + (day + 1);
		_timeLabel.Text = AM_FMHour(hour) + ":" + Minute(minute) + " " + AM_PM(hour);
		if(hour <= 12)
		{
			_arrow.RotationDegrees = RemapRangeF(hour, 0, 12, 180, 0);
		}
		else
		{
		  	_arrow.RotationDegrees = RemapRangeF(hour, 13, 23, 0, 180);
		}
	}
	public void SetDaytime(Vector3I _timeVector)
	{
		SetDaytime(_timeVector.X, _timeVector.Y, _timeVector.Z);
	}
	private string AM_FMHour(int hour)
	{
		if(hour == 0)
		{
			return "12";
		}
		if(hour > 12)
		{
			return (hour -12).ToString();
		}
		return hour.ToString();
	}

	private string Minute(int minute)
	{
		if(minute < 10)
		{
			return "0" + minute.ToString();
		}
		return minute.ToString();
	}
	private string AM_PM(int hour)
	{
		if(hour < 12)
		{
			return "am";
		}
		else
		{
			return "pm";
		}
	}
	private float RemapRangeF(float input, float minInput, float maxInput, float minOutput, float maxOutput)
	{
		return (input - minInput) / (maxInput - minInput) * (maxOutput - minOutput) + minOutput;
	}
}
