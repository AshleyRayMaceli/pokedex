import org.sql2o.*;

public class DBCustom {
  public static Sql2o sql2o = new Sql2o("jdbc:postgresql://localhost:5432/custom_pokedex", null, null);
}
