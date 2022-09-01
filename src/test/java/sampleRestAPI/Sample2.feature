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
    And match response.name == 'amol'
    And match response.job == 'tester'




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
    And match response ==
    """
    {"error":false,"result":{"id":139,"username":"bhushan992","password":"$2y$10$2x8uJeiOKnRtGbH0onhO8eRbvzN5DNQU5uboCdXith3Y6osA\/xEPq","email":"bhushan@gmail.com","name":"Bhushan","filepath":"","filename":"","surname":"Patil","job_title":"","departments_ids":"2,1","skype":"","xmpp_username":"","disabled":"0","hide_online":0,"all_departments":0,"invisible_mode":0,"time_zone":"","rec_per_req":0,"session_id":"","chat_nickname":"bhushan123","operation_admin":"","inactive_mode":0,"max_active_chats":0,"auto_accept":0,"exclude_autoasign":0,"pswd_updated":1661305823,"always_on":0,"avatar":"","attr_int_1":0,"attr_int_2":0,"attr_int_3":0}}
    """


  @getSingleChatUsers
  Scenario: check the get Single chat user request
    Given url 'http://localhost/chat/lhc_web/index.php/site_admin'
    And path '/restapi/user/139'
    And header Authorization = call read('basic-auth.js') {username:"admin",password:"admin123"}
    When method get
    Then status 200
    And match response !=
    """
    {"error":true,"result":"User does not exists"}
    """


    @ChatCreateUser
    Scenario:  check the user is added or not
      Given url 'http://localhost/chat/lhc_web/index.php/site_admin'
      And path '/restapi/user'
      And header Authorization = call read('basic-auth.js') {username:"admin",password:"admin123"}
      And request
      """
      {
          "username": "shalini53",
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
      * print 'email of the user shalini ===>>>' + response.result.email
      And match response.result.email == 'shalini@example.org'



  @SamplePostSchemaValidation
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
    And match response ==
    """
      {
        "name": '#string',
        "job": '#string',
        "id": '#string',
        "createdAt": '#string'
      }
    """

  @getSingleChatUsersSchemaValidation
  Scenario: check the get Single chat user request
    Given url 'http://localhost/chat/lhc_web/index.php/site_admin'
    And path '/restapi/user/139'
    And header Authorization = call read('basic-auth.js') {username:"admin",password:"admin123"}
    When method get
    Then status 200
    And match response !=
    """
    {"error":'#boolean',"result":'#string'}
    """

  @getSingleChatUserValidSchemaValidation
  Scenario: check the get Single chat user request
    Given url 'http://localhost/chat/lhc_web/index.php/site_admin'
    And path '/restapi/user/139'
    And header Authorization = call read('basic-auth.js') {username:"admin",password:"admin123"}
    When method get
    Then status 200
    And match response ==
    """
      {
        "error": '#boolean',
        "result": {
            "id": '#number',
            "username": '#string',
            "password": '#string',
            "email": '#string',
            "name": '#string',
            "filepath": '#string',
            "filename": '#string',
            "surname": '#string',
            "job_title": '#string',
            "departments_ids": '#string',
            "skype": '#string',
            "xmpp_username": '#string',
            "disabled":'#string',
            "hide_online": '#number',
            "all_departments": '#number',
            "invisible_mode": '#number',
            "time_zone": '#string',
            "rec_per_req": '#number',
            "session_id": '#string',
            "chat_nickname":'#string',
            "operation_admin": '#string',
            "inactive_mode": '#number',
            "max_active_chats": '#number',
            "auto_accept": '#number',
            "exclude_autoasign": '#number',
            "pswd_updated": '#number',
            "always_on": '#number',
            "avatar": '#string',
            "attr_int_1": '#number',
            "attr_int_2": '#number',
            "attr_int_3": '#number'
        }
    }

"""