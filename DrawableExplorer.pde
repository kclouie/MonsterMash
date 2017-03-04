/**
 * Class that implements the Drawable version of the Explorer class.
 * 
 * @author Kalea Louie
 * @version Program 3
 * @version CPE102-16
 * @version Spring 2015
 */

public class DrawableExplorer extends Explorer implements Drawable
{
	public DrawableExplorer(Square location, Maze maze, String name)
	{
		super(location, maze, name);
	}
	
	public void draw()
	{
		pushMatrix();
                translate(super.location().x(), super.location().y());
                noStroke();
                fill(91, 91, 91);
                ellipse(25, 30, 25, 30); //Head
                ellipse(34, 15, 15, 15);  //Right Ear
                ellipse(16, 15, 15, 15);  //Left Ear
                fill(249, 178, 178);
                ellipse(34, 15, 10, 10);
                ellipse(16, 15, 10, 10);
                
                fill(0);
                ellipse(28, 29, 3, 5);  //Right Eye
                ellipse(22, 29, 3, 5);  //Left Eye
                ellipse(25, 39, 5, 4);  //Nose
                
                stroke(0);
                line(25, 39, 37, 35);  //Right Whiskers
                line(25, 39, 37, 43);
                
                line(25, 39, 13, 35);
                line(25, 39, 13, 43);
                
                popMatrix();
	}
}
