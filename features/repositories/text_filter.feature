Feature: Repository text filter


  @javascript
  Scenario: Filter repositories with a query
    Given there is a repository with the name "AAA"
      And there is a repository with the name "BBB"

    When I go to the list of repositories
    Then I should see "AAA"
      And I should see "BBB"

    When I fill in "Query" with "AAA"
    Then I should not see "BBB"
      But I should see "AAA"
