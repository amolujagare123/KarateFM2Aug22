Feature: All sample Rest API requests

  @fullurl
  Scenario: check the get user request
    Given url 'https://reqres.in/api/users?page=2'
    When method get
    Then status 200

  @usingpath
  Scenario: check the get user request
    Given url 'https://reqres.in'
    And path '/api/users?page=2'
    When method get
    Then status 200

    @shuffleCards
    Scenario: check the shuffle cards request
      Given url 'https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1'
      When method get
      Then status 200

      @drawCards
      Scenario: check draw cards request
        Given url 'https://deckofcardsapi.com/api/deck/fw01c5yk2rlk/draw/?count=2'
        When method get
        Then status 200
        
    @getAllChatUsers
    Scenario: check the get all chat user request
      Given url 'http://localhost/chat/lhc_web/index.php/site_admin'
      And path '/restapi/getusers'
      And header Authorization = call read('basic-auth.js') {username:"admin",password:"admin123"}
      When method get
      Then status 200


  @getAllJobUsers
  Scenario: check the get all Job user request
    Given url 'http://localhost:9897'
    And path '/normal/webapi/all'
    When method get
    Then status 200