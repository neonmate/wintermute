Feature: Projects CRUD


  Scenario: CRUD a project
    When I go to the list of projects
    Then I should see "We do not have any projects yet."
      And I should not see a button with the label "New Project"

    When I am signed in as "github"
      And I follow "New Project"
    Then I should be on the project form

    When I press "Save"
    Then I should see an error flash "Project could not be saved"
      And the "Title" field should have an error
      And the "Subtitle" field should have an error
      And the "Description" field should have an error
      And the "Repository URL" field should have an error

    When I fill in "Title" with "Some title"
      And I fill in "Subtitle" with "Some subtitle"
      And I fill in "Description" with "Some description"
      And I fill in "Repository URL" with "https://github.com/github/example"
      And I press "Save"
    Then I should see a success flash "Project successfully saved"
      And I should be on the page for the project above
      And I should see in this order:
        """
        Some title

        Description
        Some description

        Repository URL
        https://github.com/github/example

        Hunter
        github
        """

    When I follow "Edit"
    Then I should be on the form for the project above

    When I fill in "Title" with "Some other title"
      And I press "Save"
    Then I should see a success flash "Project successfully saved"
      And I should be on the page for the project above
      And I should see "Some other title"

    When I follow "Back to list"
    Then I should be on the list of projects
      And I should see "Showing page 1 of 1"
      And I should see in this order:
          """
          Some other title
          Some subtitle
          """

    When I follow "Some other title"
      And I follow "Edit"
      And I follow "Delete"
    Then I should see a success flash "Project deleted"
      And I should be on the list of projects
      And I should see "We do not have any projects yet."
