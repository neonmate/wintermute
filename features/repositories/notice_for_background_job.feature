Feature: Repository notice for background job


  Scenario: A new repository informs about unsynchronized repositories
    Given there is a repository with the name "New Repository"
      And there is a repository with the name "Old Repository" and the last synchronized at "2018-01-01"

    When I go to the page for the repository "New Repository"
    Then I should see "This Repository does not show all information from Github"

    When I go to the page for the repository "Old Repository"
    Then I should not see "This Repository does not show all information from Github"
