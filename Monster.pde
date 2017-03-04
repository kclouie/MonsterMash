/**
 * A class that extends RandomOccupant to model a Monster. 
 * Monsters can begin in a random location, or be placed in a specific location in the Maze.
 * Monsters move randomly about the Maze.
 * If they run into the Explorer, the Explorer dies and the game is over. 
 * 
 * The purpose of this class is to be able to differentiate between other RandomOccupants that do not kill Explorers and to extend to the DrawableMonster class.
 * Note: The random initial placement and random movement is taken care of by the Monster's parent class, RandomOccupant. 
 * 
 * @author Kalea Louie
 * @version Program 3
 * @version CPE102-16
 * @version Spring 2015
 */

public class Monster extends RandomOccupant
{
	//Constructors
	/**
	 * Constructor to randomly locate itself in the Maze
	 * 
	 * @param maze a reference to the maze that the Monster inhabits
	 */
	public Monster(Maze maze) 
	{
		super(maze);
	}
	
	/**
	 * Constructor to randomly locate itself in the Maze with a seed for the Random class.
	 * 
	 * @param maze a reference to the maze that the Monster inhabits
	 * @param seed to be used for the Random class
	 */
	public Monster(Maze maze, long seed)
	{
		super(maze, seed);
	}
	
	/**
	 * Constructor to generate a Monster in a specified location in the Maze.
	 * 
	 * @param maze a reference to the maze that the Monster inhabits
	 * @param location the specified Square in which the Monster will be placed
	 */
	public Monster(Maze maze, Square location)
	{
		super(maze, location);
	}

}
