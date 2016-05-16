import java.util.Map;
import java.util.HashMap;
import spark.ModelAndView;
import spark.template.velocity.VelocityTemplateEngine;
import static spark.Spark.*;

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

    get("/pokepage/:id", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      Pokemon pokemon = Pokemon.find(Integer.parseInt(request.params("id")));
      model.put("pokemon", pokemon);
      model.put("template", "templates/pokepage.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());
  }
}
