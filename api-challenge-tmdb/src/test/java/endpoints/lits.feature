Feature: Create List and added different actions to the created list

  Background:
    * url baseUrl
    * def createListBody = read('classpath:createList.json')

    * def updateListbody = read('classpath:updateListPut.json')

    * def addItemsToListBody = read('classpath:addItemsToTheList.json')
    * def updateItemsToListBody = read('classpath:updateItemsToTheList.json')
    * def removeItemsToListBody = read('classpath:removeItemsToTheList.json')

  Scenario: Create a new list
    Given path '/list'
    And header Authorization = 'Bearer ' + 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2ZXJzaW9uIjoxLCJzdWIiOiI2NTVjOTM5Y2I1NDAwMjE0ZDNjY2JlNmMiLCJuYmYiOjE3MDA1NzQwNDAsImF1ZCI6IjZiMjIwNThlNTQzYmM4YmYwM2Q4ZGU3Nzk4M2E0MGFkIiwianRpIjoiNjcyNzY1MyIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdfQ.M4e20ScuOdUozi8kxi14AMLIDdNbNGQmZw1ZJ0jeG44'
    And request createListBody
    When method POST
    Then status 201
    And match response.success == true
    And match response.id != null

    * def list_id = response.id

  #Scenario: Update List
    Given path '/list/' + list_id
    And header Authorization = 'Bearer ' + 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2ZXJzaW9uIjoxLCJzdWIiOiI2NTVjOTM5Y2I1NDAwMjE0ZDNjY2JlNmMiLCJuYmYiOjE3MDA1NzQwNDAsImF1ZCI6IjZiMjIwNThlNTQzYmM4YmYwM2Q4ZGU3Nzk4M2E0MGFkIiwianRpIjoiNjcyNzY1MyIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdfQ.M4e20ScuOdUozi8kxi14AMLIDdNbNGQmZw1ZJ0jeG44'
    And request updateListbody
    When method PUT
    Then status 201
    And match response.success == true

  #Scenario: Add items to the List
    Given path '/list/' + list_id + '/items'
    And header Authorization = 'Bearer ' + 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2ZXJzaW9uIjoxLCJzdWIiOiI2NTVjOTM5Y2I1NDAwMjE0ZDNjY2JlNmMiLCJuYmYiOjE3MDA1NzQwNDAsImF1ZCI6IjZiMjIwNThlNTQzYmM4YmYwM2Q4ZGU3Nzk4M2E0MGFkIiwianRpIjoiNjcyNzY1MyIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdfQ.M4e20ScuOdUozi8kxi14AMLIDdNbNGQmZw1ZJ0jeG44'
    And request addItemsToListBody
    When method POST
    Then status 200
    And match response.status_message == "Success."

  #Scenario: Update an individual item on a list
    Given path '/list/' + list_id + '/items'
    And header Authorization = 'Bearer ' + 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2ZXJzaW9uIjoxLCJzdWIiOiI2NTVjOTM5Y2I1NDAwMjE0ZDNjY2JlNmMiLCJuYmYiOjE3MDA1NzQwNDAsImF1ZCI6IjZiMjIwNThlNTQzYmM4YmYwM2Q4ZGU3Nzk4M2E0MGFkIiwianRpIjoiNjcyNzY1MyIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdfQ.M4e20ScuOdUozi8kxi14AMLIDdNbNGQmZw1ZJ0jeG44'
    And request updateItemsToListBody
    When method PUT
    Then status 200
    And match response.status_message == "Success."

  #Scenario: Remove items from a list
    Given path '/list/' + list_id + '/items'
    And header Authorization = 'Bearer ' + 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2ZXJzaW9uIjoxLCJzdWIiOiI2NTVjOTM5Y2I1NDAwMjE0ZDNjY2JlNmMiLCJuYmYiOjE3MDA1NzQwNDAsImF1ZCI6IjZiMjIwNThlNTQzYmM4YmYwM2Q4ZGU3Nzk4M2E0MGFkIiwianRpIjoiNjcyNzY1MyIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdfQ.M4e20ScuOdUozi8kxi14AMLIDdNbNGQmZw1ZJ0jeG44'
    And request removeItemsToListBody
    When method DELETE
    Then status 200
    And match response.status_message == "Success."

  #Scenario: Clear the list
    Given path '/list/' + list_id + '/clear'
    And header Authorization = 'Bearer ' + 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2ZXJzaW9uIjoxLCJzdWIiOiI2NTVjOTM5Y2I1NDAwMjE0ZDNjY2JlNmMiLCJuYmYiOjE3MDA1NzQwNDAsImF1ZCI6IjZiMjIwNThlNTQzYmM4YmYwM2Q4ZGU3Nzk4M2E0MGFkIiwianRpIjoiNjcyNzY1MyIsInNjb3BlcyI6WyJhcGlfcmVhZCIsImFwaV93cml0ZSJdfQ.M4e20ScuOdUozi8kxi14AMLIDdNbNGQmZw1ZJ0jeG44'
    When method GET
    Then status 200
    And match response.items_deleted == 3
