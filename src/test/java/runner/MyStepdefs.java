package runner;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.http.ContentType;
import io.restassured.response.Response;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.equalTo;

public class MyStepdefs {

    Response response;
    @Given("yo tengo acceso al Todo.ly")
    public void yoTengoAccesoAlTodoLy() {
        System.out.println("acceso al todo.ly");
    }

    @When("yo envio una peticion POST al url {} con json")
    public void yoEnvioUnaPeticionPOSTAlUrlHttpTodoLyApiItemsJsonConJson(String url,String body) {
        response =  given().
                auth().
                preemptive().
                basic("upb2021@upb.com","12345").
                contentType(ContentType.JSON).
                body(body).
                log().
                all().
                when().
                post(url);
    }

    @Then("yo espero que el codigo de respuesta sea {int}")
    public void yoEsperoQueElCodigoDeRespuestaSea(int expectedResult) {
        response.then().
                statusCode(expectedResult);
    }

    @And("yo espero que el nombre del item sea {string}")
    public void yoEsperoQueElNombreDelItem(String expectedNameItem) {
        response.then().
                body("Content", equalTo(expectedNameItem));
    }
}
