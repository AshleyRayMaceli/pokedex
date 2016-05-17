// import org.sql2o.*;
// import org.junit.*;
// import static org.junit.Assert.*;
// import java.util.Arrays;
// import java.util.List;
//
// public class CustomPokemonTest {
//
//   @Rule
//   public CustomDatabaseRule customdatabase = new CustomDatabaseRule();
//
//   @Test
//   public void customAll_emptyAtFirst() {
//     assertEquals(CustomPokemon.customAll().size(), 0);
//   }
//
//   @Test
//   public void customSave_savesPokemonCorrectly_1() {
//     CustomPokemon newPokemon = new CustomPokemon("Chester", "Psychic", "None", "A cute pumpkin dog that holds your stuff!", 25.0, 12, 16, false);
//     newPokemon.customSave();
//     assertEquals(1, CustomPokemon.customAll().size());
//   }
//
//   @Test
//   public void customFind_findsPokemonInDatabase_true() {
//     CustomPokemon myPokemon = new CustomPokemon("Squirtle", "Water", "None", "A cute turtle", 50.0, 12, 16, false);
//     myPokemon.customSave();
//     CustomPokemon savedPokemon = CustomPokemon.customFind(myPokemon.getId());
//     assertTrue(myPokemon.equals(savedPokemon));
//   }
//
//   @Test
//   public void customEquals_returnsTrueIfCustomPokemonAreTheSame_true() {
//     CustomPokemon firstCustomPokemon = new CustomPokemon("Squirtle", "Water", "None", "A cute turtle", 50.0, 12, 16, false);
//     CustomPokemon secondCustomPokemon = new CustomPokemon("Squirtle", "Water", "None", "A cute turtle", 50.0, 12, 16, false);
//     assertTrue(firstCustomPokemon.equals(secondCustomPokemon));
//   }
//
//   @Test
//   public void addCustomMove_addCustomMoveToCustomPokemon() {
//     CustomMove myCustomMove = new CustomMove("Punch");
//     myCustomMove.save();
//     CustomPokemon myPokemon = new CustomPokemon("Squirtle", "Water", "None", "A cute turtle", 50.0, 12, 16, false);
//     myPokemon.save();
//     myPokemon.addCustomMove(myCustomMove);
//     CustomMove savedCustomMove = myPokemon.getCustomMoves().get(0);
//     assertTrue(myCustomMove.equals(savedCustomMove));
//   }



  // @Test
  // public void customDelete_deleteAllPokemonAndMovesAssociations() {
  //   Pokemon myPokemon = new Pokemon("Squirtle", "Water", "None", "A cute turtle", 50.0, 12, 16, false);
  //   myPokemon.customSave();
  //   Move myMove = new Move("Bubble");
  //   myMove.customSave();
  //   myPokemon.addMove(myMove);
  //   myPokemon.delete();
  //   assertEquals(0, Pokemon.all().size());
  //   assertEquals(0, myPokemon.getMoves().size());
  // }

// }
