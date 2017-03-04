
/**
 * A class that extends RandomOccupant to model a Treasure.
 * Treasures begin the game in a random location, although they may also be placed in a specific location in the Maze. 
 * However, they may not move about the Maze.
 * Note: The random initial placement is taken care of by the Treasure's parent class, RandomOccupant. 
 * 
 * @author Kalea Louie
 * @version Program 3
 * @version CPE102-16
 * @version Spring 2015
 */

public class Treasure extends RandomOccupant
{
	//Instance Variables
	private boolean found;
	
	//Constructor
	/**
	 * Constructor to randomly locate itself in the Maze.
	 * 
	 * @param maze a reference to the maze that the Treasure inhabits
	 */
	public Treasure(Maze maze) 
	{
		super(maze);		
		found = false;
		super.location().setTreasure(this);		
	}
	
	/**
	 * Constructor to randomly locate itself in the Maze using a seed.
	 * 
	 * @param maze a reference to the maze that the Monster inhabits
	 * @param seed to be used for the Random class
	 */
	public Treasure(Maze maze, long seed)
	{
		super(maze, seed);
		found = false;
		super.location().setTreasure(this);
	}
	
	/**
	 * Constructor to generate a Treasure in a specified location in the Maze. 
	 * 
	 * @param maze a reference to the maze that the Monster inhabits
	 * @param location the specified Square in which the Monster will be placed
	 */
	public Treasure(Maze maze, Square location)
	{
		super(maze, location);
		found = false;
		super.location().setTreasure(this);
	}
	
	//Methods
	/**
	 * A method that queries for the found value.
	 * 
	 * @return the found boolean value
	 */
	public boolean found()
	{
		return found;
	}
	
	/**
	 * A method that sets the found value to true.
	 */
	public void setFound()
	{
		found = true;
	}
	
	/**
	 * A method that overrides the move method of RandomOccupant so that it does nothing.
	 * Note: A Treasure may still be moved via the moveTo() method, but cannot move itself randomly about the Maze.
	 */
	public void move()
	{
		
	}
}
