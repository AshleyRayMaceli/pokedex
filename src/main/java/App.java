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
      model.put("pokemon", pokemon);
      model.put("template", "templates/pokepage.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/pokepage/:id/move/new", (request, response) -> {
      Pokemon pokemon = Pokemon.find(Integer.parseInt(request.params(":id")));
      String name = request.queryParams("move");
      List<Move> allMoves = Move.all();
      Move newMove = new Move(name);
      boolean matchFound = false;

      for(Move oldMove : allMoves) {
        if (newMove.getName().equals(oldMove.getName())) {
          pokemon.addMove(oldMove);
          matchFound = true;
          break;
        }
      }

      if (matchFound == false) {
        newMove.save();
        pokemon.addMove(newMove);
      }

      response.redirect("/pokepage/" + pokemon.getId());
      return null;
    });

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
        List<Pokemon> goodMatchups = new ArrayList();
        for (Pokemon defender : Pokemon.all() ) {
          double effectiveness = searchedPokemon.effectiveness(defender, searchedPokemon.getType1());
          effectiveness = effectiveness * searchedPokemon.effectiveness(defender, searchedPokemon.getType2());
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
