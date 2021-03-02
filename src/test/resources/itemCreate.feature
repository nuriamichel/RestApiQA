Feature: Item

  #este es un comentario
  @Items
  Scenario: As admin user
            I want to create an item
            So that i am able to manipulate the item

    Given yo tengo acceso al Todo.ly
    When yo envio una peticion POST al url http://todo.ly/api/items.json con json
    """
    {
      "Content":"ITEM 1"
    }
    """
    Then yo espero que el codigo de respuesta sea 200
    And yo espero que el nombre del item sea "ITEM 1"

