Feature: All sample API Tests

  @SamplePost
  Scenario: Check the post request of sample user
    Given url 'https://reqres.in'
    And path '/api/users'
    And request
    """
      {
      "name": "morpheus",
      "job": "leader"
      }
    """
    When method post
    Then status 201
    And match response.name == 'morpheus'


  @getAllChatUsers
  Scenario: check the get all chat user request
    Given url 'http://localhost/chat/lhc_web/index.php/site_admin'
    And path '/restapi/getusers'
    And header Authorization = call read('basic-auth.js') {username:"admin",password:"admin123"}
    When method get
    Then status 200

  @getSingleChatUsers
    Scenario: check the get Single chat user request
    Given url 'http://localhost/chat/lhc_web/index.php/site_admin'
    And path '/restapi/user/139'
    And header Authorization = call read('basic-auth.js') {username:"admin",password:"admin123"}
    When method get
    Then status 200

    @ChatCreateUser
    Scenario:  check the user is added or not
      Given url 'http://localhost/chat/lhc_web/index.php/site_admin'
      And path '/restapi/user'
      And header Authorization = call read('basic-auth.js') {username:"admin",password:"admin123"}
      And request
      """
      {
          "username": "shalini",
          "password": "shalini123",
          "email": "shalini@example.org",
          "name": "shalini",
          "surname": "xyz",
          "chat_nickname": "sh",
          "departments": [
            1,
            2
          ],
          "departments_read": [
            2
          ],
          "department_groups": [
            1
          ],
          "user_groups": [
            1
          ]
        }
      """
      When method post
      And status 200


