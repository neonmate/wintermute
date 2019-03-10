Feature: Project text filter


  @javascript
  Scenario: Filter projects with a query
    Given there is a project with the title "AAA"
      And there is a project with the title "BBB"

    When I go to the list of projects
    Then I should see "AAA"
      And I should see "BBB"

    When I fill in "Query" with "AAA"
    Then I should not see "BBB"
      But I should see "AAA"
