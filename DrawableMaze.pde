/**
 * Class that implements the Drawable version of the Maze class.
 * 
 * @author Kalea Louie
 * @version Program 3
 * @version CPE102-16
 * @version Spring 2015
 */

public class DrawableMaze extends Maze implements Drawable
{
	public DrawableMaze(DrawableSquare[][] maze, int rows, int cols)
	{
		super(maze, rows, cols);
	}
	
	public void draw()
	{
                pushMatrix();
                fill(50, 155, 50);
		rect(0, 0, super.cols()*50, super.rows()*50);
                
                for (int i = 0; i < super.rows(); i++)
                {
                    for (int j = 0; j < super.cols(); j++)
                    {
                        ((DrawableSquare)(super.getSquare(i, j))).draw();
                    }
                }

                for (int x = 0; x < super.getNumRandOccupants(); x++)
                {
                    if (super.getRandomOccupant(x) instanceof Treasure)
                    {
                        ((DrawableTreasure)(super.getRandomOccupant(x))).draw();
                    }
                    
                    else if (super.getRandomOccupant(x) instanceof Monster)
                    {
                        ((DrawableMonster)(super.getRandomOccupant(x))).draw();
                    }
                }
                
                ((DrawableExplorer)super.getExplorer()).draw();
                popMatrix();
	}
}
