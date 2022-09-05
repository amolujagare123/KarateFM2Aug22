Feature: JavaScript demos

  Scenario: Sample JavaScript demos
    Given def var1 = "amol ujagare"
    And print "def=" + var1
    * def val1 = function() { return 15; }
    And print "val1 ==>" + val1()
    * def myValue = function(var1) {return "amol" +var1;  }
    And print "myValue ==>" + myValue('java')
    * def randomValue = function() { return Math.floor(Math.random() * 1000);}
    And print "My Random Value ==>" + randomValue()
