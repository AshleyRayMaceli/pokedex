import org.sql2o.*;
import org.junit.*;
import static org.junit.Assert.*;
import java.util.Arrays;
import java.util.List;

public class MoveTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void Move_instantiatesCorrectly_true() {
    Move myMove = new Move("Splash");
    assertEquals(true, myMove instanceof Move);
  }

  @Test
  public void getName_moveInstantiatesWithName_String() {
    Move myMove = new Move("Solar Beam");
    assertEquals("Solar Beam", myMove.getName());
  }

  @Test
  public void all_emptyAtFirst() {
    assertEquals(Move.all().size(), 0);
  }

  @Test
  public void equals_returnsTrueIfMovesAreTheSame_true() {
    Move firstMove = new Move("Confuse");
    Move secondMove = new Move("Confuse");
    assertTrue(firstMove.equals(secondMove));
  }

  @Test
  public void save_savesMoveCorrectly_1() {
    Move newMove = new Move("Panic! at the Disco");
    newMove.save();
    assertEquals(1, Move.all().size());
  }

  @Test
  public void find_findsMoveInDatabase_true() {
    Move myMove = new Move("Slam");
    myMove.save();
    Move savedMove = Move.find(myMove.getId());
    assertTrue(myMove.equals(savedMove));
  }
}
