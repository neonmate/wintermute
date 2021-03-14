Feature: Ideas CRUD


  Scenario: CRUD a idea
    When I am signed in with the nickname "thomas"
      And I go to the list of ideas
    Then I should see "We do not have any ideas yet"

    When I follow "New Idea"
    Then I should be on the idea form

    When I press "Save"
    Then I should see an error flash "Idea could not be saved"
      And the "Title" field should have an error
      And the "Description" field should have an error
      And the "Concept" field should have an error

    When I fill in "Title" with "Some title"
      And I fill in "Description" with "Some description"
      And I fill in "Concept" with "Some message"
      And I press "Save"
    Then I should see a success flash "Idea successfully saved"
      And I should be on the page for the idea above
      And I should see in this order:
        """
        Some title
        Some description
        Some message
        """

    When I follow "Edit"
    Then I should be on the form for the idea above

    When I fill in "Title" with "Some other title"
      And I press "Save"
    Then I should see a success flash "Idea successfully saved"
      And I should be on the page for the idea above
      And I should see "Some other title"

    When I follow "Back to list"
    Then I should be on the list of ideas
      And I should see "Showing page 1 of 1"
      And I should see in this order:
        """
        Some other title
        Some description
        """

    When I follow "Some other title"
      And I follow "Edit"
      And I follow "Delete"
    Then I should see a success flash "Idea deleted"
      And I should be on the list of ideas
      And I should see "We do not have any ideas yet"
