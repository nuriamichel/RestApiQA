package runner;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.junit.Assert;
import utilsJson.JsonHelper;

import java.util.HashMap;
import java.util.Map;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.equalTo;

public class MyStepdefs {

    Response response;
    Map<String, String> data= new HashMap<>();

    @And("yo tengo acceso al Todo.ly")
    public void yoTengoAccesoAlTodoLy() {
        System.out.println("acceso al todo.ly");
    }

    @And("yo envio una peticion POST al url {} con json")
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
                post(replaceAllData(url));

        response.then().log().all();
    }

    @And("yo espero que el codigo de respuesta sea {int}")
    public void yoEsperoQueElCodigoDeRespuestaSea(int expectedResult) {
        response.then().
                statusCode(expectedResult);
    }

    @And("yo espero que el nombre del {} sea {string}")
    public void yoEsperoQueElNombreDelProject(String type,String expectedName) {
        response.then().
                body("Content", equalTo(expectedName));
    }

    @And("yo espero el response body sea")
    public void yoEsperoElResponseBodySea(String expectedBody) {
        Assert.assertTrue("ERROR! los json no son iguales" ,JsonHelper.areEqualJson(replaceAllData(expectedBody),response.getBody().asString()));
    }

    @And("yo obtengo el {} y lo guardo en {}")
    public void yoObtengoElIdYLoGuardoEnID_ITEM(String property, String nameVar) {
        data.put(nameVar,response.then().extract().path(property)+"");
    }

    @When("yo envio una peticion PUT al url {} con json")
    public void yoEnvioUnaPeticionPUTAlUrlHttpTodoLyApiItemsID_ITEMJsonConJson(String url, String body) {
        response =  given().
                auth().
                preemptive().
                basic("upb2021@upb.com","12345").
                contentType(ContentType.JSON).
                body(body).
                log().
                all().
                when().
                put(replaceAllData(url));
        response.then().log().all();
    }

    @When("yo envio una peticion GET al url {} con json")
    public void yoEnvioUnaPeticionGETAlUrlHttpTodoLyApiItemsID_ITEMJsonConJson(String url, String body) {
        response =  given().
                auth().
                preemptive().
                basic("upb2021@upb.com","12345").
                contentType(ContentType.JSON).
                log().
                all().
                when().
                get(replaceAllData(url));
        response.then().log().all();

    }

    @When("yo envio una peticion DELETE al url {} con json")
    public void yoEnvioUnaPeticionDELETEAlUrlHttpTodoLyApiItemsID_ITEMJsonConJson(String url, String body) {
        response =  given().
                auth().
                preemptive().
                basic("upb2021@upb.com","12345").
                contentType(ContentType.JSON).
                log().
                all().
                when().
                delete(replaceAllData(url));
        response.then().log().all();
    }


    private String replaceAllData(String value){

        for (String key: data.keySet()) {
            value=value.replace(key,data.get(key));
        }

        return value;
    }
}
