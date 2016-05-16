import org.junit.rules.ExternalResource;
import org.sql2o.*;

public class DatabaseRule extends ExternalResource {

  @Override
  protected void before() {
    DB.sql2o = new Sql2o("jdbc:postgresql://localhost:5432/pokedex_test", null, null);
  }

  @Override
  protected void after() {
    try(Connection con = DB.sql2o.open()) {
      String deletePokemonsQuery = "DELETE FROM pokemons *;";
      String deleteMovesQuery = "DELETE FROM moves *;";
      String deleteMovesPokemonsQuery = "DELETE FROM moves_pokemons *;";
      con.createQuery(deletePokemonsQuery).executeUpdate();
      con.createQuery(deleteMovesQuery).executeUpdate();
      con.createQuery(deleteMovesPokemonsQuery).executeUpdate();
    }
  }

}
