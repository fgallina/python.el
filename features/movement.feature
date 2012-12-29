Feature: Movement

  Scenario: Go to start of def
    When I turn on python-mode
    And I insert:
       """
       def function():
           pass
       """
    And I go to word "pass"
    And I press "C-M-a"
    Then the cursor should be before "def function"
