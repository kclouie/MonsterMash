/**
 * Class that implements the Drawable version of the Treasure class.
 * 
 * @author Kalea Louie
 * @version Program 3
 * @version CPE102-16
 * @version Spring 2015
 */

public class DrawableTreasure extends Treasure implements Drawable
{
	public DrawableTreasure(Maze maze)
	{
		super(maze);
	}
	
	public DrawableTreasure(Maze maze, long seed)
	{
		super(maze, seed);
	}
	
	public DrawableTreasure(Maze maze, Square location)
	{
		super(maze, location);
	}
	
	public void draw()
	{
                if (super.location().seen() == true)
                {
                  if (super.found() == false)
                  {
		    pushMatrix();
                    translate(super.location().x(), super.location().y());
                    noStroke();
                    fill(246, 218, 7);
                    rect(5, 5, 40, 40);
                    fill(243, 160, 30);
                    ellipse(16, 16, 18, 18);  //Big
                    ellipse(36, 20, 10, 10);  //Mini
                    ellipse(25, 34, 12, 12);  //Medium
                    popMatrix();
                  }
                
                else if (super.found() == true)
                  {
                    pushMatrix();
                    translate(super.location().x(), super.location().y());
                    noStroke();
                    fill(209, 210, 207);
                    rect(5, 5, 40, 40);
                    fill(160, 159, 159);
                    ellipse(16, 16, 18, 18);  //Big
                    ellipse(36, 20, 10, 10);  //Mini
                    ellipse(25, 34, 12, 12);  //Medium
                    popMatrix(); 
                  }
                }
	}
}
