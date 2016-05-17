
import java.util.List;
import java.util.ArrayList;
import org.sql2o.*;
import java.util.Arrays;

public class Pokemon {
  private int id;
  private String type_1;
  private String type_2;
  private String name;
  private String description;
  private double weight;
  private int height;
  private int evolves;
  private boolean mega_evolves;

  public Pokemon(String name, String type_1, String type_2, String description, double weight, int height, int evolves, boolean mega_evolves) {
    this.name = name;
    this.type_1 = type_1;
    this.type_2 = type_2;
    this.description = description;
    this.weight = weight;
    this.height = height;
    this.evolves = evolves;
    this.mega_evolves = mega_evolves;
  }

  public int getId() {
    return id;
  }
  public String getType1() {
    return type_1;
  }
  public String getType2() {
    return type_2;
  }
  public String getDescription() {
    return description;
  }
  public double getWeight() {
    return weight;
  }
  public int getHeight() {
    return height;
  }
  public int getEvolves() {
    return evolves;
  }
  public boolean getMega_evolves() {
    return mega_evolves;
  }
  public String getName() {
    return name;
  }

  public String getImageName() {
    return name + ".gif";
  }

  public int getPreviousId() {
    return id - 1;
  }

  public int getNextId() {
    return id + 1;
  }

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO pokemons (name, type_1, type_2, description, weight, height, evolves, mega_evolves) VALUES (:name, :type_1, :type_2, :description, :weight, :height, :evolves, :mega_evolves)";
      this.id = (int) con.createQuery(sql, true)
      .addParameter("name", this.name)
      .addParameter("type_1", this.type_1)
      .addParameter("type_2", this.type_2)
      .addParameter("description", this.description)
      .addParameter("weight", this.weight)
      .addParameter("height", this.height)
      .addParameter("evolves", this.evolves)
      .addParameter("mega_evolves", this.mega_evolves)
      .executeUpdate()
      .getKey();
    }
  }

  public static List<Pokemon> all() {
  String sql = "SELECT * FROM pokemons ORDER BY id ASC";
  try(Connection con = DB.sql2o.open()) {
    return con.createQuery(sql).executeAndFetch(Pokemon.class);
    }
  }

  public static Pokemon find(int id) {
  try(Connection con = DB.sql2o.open()) {
    String sql = "SELECT * FROM pokemons WHERE id=:id";
    return con.createQuery(sql)
      .addParameter("id", id)
      .executeAndFetchFirst(Pokemon.class);
    }
  }

  public void delete() {
  try (Connection con = DB.sql2o.open()) {
    String sql = "DELETE FROM pokemons WHERE id = :id";
    con.createQuery(sql)
      .addParameter("id", id)
      .executeUpdate();
    sql = "DELETE FROM moves_pokemons WHERE pokemon_id = :id";
    con.createQuery(sql)
      .addParameter("id", id)
      .executeUpdate();
    }
  }

  @Override
  public boolean equals(Object otherPokemon){
    if (!(otherPokemon instanceof Pokemon)) {
      return false;
    } else {
      Pokemon newPokemon = (Pokemon) otherPokemon;
      return this.getId() == newPokemon.getId() &&
             this.getName().equals(newPokemon.getName());
    }
  }

  public void addMove(Move move) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO moves_pokemons (move_id, pokemon_id) VALUES (:move_id, :pokemon_id)";
      con.createQuery(sql)
        .addParameter("pokemon_id", this.getId())
        .addParameter("move_id", move.getId())
        .executeUpdate();
      }
    }

  public List<Move> getMoves() {
    try(Connection con = DB.sql2o.open()) {
      String joinQuery = "SELECT moves.* FROM pokemons " +
      "JOIN moves_pokemons ON (pokemons.id = moves_pokemons.pokemon_id) " +
      "JOIN moves ON (moves_pokemons.move_id = moves.id) " +
      "WHERE pokemons.id = :pokemon_id";

      List<Move> moves = con.createQuery(joinQuery)
        .addParameter("pokemon_id", this.getId())
        .executeAndFetch(Move.class);

      return moves;
    }
  }

  public static List<Pokemon> searchByName(String name) {
    name = name.toLowerCase();
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM pokemons WHERE LOWER (name) LIKE :name";
      return con.createQuery(sql)
        .addParameter("name", '%' + name + '%')
        .executeAndFetch(Pokemon.class);
    }
  }

  public double effectiveness (Pokemon defendingPokemon, String attackType) {
    String[] defenderTypes = {defendingPokemon.getType1(), defendingPokemon.getType2()};
    double effectiveness = 1;

    for (String type : defenderTypes ) {

      if (attackType.equals("Normal")) {
        if (type.contains("Rock")) {
          effectiveness *= .5;
        } else if (type.contains("Ghost")) {
          effectiveness = 0;
        }
      }
      if (attackType.equals("Fire")) {
        if (type.equals("Fire") || type.equals("Water") || type.equals("Rock") || type.equals("Dragon")) {
          effectiveness *= .5;
        } else if (type.equals("Grass") || type.equals("Bug") || type.equals("Ice")) {
          effectiveness *=2;
        }
      }
      if (attackType.equals("Water")) {
        if (type.equals("Fire") || type.equals("Ground") || type.equals("Rock")) {
          effectiveness *=2;
        } else if (type.equals("Water") || type.equals("Grass") || type.equals("Dragon")) {
          effectiveness *=.5;
        }
      }
      if (attackType.equals("Electric")) {
        if (type.equals("Water") || type.equals("Flying")) {
          effectiveness *=2;
        } else if (type.equals("Electric") || type.equals("Grass") || type.equals("Dragon")) {
          effectiveness *= .5;
        } else if (type.equals("Ground")) {
          effectiveness = 0;
        }
      }
      if (attackType.equals("Grass")) {
        if (type.equals("Fire") || type.equals("Grass") || type.equals("Poison") || type.equals("Flying") || type.equals("Bug") || type.equals("Dragon")) {
          effectiveness *= .5;
        } else if (type.equals("Water") || type.equals("Ground") || type.equals("Rock")) {
          effectiveness *= 2;
        }
      }
      if (attackType.equals("Ice")) {
        if (type.equals("Fire") || type.equals("Water") || type.equals("Ice")) {
          effectiveness *= .5;
        } else if (type.equals("Grass") || type.equals("Ground") || type.equals("Flying") || type.equals("Dragon")) {
          effectiveness *=2;
        }
      }
      if (attackType.equals("Fighting")) {
        if (type.equals("Normal") || type.equals("Ice") || type.equals("Rock")) {
          effectiveness *=2;
        } else if (type.equals("Poison") || type.equals("Flying") || type.equals("Psychic") || type.equals("Bug")) {
          effectiveness *=.5;
        } else if (type.equals("Ghost")) {
          effectiveness = 0;
        }
      }
      if (attackType.equals("Poison")) {
        if (type.equals("Grass")) {
          effectiveness *= 2;
        } else if (type.equals("Poison") || type.equals("Ground") || type.equals("Rock") || type.equals("Ghost")) {
          effectiveness *=.5;
        }
      }
      if (attackType.equals("Ground")) {
        if (type.equals("Fire") || type.equals("Electric") || type.equals("Poison") || type.equals("Rock")) {
          effectiveness *=2;
        } else if (type.equals("Grass") || type.equals("Bug")) {
          effectiveness *=.5;
        } else if (type.equals("Flying")) {
          effectiveness = 0;
        }
      }
      if (attackType.equals("Flying")) {
        if (type.equals("Grass") || type.equals("Fighting") || type.equals("Bug")) {
          effectiveness *= 2;
        } else if (type.equals("Electric") || type.equals("Rock")) {
          effectiveness *=.5;
        }
      }
      if (attackType.equals("Psychic")) {
        if (type.equals("Fighting") || type.equals("Ground")) {
          effectiveness *= 2;
        } else if (type.equals("Psychic")) {
          effectiveness *=.5;
        }
      }
      if (attackType.equals("Bug")) {
        if (type.equals("Grass") || type.equals("Psychic")) {
          effectiveness *=2;
        } else if (type.equals("Fire") || type.equals("Fighting") || type.equals("Poison") || type.equals("Flying") || type.equals("Ghost")) {
          effectiveness *=.5;
        }
      }
      if (attackType.equals("Rock")) {
        if (type.equals("Fire") || type.equals("Ice") || type.equals("Flying") || type.equals("Bug")) {
          effectiveness *=2;
        } else if (type.equals("Fighting") || type.equals("Ground")) {
          effectiveness *=.5;
        }
      }
      if (attackType.equals("Ghost")) {
        if (type.equals("Psychic") || type.equals("Ghost")) {
          effectiveness *=2;
        } else if (type.equals("Normal")) {
          effectiveness *=0;
        }
      }
      if (attackType.equals("Dragon")) {
        if (type.equals("Dragon")) {
          effectiveness *=2;
        }
      }

    }
    return effectiveness;
  }

}
