Feature: CRUD completo de mascotas en Petstore

  Background:
    * url baseUrl
    * def petPayload = read('classpath:json/new-pet.json')

  Scenario: Flujo CRUD secuencial y validacion negativa de mascota

    Given path '/pet'
    And request petPayload
    When method POST
    Then status 200
    And match response.id == 999988
    And match response.name == 'Firulais'
    And match response.status == 'available'

    Given path '/pet/999988'
    When method GET
    Then status 200
    And match response.id == 999988
    And match response.name == 'Firulais'

    * def updatePayload = read('classpath:json/new-pet.json')
    * set updatePayload.status = 'sold'
    Given path '/pet'
    And request updatePayload
    When method PUT
    Then status 200
    And match response.status == 'sold'

    Given path '/pet/999988'
    When method DELETE
    Then status 200

    Given path '/pet/999988'
    When method GET
    Then status 404