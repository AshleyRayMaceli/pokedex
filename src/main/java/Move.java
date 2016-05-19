import java.util.Random;
import java.util.List;
import java.util.ArrayList;
import org.sql2o.*;

public class Move {
  private int id;
  private String name;
  private String type;
  private Double power;
  private int accuracy;

  public Move(String name, String type, Double power, int accuracy) {
    this.name = name;
    this.type = type;
    this.power = power;
    this.accuracy = accuracy;
  }

  public int getId() {
    return id;
  }
  public String getName() {
    return name;
  }

  public String getType() {
    return type;
  }

  public Double getPower() {
    return power;
  }

  public int getAccuracy() {
    return accuracy;
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

    public double effectiveness (Pokemon defendingPokemon) {
      String[] defenderTypes = {defendingPokemon.getType1(), defendingPokemon.getType2()};
      double effectiveness = 1;
      String attackType = this.type;

      for (String type : defenderTypes) {

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

    public boolean hitCalculator() {
      Random randomGenerator = new Random();
      int randomNumber = randomGenerator.nextInt(100) + 1;
      int moveAccuracy = this.getAccuracy();
      if (moveAccuracy >= randomNumber) {
        return true;
      } else {
        return false;
      }

    }

    public String attack(Pokemon defendingPokemon) {
      Double damage;

      if (this.hitCalculator()) {
        damage = this.getPower();
        if (this.effectiveness(defendingPokemon) > 1) {
          defendingPokemon.hp -= damage * this.effectiveness(defendingPokemon);
          return String.format("The attack is super effective and did %.2f damage", damage);
        } else if (this.effectiveness(defendingPokemon) == 0) {
          return "The attack is ineffective and did 0 damage";
        } else if (this.effectiveness(defendingPokemon) < 1) {
          defendingPokemon.hp -= damage * this.effectiveness(defendingPokemon);
          return String.format("The attack is not very effective and did %.2f damage", damage);
        } else {
          defendingPokemon.hp -= damage;
          return String.format("The attack does %.2f damage", damage);
        }
      } else {
        return "The attack misses and did 0 damage";
      }
    }

    public static List<Move> searchByName(String name) {
      name = name.toLowerCase();
      try(Connection con = DB.sql2o.open()) {
        String sql = "SELECT * FROM moves WHERE LOWER (name) LIKE :move";
        return con.createQuery(sql)
          .addParameter("move", '%' + name + '%')
          .executeAndFetch(Move.class);
      }
    }

    public List<Pokemon> getPokemons() {
      try(Connection con = DB.sql2o.open()) {
        String joinQuery = "SELECT pokemons.* FROM moves " +
        "JOIN moves_pokemons ON (moves.id = moves_pokemons.move_id) " +
        "JOIN pokemons ON (moves_pokemons.pokemon_id = pokemons.id) " +
        "WHERE moves.id = :move_id";

        List<Pokemon> pokemons = con.createQuery(joinQuery)
          .addParameter("move_id", this.getId())
          .executeAndFetch(Pokemon.class);

        return pokemons;
      }
    }

  }
