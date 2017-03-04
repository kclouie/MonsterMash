/**
 * An abstract class that includes properties common to all Maze occupants.
 * 
 * @author Kalea Louie
 * @version Program 3
 * @version CPE102-16
 * @version Spring 2015
 */

public abstract class Occupant 
{
	//Instance variables
	private Square location;
	
	//Constructors
	/**
	 * Default constructor that does not initialize anything.
	 */
	public Occupant()
	{
		
	}
	
	/**
	 * Creates an Occupant that accepts a Square argument to initialize the Occupant's location.
	 * 
	 * @param start the Square object that initializes that Occupant's location
	 */
	public Occupant(Square start)
	{
		location = start;
	}
	
	//Methods
	/**
	 * Method that queries for the Occupant's location.
	 * 
	 * @return the Occupant's current location
	 */
	public Square location()
	{
		return location;
	}
	
	/**
	 * A command that changes the Occupant's location.
	 * 
	 * @param newLoc Square to which the Occupant will be moved
	 */
	public void moveTo(Square newLoc)
	{
		location = newLoc;
	}
}
