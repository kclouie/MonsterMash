/**
 * Class that implements the Drawable version of the Square class.
 * 
 * @author Kalea Louie
 * @version Program 3
 * @version CPE102-16
 * @version Spring 2015
 */

public class DrawableSquare extends Square implements Drawable
{
	public DrawableSquare(boolean up, boolean right, boolean down, boolean left, int row, int col)
	{
		super(up, right, down, left, row, col);
	}
	
	public void draw()
	{
//                pushMatrix();
//                noStroke();
		if (super.seen() == true)
                {
                    if (super.inView() == true)
                    {
                        fill(87, 185, 71);
                        rect(super.x(), super.y(), 50, 50);
                    }
                    else if (super.inView() == false)
                    {
                        fill(145, 203, 125);
                        rect(super.x(), super.y(), 50, 50);
                    }
//                   
//                
//                    if (super.wall(0) == true)
//                    {                    
//                        fill(141, 81, 3);
//                        rect(super.x(), super.y() - 1, 50, 2);
//                    }
//                
//                    if (super.wall(1) == true)
//                    {
//                        fill(141, 81, 3);
//                        rect(super.x() + 49, super.y(), 2, 50);
//                    }
//                
//                    if (super.wall(2) == true)
//                    {
//                        fill(141, 81, 3);
//                        rect(super.x(), super.y() + 49, 50, 2);
//                    }
//                
//                    if (super.wall(3) == true)
//                    {  
//                        fill(141, 81, 3);
//                        rect(super.x() - 1, super.y(), 2, 50);
//                    }

                      fill(13, 68, 22);
                      noStroke();
                      if (super.wall(0) == true)
                      {
                        ellipse(super.x() + 5, super.y(), 10, 6);
                        ellipse(super.x() + 15, super.y(), 10, 6);
                        ellipse(super.x() + 25, super.y(), 10, 6);
                        ellipse(super.x() + 35, super.y(), 10, 6);
                        ellipse(super.x() + 45, super.y(), 10, 6);
                      }
                      
                      if (super.wall(1) == true)
                      {
                        ellipse(super.x() + 50, super.y() + 5, 6, 10);
                        ellipse(super.x() + 50, super.y() + 15, 6, 10);
                        ellipse(super.x() + 50, super.y() + 25, 6, 10);
                        ellipse(super.x() + 50, super.y() + 35, 6, 10);
                        ellipse(super.x() + 50, super.y() + 45, 6, 10);
                      }
                      
                      if (super.wall(2) == true)
                      {
                        ellipse(super.x() + 5, super.y() + 50, 10, 6);
                        ellipse(super.x() + 15, super.y() + 50, 10, 6);
                        ellipse(super.x() + 25, super.y() + 50, 10, 6);
                        ellipse(super.x() + 35, super.y() + 50, 10, 6);
                        ellipse(super.x() + 45, super.y() + 50, 10, 6);
                      }
                      
                      if (super.wall(3) == true)
                      {
                        ellipse(super.x(), super.y() + 5, 6, 10);
                        ellipse(super.x(), super.y() + 15, 6, 10);
                        ellipse(super.x(), super.y() + 25, 6, 10);
                        ellipse(super.x(), super.y() + 35, 6, 10);
                        ellipse(super.x(), super.y() + 45, 6, 10);
                      }
                }
               // popMatrix();
	}
}
