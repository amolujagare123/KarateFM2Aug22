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

