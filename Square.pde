/**
 * A class specifying a Square in the Maze.
 * 
 * @author Kalea Louie
 * @version Program 3
 * @version CPE102-16
 * @version Spring 2015
 */


public class Square 
{
	//Constants
	public static final int SQUARE_SIZE = 50; //# of pixels per square
	public static final int UP = 0;
	public static final int RIGHT = 1;
	public static final int DOWN = 2;
	public static final int LEFT = 3;
	
	//Instance Variables
	private boolean[] hasWalls = new boolean[4];
	private boolean seen;
	private boolean inView;
	private int row;
	private int col;
	private Treasure treasure;
	
	//Constructor
	/**
	 * Creates a square in the maze. 
	 * 
	 * @param up the boolean value to represent the upper wall of the Square
	 * @param right the boolean value to represent the right wall of the Square
	 * @param down the boolean value to represent the lower wall of the Square
	 * @param left the boolean value to represent the left wall of the Square
	 * @param aRow the row of the current Square's location
	 * @param aCol the column of the Square's location
	 */
	public Square(boolean up, boolean right, boolean down, boolean left, int aRow, int aCol)
	{
		hasWalls[0] = up;
		hasWalls[1] = right;
		hasWalls[2] = down;
		hasWalls[3] = left;
		row = aRow;
		col = aCol;
		seen = false;
		inView = false;
		treasure = null;
	}
	
	//Methods
	/**
	 * Method that queries for a wall in the given direction.
	 * 
	 * @param direction the direction of the wall as specified by a 0, 1, 2, or 3.
	 * @return boolean specifying whether or not there is a wall in that direction
	 */
	public boolean wall(int direction)
	{
		return hasWalls[direction];
	}
	
	/**
	 * Method that queries for whether not the Square has been seen.
	 * 
	 * @return the boolean value specifying whether or not the Square has been seen
	 */
	public boolean seen()
	{
		return seen;
	}
	
	/**
	 * Method that queries for whether or not the Square is currently in view.
	 * 
	 * @return the boolean value specifying whether or not the Square is in view
	 */
	public boolean inView()
	{
		return inView;
	}
	
	/**
	 * Method that queries for the row of the current Square.
	 * 
	 * @return the row of the current Square
	 */
	public int row()
	{
		return row;
	}
	
	/**
	 * Method that queries for the column of the current Square.
	 * 
	 * @return the column of the current Square
	 */
	public int col()
	{
		return col;
	}
	
	/**
	 * Method that queries for whether or not a treasure is present in that Square.
	 * 
	 * @return the boolean value for whether or not that Square holds a treasure
	 */
	public Treasure treasure()
	{
		return treasure;
	}
	
	/**
	 * Method that queries for the x-value (in pixels) of the upper left corner of the Square. 
	 * 
	 * @return the x-value (in pixels) of the Square's upper left corner, as determined by using the SQUARE_SIZE, row and/or column
	 */
	public int x()
	{
		return SQUARE_SIZE * col;
	}
	
	/**
	 * Method that queries for the y-value (in pixels) of the upper left corner of the Square.
	 * 
	 * @return the y-value (in pixels) of the Square's upper left corner, as determined by using the SQUARE_SIZE, row and/or column
	 */
	public int y()
	{
		return SQUARE_SIZE * row;
	}
	
	/**
	 * A command to tell the Square that it is currently in view of the Explorer.
	 * 
	 * @param inView the boolean value representing the current "in-view" state of the Square
	 */
	public void setInView(boolean isInView)
	{
		inView = isInView;
		if (inView == true)
		{
			seen = true;
		}
	}
	
	/**
	 * Method that sets the treasure reference to the parameter t.
	 * 
	 * @param t the treasure reference to be set
	 */
	public void setTreasure(Treasure t)
	{
		treasure = t;
	}
	
	/**
	 * A command to tell the Square that the Explorer has entered it. 
	 * If the square contains a Treasure, invoke the treasure's setFound() method.
	 */
	public void enter()
	{
                seen = true;
                inView = true;
		if (treasure != null)
		{
			treasure.setFound();
		}
	}
}
