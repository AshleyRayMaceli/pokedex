// import java.util.List;
// import java.util.ArrayList;
// import org.sql2o.*;
// import java.util.Arrays;
//
// public class CustomPokemon {
//   private int id;
//   private String type_1;
//   private String type_2;
//   private String name;
//   private String description;
//   private double weight;
//   private int height;
//   private int evolves;
//   private boolean mega_evolves;
//
//   public CustomPokemon(String name, String type_1, String type_2, String description, double weight, int height, int evolves, boolean mega_evolves) {
//     this.name = name;
//     this.type_1 = type_1;
//     this.type_2 = type_2;
//     this.description = description;
//     this.weight = weight;
//     this.height = height;
//     this.evolves = evolves;
//     this.mega_evolves = mega_evolves;
//   }
//
//   public int getId() {
//     return id;
//   }
//   public String getType1() {
//     return type_1;
//   }
//   public String getType2() {
//     return type_2;
//   }
//   public String getDescription() {
//     return description;
//   }
//   public double getWeight() {
//     return weight;
//   }
//   public int getHeight() {
//     return height;
//   }
//   public int getEvolves() {
//     return evolves;
//   }
//   public boolean getMega_evolves() {
//     return mega_evolves;
//   }
//   public String getName() {
//     return name;
//   }
//
//   public String getImageName() {
//     return name + ".gif";
//   }
//
//   public int getPreviousId() {
//     return id - 1;
//   }
//
//   public int getNextId() {
//     return id + 1;
//   }
//
//   @Override
//   public boolean equals(Object otherPokemon){
//     if (!(otherPokemon instanceof CustomPokemon)) {
//       return false;
//     } else {
//       CustomPokemon newPokemon = (CustomPokemon) otherPokemon;
//       return this.getId() == newPokemon.getId() &&
//              this.getName().equals(newPokemon.getName());
//     }
//   }
//
//   public static List<CustomPokemon> customAll() {
//     String sql = "SELECT * FROM pokemons ORDER BY id ASC";
//     try(Connection con = DBCustom.sql2o.open()) {
//       return con.createQuery(sql).executeAndFetch(CustomPokemon.class);
//     }
//   }
//
//   public void customSave() {
//     try(Connection con = DBCustom.sql2o.open()) {
//       String sql = "INSERT INTO pokemons (name, type_1, type_2, description, weight, height, evolves, mega_evolves) VALUES (:name, :type_1, :type_2, :description, :weight, :height, :evolves, :mega_evolves)";
//       this.id = (int) con.createQuery(sql, true)
//       .addParameter("name", this.name)
//       .addParameter("type_1", this.type_1)
//       .addParameter("type_2", this.type_2)
//       .addParameter("description", this.description)
//       .addParameter("weight", this.weight)
//       .addParameter("height", this.height)
//       .addParameter("evolves", this.evolves)
//       .addParameter("mega_evolves", this.mega_evolves)
//       .executeUpdate()
//       .getKey();
//     }
//   }
//
//   public static CustomPokemon customFind(int id) {
//   try(Connection con = DBCustom.sql2o.open()) {
//     String sql = "SELECT * FROM pokemons WHERE id=:id";
//     return con.createQuery(sql)
//       .addParameter("id", id)
//       .executeAndFetchFirst(CustomPokemon.class);
//     }
//   }
//
//   public void addCustomMove(CustomMove move) {
//     try(Connection con = DBCustom.sql2o.open()) {
//       String sql = "INSERT INTO moves_pokemons (move_id, pokemon_id) VALUES (:move_id, :pokemon_id)";
//       con.createQuery(sql)
//         .addParameter("pokemon_id", this.getId())
//         .addParameter("move_id", move.getId())
//         .executeUpdate();
//       }
//     }
//
//   public List<CustomMove> getCustomMoves() {
//     try(Connection con = DBCustom.sql2o.open()) {
//       String joinQuery = "SELECT moves.* FROM pokemons " +
//       "JOIN moves_pokemons ON (pokemons.id = moves_pokemons.pokemon_id) " +
//       "JOIN moves ON (moves_pokemons.move_id = moves.id) " +
//       "WHERE pokemons.id = :pokemon_id";
//
//       List<CustomMove> moves = con.createQuery(joinQuery)
//         .addParameter("pokemon_id", this.getId())
//         .executeAndFetch(CustomMove.class);
//
//       return moves;
//     }
//   }
//
// }
