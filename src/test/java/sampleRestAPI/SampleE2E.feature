Feature:  Chat user E2E requests

@ChatCreateUserE2E
Scenario:  check the user is added or not
Given url 'http://localhost/chat/lhc_web/index.php/site_admin'
And path '/restapi/user'
And header Authorization = call read('basic-auth.js') {username:"admin",password:"admin123"}
  * def randomValue = function() { return Math.floor(Math.random() * 1000);}
  * def userId = randomValue()
  * print userId
And request
"""
      {
          "username": "shalini115",
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
Then status 200
  * print response.result.id
  * def resultId =  response.result.id

Given url 'http://localhost/chat/lhc_web/index.php/site_admin'
And path '/restapi/user/' + resultId
  And header Authorization = call read('basic-auth.js') {username:"admin",password:"admin123"}
  When method get
  Then status 200



  @ChatCreateUserExternalFeature
  Scenario:  check the user is added or not using External Feature

    Given def createUser = call read('commonChatCreateUser.feature')
    * print "result=>>" + createUser.resultId
    And url 'http://localhost/chat/lhc_web/index.php/site_admin'
    And path '/restapi/user/' + createUser.resultId
    And header Authorization = call read('basic-auth.js') {username:"admin",password:"admin123"}
    When method get
    Then status 200



  @ChatCreateUserExternalFeature2
  Scenario:  check the user is added or not using External Feature2

    Given  def user = 'shailesh111'
    * def pass = 'shailesh123'
    * def userEmail = 'shailesh@gmail.com'

    Given def createUser = call read('commonChatCreateUser1.feature') {"username": '#(user)',"password": '#(pass)',"email": '#(userEmail)', }
    * print "result=>>" + createUser.resultId
    And url 'http://localhost/chat/lhc_web/index.php/site_admin'
    And path '/restapi/user/' + createUser.resultId
    And header Authorization = call read('basic-auth.js') {username:"admin",password:"admin123"}
    When method get
    Then status 200