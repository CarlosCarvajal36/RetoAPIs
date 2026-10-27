Feature: Pruebas CRUD sobre el servicio de Usuarios en ReqRes

  Background:
    * url baseUrl

  Scenario: Consultar la lista de usuarios mediante GET exitoso y registrar trazas
    * karate.log('=== INICIO DE PRUEBA: Consultando la lista de usuarios (Página 2) ===')

    Given path '/users'
    And param page = 2

    When method GET
    * karate.log('=== PETICIÓN HTTP EJECUTADA CON ÉXITO ===')

    Then status 200

    # Registramos datos obtenidos de la respuesta en los logs para auditoría
    * karate.log('El ID del primer usuario obtenido es:', response.data[0].id)
    * karate.log('El correo del primer usuario es:', response.data[0].email)

    And match response.page == 2
    And match response.data[0].id == 7
    And match response.data[0].email == '#string'

    * karate.log('=== FIN DE PRUEBA: Validaciones superadas correctamente ===')