Feature: all deck of cards requests
Background: get url
Given url 'https://deckofcardsapi.com'

@shuffleDrawCards
Scenario: check shuffle & draw cards request
Given path '/api/deck/new/shuffle/'
And param  count = 1
When method get
Then status 200
* def id = response.deck_id
* print id
Given path '/api/deck/' + id + '/draw/'
  And param  count = 2
  When method get
  Then status 200

  @shuffleCardsVariable
  Scenario: check the shuffle cards request
    Given url 'https://deckofcardsapi.com'
    And path '/api/deck/new/shuffle/'
    * def myId = function() {return 10;}
    * print  "value = "  ,  myId()
    * def dCount = 2
    And param  deck_count = dCount
    When method get
    Then status 200

  @shuffleCardsSchemaValidation
  Scenario: check the shuffle cards request
    Given url 'https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1'
    When method get
    Then status 200
    Then match response ==
    """
        {
            "success": '#boolean',
            "deck_id": '#string',
            "remaining": '#number',
            "shuffled": '#boolean'
        }
    """

