import org.sql2o.*;

public class BattleQuery {
  public int id;
  public int player1Selection;
  public int player2Selection;
  public int player1_hp;
  public int player2_hp;


  public void saveFirstSelection(int pokemon_id) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO battle (player1Selection, player1_hp, player2_hp) VALUES (:player1Selection, 500, 500)";
      this.id = (int) con.createQuery(sql, true)
      .addParameter("player1Selection", pokemon_id)
      .executeUpdate()
      .getKey();
    }
  }

  public void saveSecondSelection(int pokemon_id) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO battle (player2Selection) VALUES (:player2Selection)";
      con.createQuery(sql)
      .addParameter("player2Selection", pokemon_id)
      .executeUpdate();
    }
  }

public void reduceHp(int damage) {

}

}
