
Feature: common chat create user request

Scenario:  check the user is added or not
Given url 'http://localhost/chat/lhc_web/index.php/site_admin'
And path '/restapi/user'
And header Authorization = call read('basic-auth.js') {username:"admin",password:"admin123"}
* def username = 'shridhar111'
* def password = 'shridhar123'
* def email = 'shridhar@gmail.com'

And request
"""
      {
          "username": "#(username)",
          "password": "#(password)",
          "email": "#(email)",
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