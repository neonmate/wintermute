Feature: Idea text filter


  @javascript
  Scenario: Filter ideas with a query
    Given there is a idea with the title "AAA"
      And there is a idea with the title "BBB"

    When I go to the list of ideas
    Then I should see "AAA"
      And I should see "BBB"

    When I fill in "Query" with "AAA"
    Then I should not see "BBB"
      But I should see "AAA"
