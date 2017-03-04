/**
 * Class that contains all the logic to model a Maze with Treasures, Monsters, and an Explorer.
 * 
 * @author Kalea Louie
 * @version Program 3
 * @version CPE102-16
 * @version Spring 2015
 */

import java.util.*;

public class Maze
{
   // named constants
   public static final int ACTIVE = 0;
   public static final int EXPLORER_WIN = 1;
   public static final int MONSTER_WIN = 2;
    
    // instance variables
   private Square[][] squares;
   private ArrayList<RandomOccupant> randOccupants;
   private Explorer explorer;
   private int rows;
   private int cols;

   /**
    * Constructor for objects of class Maze
    */
   public Maze(Square[][] squares, int rows, int cols)
   {
	  this.squares = squares;
	  this.rows = rows;
	  this.cols = cols;
	  this.randOccupants = new ArrayList<RandomOccupant>();
		
   }
	
   // QUERIES
   public Square getSquare(int row, int col) 
   { 
	   return squares[row][col]; 
   }
   
   public int rows() 
   {
	   return rows;
   }
   
   public int cols() 
   {
	   return cols;
   }
   
   public String explorerName() 
   {
	   return explorer.name();
   }
   
   public Explorer getExplorer() 
   {
	   return explorer;
   }
    
   public RandomOccupant getRandomOccupant(int index) 
   {
	   return randOccupants.get(index);
   }
   
   public int getNumRandOccupants() 
   {
	   return randOccupants.size();
   }
	
   // COMMANDS
   public void addRandomOccupant(RandomOccupant ro) 
   {  
	   randOccupants.add(ro);
   }
	
   public void setExplorer(Explorer e) 
   {
	   explorer = e;
   }
	
   public void explorerMove(int key)
   {
      explorer.move(key);
   }
	
   public void randMove()
   {
	  for (RandomOccupant r : randOccupants)
	  {
		  r.move();
	  }
   }
	
   /**
    * Returns the status of the game.
    *
    * If all treasures have been found, return EXPLORER_WIN.
    * If not, check each maze occupant, if it is a Monster and
    *    it is in the same location as the Explorer, return
    *    MONSTER_WIN.  Note that you can use == to check locations, do you know why?
    * Otherwise, return ACTIVE.
    */
   public int gameStatus()
   {
      int status = ACTIVE;
      if (foundAllTreasures() == true)
      {
    	  status = EXPLORER_WIN;
      }
      else for (RandomOccupant r : randOccupants)
      {
    	  if (r instanceof Monster)
    	  {
    		  if (r.location() == explorer.location())
    		  {
    			  status = MONSTER_WIN;
    		  }
    	  }
      }
      return status;
   }
	
   private boolean foundAllTreasures()
   {
      boolean foundAll = true;
      int tCount = 0;
      int foundCount = 0;
      for (RandomOccupant r : randOccupants)
      {
    	  if (r instanceof Treasure)
    	  {
    		  tCount = tCount + 1; 
    		  if (((Treasure)r).found() == true)
    		  {
    			  foundCount = foundCount + 1;
    		  }
    	  }
      }
     if (tCount == foundCount)
     {
    	 return foundAll;
     }
     else
     {
    	 return false;
     }
   }
    
