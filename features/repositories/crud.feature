Feature: Repositories CRUD


  Scenario: CRUD a repository
    When I am signed in as "thomas"
      And I go to the list of repositories
    Then I should see "We do not have any repositories yet."

    When I follow "New Repository"
    Then I should be on the repository form

    When I press "Save"
    Then I should see an error flash "Repository could not be saved"
      And the "Repository URL" field should have an error

    When I fill in "Repository URL" with "https://example.com.com/github/example"
      And I press "Save"
    Then I should see an error flash "Repository could not be saved"
      And the "Repository URL" field should have an error
      And I should see "Repository URL is invalid"

    When I fill in "Repository URL" with "https://github.com/github/example"
      And I press "Save"
    Then I should see a success flash "Repository successfully saved"
      And I should be on the page for the repository above
      And I should see in this order:
        """
        example

        Description
        –

        Repository URL
        https://github.com/github/example

        Popularity
        Stars: –
        Watchers: –
        Issues: –

        Languages
        –

        Homepage URL
        –

        License
        –

        Hunter
        thomas

        Recent changes
        """

    When I follow "Edit"
    Then I should be on the form for the repository above

    When I fill in "Repository URL" with "https://github.com/github/other_example"
      And I press "Save"
    Then I should see a success flash "Repository successfully saved"
      And I should be on the page for the repository above
      And I should see "other_example"

    When I follow "Back to list"
    Then I should be on the list of repositories
      And I should see "Showing page 1 of 1"
      And I should see in this order:
        """
        other_example
        –
        """

    When I follow "other_example"
      And I follow "Edit"
      And I follow "Delete"
    Then I should see a success flash "Repository deleted"
      And I should be on the list of repositories
      And I should see "We do not have any repositories yet."


  Scenario: Show a full filled repository
    Given there is a repository with these attributes:
      | description    | Some description           |
      | owner          | github                     |
      | name           | example                    |
      | total_stars    | 20                         |
      | total_watchers | 40                         |
      | total_issues   | 60                         |
      | languages      | ["HTML", "CSS" and "Ruby"] |
      | homepage_url   | example.github.io          |
      | licence        | MIT                        |

    When I am signed in
      And I go to the page for the repository above
    Then I should see in this order:
      """
      example

      Description
      Some description

      Repository URL
      https://github.com/github/example

      Popularity
      Stars: 20
      Watchers: 40
      Issues: 60

      Languages
      HTML, CSS, Ruby

      Homepage URL
      example.github.io

      License
      MIT
      """
