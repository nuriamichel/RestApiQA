Feature: Item

  #este es un comentario
  @Item
  Scenario: As admin user
  I want to create, update and delete an item
  So that i am able to manipulate the item

    Given yo tengo acceso al Todo.ly
    When yo envio una peticion POST al url http://todo.ly/api/items.json con json
    """
    {
      "Content":"Item Nuria"
    }
    """
    Then yo espero que el codigo de respuesta sea 200
    And yo espero el response body sea
    """
    {
      "Id": "IGNORE",
      "Content": "Item Nuria",
      "ItemType": 1,
      "Checked": false,
      "ProjectId": null,
      "ParentId": null,
      "Path": "",
      "Collapsed": false,
      "DateString": null,
      "DateStringPriority": 0,
      "DueDate": "",
      "Recurrence": null,
      "ItemOrder": null,
      "Priority": 4,
      "LastSyncedDateTime":
      "IGNORE",
      "Children": [],

      "DueDateTime": null,
      "CreatedDate": "IGNORE",
      "LastCheckedDate": null,
      "LastUpdatedDate": "IGNORE",
      "Deleted": false,
      "Notes": "",
      "InHistory": false,
      "SyncClientCreationId": null,
      "DueTimeSpecified": true,
      "OwnerId": "IGNORE"
    }
    """
    And yo obtengo el Id y lo guardo en ID_ITEM
    When yo envio una peticion PUT al url http://todo.ly/api/items/ID_ITEM.json con json
    """
    {
      "Content":"Item Nuria"
    }
    """
    Then yo espero que el codigo de respuesta sea 200
    And yo espero el response body sea
    """
    {
      "Id": "ID_ITEM",
      "Content": "Item Nuria",
      "ItemType": 1,
      "Checked": false,
      "ProjectId": null,
      "ParentId": null,
      "Path": "",
      "Collapsed": false,
      "DateString": null,
      "DateStringPriority": 0,
      "DueDate": "",
      "Recurrence": null,
      "ItemOrder": null,
      "Priority": 4,
      "LastSyncedDateTime":
      "IGNORE",
      "Children": [],

      "DueDateTime": null,
      "CreatedDate": "IGNORE",
      "LastCheckedDate": null,
      "LastUpdatedDate": "IGNORE",
      "Deleted": false,
      "Notes": "",
      "InHistory": false,
      "SyncClientCreationId": null,
      "DueTimeSpecified": true,
      "OwnerId": "IGNORE"
    }
    """
    When yo envio una peticion GET al url http://todo.ly/api/items/ID_ITEM.json con json
    """
    """
    Then yo espero que el codigo de respuesta sea 200
    And yo espero el response body sea
    """
    {
      "Id": "ID_ITEM",
      "Content": "Item Nuria",
      "ItemType": 1,
      "Checked": false,
      "ProjectId": null,
      "ParentId": null,
      "Path": "",
      "Collapsed": false,
      "DateString": null,
      "DateStringPriority": 0,
      "DueDate": "",
      "Recurrence": null,
      "ItemOrder": null,
      "Priority": 4,
      "LastSyncedDateTime":
      "IGNORE",
      "Children": [],

      "DueDateTime": null,
      "CreatedDate": "IGNORE",
      "LastCheckedDate": null,
      "LastUpdatedDate": "IGNORE",
      "Deleted": false,
      "Notes": "",
      "InHistory": false,
      "SyncClientCreationId": null,
      "DueTimeSpecified": true,
      "OwnerId": "IGNORE"
    }
    """
    When yo envio una peticion DELETE al url http://todo.ly/api/items/ID_ITEM.json con json
    """
    """
    Then yo espero que el codigo de respuesta sea 200
    And yo espero el response body sea
    """
    {
      "Id": "ID_ITEM",
      "Content": "Item Nuria",
      "ItemType": 1,
      "Checked": false,
      "ProjectId": null,
      "ParentId": null,
      "Path": "",
      "Collapsed": false,
      "DateString": null,
      "DateStringPriority": 0,
      "DueDate": "",
      "Recurrence": null,
      "ItemOrder": null,
      "Priority": 4,
      "LastSyncedDateTime":
      "IGNORE",
      "Children": [],

      "DueDateTime": null,
      "CreatedDate": "IGNORE",
      "LastCheckedDate": null,
      "LastUpdatedDate": "IGNORE",
      "Deleted": true,
      "Notes": "",
      "InHistory": false,
      "SyncClientCreationId": null,
      "DueTimeSpecified": true,
      "OwnerId": "IGNORE"
    }
    """