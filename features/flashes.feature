Feature: Flashes

  @javascript
  Scenario: Dismiss a flash
    When I go to the list of test flash
    Then I should see "This is a test flash"

    When I press "×"
    Then I should not see "This is a test flash"
