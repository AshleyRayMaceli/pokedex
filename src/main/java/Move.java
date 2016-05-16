
import java.util.List;
import java.util.ArrayList;
import org.sql2o.*;

public class Move {
  private int id;
  private String name;

  public Move(String name) {
    this.name = name;
  }

  public int getId() {
    return id;
  }
  public String getName() {
    return name;
  }

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO moves (name) VALUES (:name)";
      this.id = (int) con.createQuery(sql, true)
      .addParameter("name", this.name)
      .executeUpdate()
      .getKey();
    }
  }

  public static List<Move> all() {
  String sql = "SELECT * FROM moves";
  try(Connection con = DB.sql2o.open()) {
    return con.createQuery(sql).executeAndFetch(Move.class);
    }
  }

  public static Move find(int id) {
  try(Connection con = DB.sql2o.open()) {
    String sql = "SELECT * FROM moves WHERE id=:id";
    return con.createQuery(sql)
      .addParameter("id", id)
      .executeAndFetchFirst(Move.class);
    }
  }

  public void delete() {
  try (Connection con = DB.sql2o.open()) {
    String sql = "DELETE FROM moves WHERE id = :id";
    con.createQuery(sql)
      .addParameter("id", id)
      .executeUpdate();
    sql = "DELETE FROM moves_pokemons WHERE move_id = :id";
    con.createQuery(sql)
      .addParameter("id", id)
      .executeUpdate();
    }
  }
  @Override
  public boolean equals(Object otherMove){
    if (!(otherMove instanceof Move)) {
      return false;
    } else {
      Move newMove = (Move) otherMove;
      return this.getId() == newMove.getId() &&
             this.getName().equals(newMove.getName());
    }
  }
}
