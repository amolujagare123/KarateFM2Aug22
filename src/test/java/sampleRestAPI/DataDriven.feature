Feature: All Data driven examples


  Background: read csv file
    Given def dataFile = read('user-data.csv')

  @SamplePost
  Scenario Outline: Check the post request of sample user
    Given url '<url>'
    And path '<path>'
    And request
    """
      {
      "name": "<name>",
      "job": "<job>"
      }
    """
    When method post
    Then status 201
    Examples:
      | url               | path        | name        | job            |
      | https://reqres.in | /api/users  | amol        | Tester         |
      | https://reqres.in | /api/users  | Avinash     | Lead           |
      | https://reqres.in | /api/users  | Kirti       | HR             |
      | https://reqres.in | /api/users  | Pushpalatha | Operation Head |
      | https://reqres.in | /api/users  | Shridhar    | Test Lead      |
      | https://reqres.in | /api/users  | Tejas       | Manager        |


  @SamplePost
  Scenario Outline: Check the post request of sample user
    Given url '<url>'
    And path '<path>'
    And request
    """
      {
      "name": "<name>",
      "job": "<job>"
      }
    """
    When method post
    Then status 201
    Examples:
      | dataFile |               |