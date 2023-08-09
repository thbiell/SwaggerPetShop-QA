#Author: profricardo.moura@fiap.com.br

@tag
Feature: Everything about your Pets
  Descrição da feature

  @tag1
  Scenario: Finds Pets by status
    Given url UrlBase
    And path 'findByStatus'
    And param status = 'available'
    When method GET
    Then status 200
    And match response[0].name contains 'fish'

  @tag2
  Scenario: Find Pet by ID
    Given url UrlBase
    And path '0'
    And param status = 'available'
    When method GET
    Then status 200
    And match response[0].name contains 'doggie'

  @tag3
  Scenario: Add a new Pet
    Given url UrlBase
    And path 'pet'
    And request {"id": 12345,"category": {"id": 1,"name": "dogs"},"name": "Buddy","photoUrls": ["https://example.com/buddy.jpg"],"tags": [{"id": 1,"name": "friendly"}],"status": "available"}
    When method POST
    Then status 200
    And match response.id == 12345
    And match response.name == 'Buddy'
    And match response.status == 'available'

  @tag4
  Scenario: Invalid input when adding a new Pet
    Given url UrlBase
    And path 'pet'
    And request {"id": 0,"category": {"id": 0,"name": "string"},"name": "doggie","photoUrls": ["string"],"tags": [{"id": 0,"name": "string"}],"status": "available"}
    When method GET
    Then status 405

  @tag5
  Scenario: Delete a Pet
    Given url UrlBase
    And path null
    When method DELETE
    Then status 405

  @tag6
  Scenario: Update Pet Information
    Given url UrlBase
    And path 'pet'
    And request {"id": 1,"category": {"id": 1,"name": "papagaio"},"name": "Tigrao","photoUrls": ["https://imagens.com/tigrao.jpg"],"tags": [{"id": 2,"name": "playful"}],"status": "pending"}
    When method PUT
    Then status 200
    And match response.id == 1
    And match response.name == 'Tigrao'
    And match response.category.name == 'papagaio'
    And match response.tags[0].name == 'playful'





