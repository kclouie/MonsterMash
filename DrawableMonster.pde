/**
 * Class that implements the Drawable version of the Monster class.
 * 
 * @author Kalea Louie
 * @version Program 3
 * @version CPE102-16
 * @version Spring 2015
 */

public class DrawableMonster extends Monster implements Drawable
{
	public DrawableMonster(Maze maze)
	{
		super(maze);
	}
	
	public DrawableMonster(Maze maze, long seed)
	{
		super(maze, seed);
	}
	
	public DrawableMonster(Maze maze, Square location)
	{
		super(maze, location);
	}
	
	public void draw()
	{
                if (super.location().inView() == true)
                {
		  pushMatrix();
                  translate((int)super.location().x() + 25, (int)super.location().y() + 25);
                  stroke(0, 0, 0);
                  fill(244, 149, 25);
                  ellipse(0, 0, 40, 40);  //Head

                  fill(0, 0, 0);  
                  ellipse(-5, 2, 5, 7); //Left Eye
                  ellipse(5, 2, 5, 7); //Right Eye

                  line(-8, -7, 0, -2);
                  line(0, -2, 8, -7);

                  ellipse(0, 12, 8, 5);  //Nose

                  stroke(0, 0, 0);
                  line(0, 12, 15, 5);  //Right-side Whiskers
                  line(0, 12, 18, 12);
                  line(0, 12, 15, 19);
            
                  line(0, 12, 15, 5);  //Lef-side Whiskers
                  line(0, 12, -18, 12);
                  line(0, 12, -15, 19);

                  fill(244, 149, 25);
                  triangle(-10, -24, -15, -10, -2, -15);
                  triangle(10, -24, 15, -10, 2, -15);  
                  popMatrix();  
                }
	}
}
