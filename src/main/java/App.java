import java.util.Map;
import java.util.HashMap;
import java.util.List;
import spark.ModelAndView;
import spark.template.velocity.VelocityTemplateEngine;
import static spark.Spark.*;
import java.util.ArrayList;

public class App {
  public static void main(String[] args) {
    staticFileLocation("/public");
    String layout = "templates/layout.vtl";

    get("/", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("template", "templates/index.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/pokedex", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("pokemons", Pokemon.all());
      model.put("moves", Move.all());
      model.put("template", "templates/pokedex.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/pokedex/name-search", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      String name = request.queryParams("name");
      model.put("pokemons", Pokemon.searchByName(name));
      model.put("template", "templates/pokedex.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/pokedex/move-search", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      Integer moveDropDownResult = Integer.parseInt(request.queryParams("moveId"));
      Move move = Move.find(moveDropDownResult);
      List<Pokemon> pokemons = new ArrayList<Pokemon>();

      if (moveDropDownResult == 0) {
        pokemons = Pokemon.all();
      } else {
        pokemons = move.getPokemons();
      }

      model.put("pokemons", pokemons);
      model.put("moves", Move.all());
      model.put("template", "templates/pokedex.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/pokepage/:id", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      Pokemon pokemon = Pokemon.find(Integer.parseInt(request.params("id")));
      model.put("pokemons", Pokemon.all());
      model.put("moves", Move.all());
      model.put("pokemon", pokemon);
      model.put("template", "templates/pokepage.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/battle", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("player1Pokemon", request.session().attribute("player1Pokemon"));
      model.put("player2Pokemon", request.session().attribute("player2Pokemon"));
      model.put("template", "templates/battle.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/player1Selection", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      String pokemon1 = request.queryParams("player1Pokemon");
      Pokemon player1Pokemon;
      if (Pokemon.searchByName(pokemon1).size() > 0) {
        player1Pokemon = Pokemon.searchByName(pokemon1).get(0);
      } else {
        player1Pokemon = Pokemon.searchByName("Magikarp").get(0);
      }
      player1Pokemon.hp = 500;
      request.session().attribute("player1Pokemon", player1Pokemon);
      model.put("player1Pokemon", player1Pokemon);
      model.put("template", "templates/player2Select.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/player2Selection", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      String pokemon2 = request.queryParams("player2Pokemon");
      Pokemon player1Pokemon = request.session().attribute("player1Pokemon");
      Pokemon player2Pokemon;
      if (Pokemon.searchByName(pokemon2).size() > 0) {
        player2Pokemon = Pokemon.searchByName(pokemon2).get(0);
      } else {
        player2Pokemon = Pokemon.searchByName("Magikarp").get(0);
      }
      player2Pokemon.hp = 500;
      model.put("player1Pokemon", request.session().attribute("player1Pokemon"));
      request.session().attribute("player2Pokemon", player2Pokemon);
      model.put("moves", player1Pokemon.getMoves());
      model.put("player2Pokemon", player2Pokemon);
      model.put("template", "templates/pokefight1pTurn.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/pokefight/2pturn", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      Move move = Move.searchByName(request.queryParams("move")).get(0);
      Pokemon player2Pokemon = request.session().attribute("player2Pokemon");
      Pokemon player1Pokemon = request.session().attribute("player1Pokemon");
      model.put("player1Pokemon", request.session().attribute("player1Pokemon"));
      model.put("player2Pokemon", request.session().attribute("player2Pokemon"));
      model.put("moves", player2Pokemon.getMoves());
      move.attack(request.session().attribute("player2Pokemon"));
      model.put("template", "templates/pokefight2pTurn.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/pokefight/1pturn", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      Move move = Move.searchByName(request.queryParams("move")).get(0);
      Pokemon player2Pokemon = request.session().attribute("player2Pokemon");
      Pokemon player1Pokemon = request.session().attribute("player1Pokemon");
      model.put("player1Pokemon", request.session().attribute("player1Pokemon"));
      model.put("player2Pokemon", request.session().attribute("player2Pokemon"));
      model.put("moves", player1Pokemon.getMoves());
      move.attack(request.session().attribute("player1Pokemon"));
      model.put("template", "templates/pokefight1pTurn.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/pokefight/player1Change", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      String player1Change = request.queryParams("player1Change");
      Pokemon player2Pokemon = request.session().attribute("player2Pokemon");
      Pokemon player1Pokemon = request.session().attribute("player1Pokemon");
      int hp = player1Pokemon.hp;
      if (Pokemon.searchByName(player1Change).size() > 0) {
        player1Pokemon = Pokemon.searchByName(player1Change).get(0);
      } else {
        player1Pokemon = Pokemon.searchByName("Magikarp").get(0);
      }
      player1Pokemon.hp = hp;
      request.session().attribute("player1Pokemon", player1Pokemon);
      model.put("player1Pokemon", request.session().attribute("player1Pokemon"));
      model.put("player2Pokemon", request.session().attribute("player2Pokemon"));
      model.put("moves", player2Pokemon.getMoves());
      model.put("switched", true);
      model.put("template", "templates/pokefight2pTurn.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/pokefight/player2Change", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      String player2Change = request.queryParams("player2Change");
      Pokemon player1Pokemon = request.session().attribute("player1Pokemon");
      Pokemon player2Pokemon = request.session().attribute("player2Pokemon");
      int hp = player2Pokemon.hp;
      if (Pokemon.searchByName(player2Change).size() > 0) {
        player2Pokemon = Pokemon.searchByName(player2Change).get(0);
      } else {
        player2Pokemon = Pokemon.searchByName("Magikarp").get(0);
      }
      player2Pokemon.hp = hp;
      request.session().attribute("player2Pokemon", player2Pokemon);
      model.put("player1Pokemon", request.session().attribute("player1Pokemon"));
      model.put("player2Pokemon", request.session().attribute("player2Pokemon"));
      model.put("moves", player1Pokemon.getMoves());
      model.put("switched", true);
      model.put("template", "templates/pokefight1pTurn.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());


    post("/pokedex/name-search", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      String name = request.queryParams("name");
      model.put("pokemons", Pokemon.searchByName(name));
      model.put("template", "templates/pokedex.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/pokedex/strong-against-search", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      String strongAgainst = request.queryParams("strongAgainst");
      if (Pokemon.searchByName(strongAgainst).size() > 0) {
        Pokemon searchedPokemon = Pokemon.searchByName(strongAgainst).get(0);
        Move moveType1 = new Move ("Type 1", searchedPokemon.getType1(), 0.0, 0);
        Move moveType2 = new Move ("Type 2", searchedPokemon.getType2(), 0.0, 0);
        List<Pokemon> goodMatchups = new ArrayList();
        for (Pokemon defender : Pokemon.all() ) {
          double effectiveness = moveType1.effectiveness(defender);
          effectiveness = effectiveness * moveType2.effectiveness(defender);
          if (effectiveness > 1) {
            goodMatchups.add(defender);
          }
        }
        model.put("pokemons", goodMatchups);
      }
      model.put("template", "templates/pokedex.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());
  }
}
