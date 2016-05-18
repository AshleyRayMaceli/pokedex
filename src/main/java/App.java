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

    Pokemon pokemon1 = Pokemon.searchByName("Charizard").get(0);
    Pokemon pokemon2 = Pokemon.searchByName("Blastoise").get(0);
    pokemon1.hp = 500;
    pokemon2.hp = 500;

    get("/", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("template", "templates/index.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/pokedex", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("pokemons", Pokemon.all());
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

    get("/pokepage/:id", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      Pokemon pokemon = Pokemon.find(Integer.parseInt(request.params("id")));
      model.put("pokemons", Pokemon.all());
      model.put("moves", Move.all());
      model.put("pokemon", pokemon);
      model.put("template", "templates/pokepage.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/pokepage/:id/move/new", (request, response) -> {
      Pokemon pokemon = Pokemon.find(Integer.parseInt(request.params("id")));
      Integer moveDropDownResult = Integer.parseInt(request.queryParams("moveId"));
      Move move = Move.find(moveDropDownResult);
      pokemon.addMove(move);
      response.redirect("/pokepage/" + pokemon.getId());
      return null;
    });

    get("/battle", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      pokemon1.hp = 500;
      pokemon2.hp = 500;
      model.put("pokemon1", pokemon1);
      model.put("pokemon2", pokemon2);
      model.put("template", "templates/battle.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/pokefight/2pturn", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      Move move = Move.searchByName(request.queryParams("move")).get(0);
      move.attack(pokemon2);
      model.put("pokemon1", pokemon1);
      model.put("pokemon2", pokemon2);
      model.put("template", "templates/pokefight2pTurn.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/pokefight/1pturn", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      Move move = Move.searchByName(request.queryParams("move")).get(0);
      move.attack(pokemon1);
      model.put("pokemon1", pokemon1);
      model.put("pokemon2", pokemon2);
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