   public void lookAround(Square s)
   {
      int row = s.row();
      int col = s.col();
        
      // Clear what was previously in view
      resetInView();
        
      // Set the current square so that we are viewing it (obviously)
      s.setInView(true);
       
      if (s.wall(0) == false)  //UP
      {
    	  getSquare(row - 1, col).setInView(true);
      }
      if (s.wall(1) == false)  //RIGHT
      {
    	  getSquare(row, col + 1).setInView(true);
      }
      if (s.wall(2) == false)  //DOWN
      {
    	  getSquare(row + 1, col).setInView(true);
      }
      if (s.wall(3) == false)  //LEFT
      {
    	  getSquare(row, col - 1).setInView(true);
      }
      
      
      //FIGURING OUT THE DIAGONALS
      if (row == 0)  //UPPER BOUND
      { 
    	  if (col == 0) //UPPER LEFT CORNER
    	  {
    		  if (s.wall(1) == false && getSquare(row + 1, col + 1).wall(0) == false || s.wall(2) == false && getSquare(row + 1, col + 1).wall(3) == false)  //LOWER RIGHT
    		  {
    			  getSquare(row + 1, col + 1).setInView(true);
    		  }
    	  }
      
    	  else if (col == cols - 1)  //UPPER RIGHT CORNER
    	  {
    		  if (s.wall(2) == false && getSquare(row + 1, col - 1).wall(1) == false || s.wall(3) == false && getSquare(row + 1, col - 1).wall(0) == false) //LOWER LEFT
    		  {
    			  getSquare(row + 1, col - 1).setInView(true);
    		  }
    	  }
    	  
    	  else  //UPPER ROW
    	  {
//    		  if (s.wall(3) == false && getSquare(row - 1, col - 1).wall(2) == false || s.wall(0) == false && getSquare(row - 1, col - 1).wall(1) == false)  //UPPER LEFT
//        	  {
//        		  getSquare(row - 1, col - 1).setInView(true);  
//        	  }
    		  if (s.wall(1) == false && getSquare(row + 1, col + 1).wall(0) == false || s.wall(2) == false && getSquare(row + 1, col + 1).wall(3) == false)  //LOWER RIGHT
        	  {
        		  getSquare(row + 1, col + 1).setInView(true);
        	  }
    	  }
      }
      
      else if (row == rows - 1)  //LOWER BOUND
      {
    	  if (col == cols - 1)  //LOWER RIGHT CORNER
    	  {
    		  if (s.wall(3) == false && getSquare(row - 1, col - 1).wall(2) == false || s.wall(0) == false && getSquare(row - 1, col - 1).wall(1) == false)  //UPPER LEFT
    		  {
    			  getSquare(row - 1, col - 1).setInView(true);  
    		  }
    	  }
      
    	  else if (col == 0)  //LOWER LEFT CORNER
    	  {
    		  if (s.wall(0) == false && getSquare(row - 1, col + 1).wall(3) == false || s.wall(1) == false && getSquare(row - 1, col + 1).wall(2) == false)  //UPPER RIGHT
    		  {
    			  getSquare(row - 1, col + 1).setInView(true);
    		  }
    	  }
    	  
    	  else  //BOTTOM ROW
    	  {
    		  if (s.wall(3) == false && getSquare(row - 1, col - 1).wall(2) == false || s.wall(0) == false && getSquare(row - 1, col - 1).wall(1) == false)  //UPPER LEFT
    		  {
    			  getSquare(row - 1, col - 1).setInView(true);  
    		  }
    		  if (s.wall(0) == false && getSquare(row - 1, col + 1).wall(3) == false || s.wall(1) == false && getSquare(row - 1, col + 1).wall(2) == false)  //UPPER RIGHT
    		  {
    			  getSquare(row - 1, col + 1).setInView(true);
    		  }
    	  }
      }
      
      else if (col == 0)  //LEFT BOUND
      {
    	  if (s.wall(0) == false && getSquare(row - 1, col + 1).wall(3) == false || s.wall(1) == false && getSquare(row - 1, col + 1).wall(2) == false)  //UPPER RIGHT
		  {
			  getSquare(row - 1, col + 1).setInView(true);
		  }
    	  if (s.wall(1) == false && getSquare(row + 1, col + 1).wall(0) == false || s.wall(2) == false && getSquare(row + 1, col + 1).wall(3) == false)  //LOWER RIGHT
    	  {
    		  getSquare(row + 1, col + 1).setInView(true);
    	  }
      }
      
      else if (col == cols - 1)  //RIGHT BOUND
      {
    	  if (s.wall(3) == false && getSquare(row - 1, col - 1).wall(2) == false || s.wall(0) == false && getSquare(row - 1, col - 1).wall(1) == false)  //UPPER LEFT
    	  {
    		  getSquare(row - 1, col - 1).setInView(true);  
    	  }
    	  if (s.wall(2) == false && getSquare(row + 1, col - 1).wall(1) == false || s.wall(3) == false && getSquare(row + 1, col - 1).wall(0) == false) //LOWER LEFT
		  {
			  getSquare(row + 1, col - 1).setInView(true);
		  }
      }
      
      else
      {
    	  if (s.wall(3) == false && getSquare(row - 1, col - 1).wall(2) == false || s.wall(0) == false && getSquare(row - 1, col - 1).wall(1) == false)  //UPPER LEFT
    	  {
    		  getSquare(row - 1, col - 1).setInView(true);  
    	  }
      
    	  if (s.wall(0) == false && getSquare(row - 1, col + 1).wall(3) == false || s.wall(1) == false && getSquare(row - 1, col + 1).wall(2) == false)  //UPPER RIGHT
    	  {
    		  getSquare(row - 1, col + 1).setInView(true);
    	  }

    	  if (s.wall(1) == false && getSquare(row + 1, col + 1).wall(0) == false || s.wall(2) == false && getSquare(row + 1, col + 1).wall(3) == false)  //LOWER RIGHT
    	  {
    		  getSquare(row + 1, col + 1).setInView(true);
    	  }

    	  if (s.wall(2) == false && getSquare(row + 1, col - 1).wall(1) == false || s.wall(3) == false && getSquare(row + 1, col - 1).wall(0) == false) //LOWER LEFT
    	  {
    		  getSquare(row + 1, col - 1).setInView(true);
    	  }
      }     
   }
    
   private void resetInView()
   {
      for (int i = 0; i<rows; i++) {
         for (int j = 0; j<cols; j++) {
            squares[i][j].setInView(false);
         }
      }
   }
}
