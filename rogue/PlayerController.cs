using Godot;
using System;
using System.Linq;
namespace Prog;


public partial class PlayerController : CharacterBody2D
{
	public const float Speed = 40.0f;
	Vector2 PlayerVelocity = new();
	Node FoliageTileNode;
	Vector2 HarvestPosition;
	Vector2I[] HarvestCells;
	AnimatedSprite2D PlayerAnimations;
	AnimatedSprite2D Silhouette;
	int PreviousFrame;
	Camera2D _gameCamera;

	public override void _Ready()
	{
		Position = PlayerVariables.Instance.PlayerPosition;
		_gameCamera = (Camera2D)FindChild("gameCamera");
		_gameCamera.ForceUpdateScroll();
		_gameCamera.ResetSmoothing();
	}
	public void StopAnimationOnStopped()
	{
		if(GetRealVelocity().Y == 0 && GetRealVelocity().X == 0)
		{
			if(PlayerAnimations.Frame == 0 || PlayerAnimations.Frame == 4)
			{
				PlayerAnimations.Stop();
			}
			if(Silhouette.Frame == 0 || Silhouette.Frame == 4)
			{
				Silhouette.Stop();
			}
		}
	}
	public void UpdateAnimation(string _animationName)
	{
		PlayerAnimations.Play(_animationName);
		Silhouette.Play(_animationName);
		StopAnimationOnStopped();
	}
	public void GetInput()
	{
		PlayerAnimations = (AnimatedSprite2D)FindChild("player_animations");
		Silhouette = (AnimatedSprite2D)FindChild("silhouette");
		if (Input.IsActionPressed("right"))
		{
			PlayerVelocity.X = 1;

			if(!Input.IsActionPressed("up") && !Input.IsActionPressed("down"))
			{
				UpdateAnimation("walk_right");
			}
		}
		if (Input.IsActionPressed("left"))
		{
			PlayerVelocity.X = -1;

			if (!Input.IsActionPressed("up") && !Input.IsActionPressed("down"))
			{
				UpdateAnimation("walk_left");
			}
		}
		if (!Input.IsActionPressed("left") && !Input.IsActionPressed("right"))
		{
			PlayerVelocity.X = 0;
		}
		if (Input.IsActionPressed("down"))
		{
			PlayerVelocity.Y = 1;
			UpdateAnimation("walk_down");
		}
		if (Input.IsActionPressed("up"))
		{
			PlayerVelocity.Y = -1;
			UpdateAnimation("walk_up");
		}
		if (!Input.IsActionPressed("up") && !Input.IsActionPressed("down"))
		{
			PlayerVelocity.Y = 0;
		}
		PlayerVelocity = PlayerVelocity.Normalized() * Speed;
		StopAnimationOnStopped();
		if(Input.IsActionJustPressed("interact"))
		{
			FoliageTileNode = GetParent().FindChild("tall-foliage",false, false);
			TileMap foliageTileMap = (TileMap)FoliageTileNode;
			TileSet.CellNeighbor[] tileMapDirections = {TileSet.CellNeighbor.RightCorner, // array of possible neighbors for the isometric foliage grid
														TileSet.CellNeighbor.BottomRightSide,
														TileSet.CellNeighbor.BottomCorner,
														TileSet.CellNeighbor.BottomLeftSide,
														TileSet.CellNeighbor.LeftCorner,
														TileSet.CellNeighbor.TopLeftSide,
														TileSet.CellNeighbor.TopCorner,
														TileSet.CellNeighbor.TopRightSide};
			Vector2 HarvestPosition = Position;
			AnimatedSprite2D player_animations = (AnimatedSprite2D)FindChild("player_animations");
			Vector2I _harvestMapPosition = foliageTileMap.LocalToMap(HarvestPosition);
			switch(player_animations.Animation) // we want to detect the cells in front of where the player is facing
			{
				case "walk_down":
					HarvestPosition.Y -= 4;
					break;
				case "walk_up":
					HarvestPosition.Y += 4;
					break;
				case "walk_left":
					HarvestPosition.X -= 4;
					break;
				case "walk_right":
					HarvestPosition.X += 4;
					break;
			}
			for(int i = 0; i < tileMapDirections.Length; i++)
			{
				foliageTileMap.SetCell(0, (foliageTileMap.GetNeighborCell(_harvestMapPosition, tileMapDirections[i])), 0, new Vector2I(0,0), 15);
			}
			foliageTileMap.SetCell(0, _harvestMapPosition, 0, new Vector2I(0,0), 15);
		}
	}
	public override void _PhysicsProcess(double delta)
	{
		GetInput();
		Velocity = PlayerVelocity;
		MoveAndSlide();
	}
}
