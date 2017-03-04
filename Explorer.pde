
/**
 * A class that extends Occupant to model an Explorer.
 * 
 * @author Kalea Louie
 * @version Program 3
 * @version CPE102-16
 * @version Spring 2015
 */

public class Explorer extends Occupant 
{
	//Instance Variables
	private String name;
	private Maze maze;
	
	//Constructors
	/**
	 * Creates an Explorer that takes in a Sqare, a Maze, and a String as parameters.
	 * 
	 * @param location the Square in the Maze where the Explorer is located 
	 * @param aMaze the reference to the Maze that the Explorer inhabits 
	 * @param aName the name of the Explorer
	 */
	public Explorer(Square location, Maze aMaze, String aName) 
	{
		super(location);
		maze = aMaze;
		name = aName;
		maze.lookAround(location);
	}
	
	//Methods
	/**
	 * Method that queries for the Explorer's name.
	 * 
	 * @return the name of the Explorer
	 */
	public String name()
	{
		return name;
	}
	
	/**
	 * A command to move the Explorer through the Maze in the direction indicated by a key press from the user.
	 * 
	 * @param key the key press given by the user 
	 */
	public void move(int key)
	{
		int row = super.location().row();
		int col = super.location().col();   

			if (key == 38 || key == 224) //UP
			{
				if (super.location().wall(Square.UP) == false)
				{
					moveTo(maze.getSquare(row - 1, col));	
				}
			}
			else if (key == 39 || key == 227) //RIGHT
			{
				if (super.location().wall(Square.RIGHT) == false)
				{
					moveTo(maze.getSquare(row, col + 1));
				}
			}
			else if (key == 40 || key == 225) //DOWN
			{
				if (super.location().wall(Square.DOWN) == false)
				{
					moveTo(maze.getSquare(row + 1, col));
				}
			}
			else if (key == 37 || key == 226) //LEFT
			{
				if (super.location().wall(Square.LEFT) == false)
				{
					moveTo(maze.getSquare(row, col - 1));
				}
   }

	}
	
	/**
	 * A command that moves the Explorer to another Square in the Maze. 
	 * The actual moving is done via its parent's moveTo() method and.
	 * Must also call the enter() method from the Square class to tell the Square that Explorer has entered.
	 * Finally, inform the Maze that the Explorer would like to lookAround() from the newly entered Square.
	 */
	public void moveTo(Square s)
	{
		super.moveTo(s);
		s.enter();
		maze.lookAround(s);
	}
}
