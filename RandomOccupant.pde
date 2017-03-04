/**
 * A class that extends Occupant to include properties common to all not human-controlled maze occupants.
 * This class knows how to generate a random Square as its initial location and how to move randomly around the Maze.
 * 
 * @author Kalea Louie
 * @version Program 3
 * @version CPE102-16
 * @version Spring 2015
 */

import java.util.Random;

public abstract class RandomOccupant extends Occupant
{
	//Instance Variables
	private Random rand;
	private Maze maze;
	
	//Constructors
	/**
	 * Initializes the maze variable and randomly sets its location in the Maze.
	 * 
	 * @param aMaze a reference to the Maze that it inhabits so that it may locate itself and move about.
	 */
	public RandomOccupant(Maze aMaze) 
	{
		super();
		maze = aMaze;
		rand = new Random();
		Square square = maze.getSquare(rand.nextInt(maze.rows()), rand.nextInt(maze.cols()));
		super.moveTo(square);
	}
	
	/**
	 * Initializes the maze variable, randomly sets its location in the Maze, and specifies a seed to use when constructing the Random number generator.
	 * 
	 * @param aMaze a reference to the Maze that it inhabits so that it may locate itself and move about.
	 * @param seed to be used when constructing the Random number generator
	 */
	public RandomOccupant(Maze aMaze, long seed)
	{
		super();
		maze = aMaze;
		rand = new Random(seed);
		Square square = maze.getSquare(rand.nextInt(maze.rows()), rand.nextInt(maze.cols()));
		super.moveTo(square);
	}
	
	/**
	 * Initializes the maze variable and location of its parent.
	 * 
	 * @param aMaze a reference to the Maze that it inhabits so that it may locate itself and move about.
	 * @param location a reference to the RandomOccupant's initial location
	 */
	public RandomOccupant(Maze aMaze, Square location)
	{
		super(location);
		maze = aMaze;
		rand = new Random();
	}
	
	//Methods
	/**
	 * Method that moves the RandomOccupant in a random fashion.
	 * The move must be legal, however, so that it does not move through any walls in its current location.
	 */
	public void move()
	{
		int row = super.location().row();
		int col = super.location().col();
		int num = rand.nextInt(4);
		
		while (super.location().wall(num) == true)
		{ 
			num = rand.nextInt(4);
		}
		if (num == Square.UP)
		{
			row = row - 1;
		}
			
		else if (num == Square.RIGHT)
		{
			col = col + 1;
		}
			
		else if (num == Square.DOWN)
		{
			row = row + 1;
		}
			
		else if (num == Square.LEFT)
		{
			col = col - 1;
		}
			
		super.moveTo(maze.getSquare(row, col));
	}
}
