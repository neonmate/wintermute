Feature: Conversations CRUD


  Scenario: CRUD a conversation
    When I am signed in as "thomas"
      And I go to the list of conversations
    Then I should see "We do not have any conversations yet"

    When I follow "New Conversation"
    Then I should be on the conversation form

    When I press "Save"
    Then I should see an error flash "Conversation could not be saved"
      And the "Title" field should have an error
      And the "Message" field should have an error

    When I fill in "Title" with "Some title"
      And I fill in "Message" with "Some message"
      And I press "Save"
    Then I should see a success flash "Conversation successfully saved"
      And I should be on the page for the conversation above
      And I should see in this order:
        """
        Some title
        Some message
        """

    When I follow "Edit Conversation"
    Then I should be on the form for the conversation above

    When I fill in "Title" with "Some other title"
      And I press "Save"
    Then I should see a success flash "Conversation successfully saved"
      And I should be on the page for the conversation above
      And I should see "Some other title"

    When I follow "Back to list"
    Then I should be on the list of conversations
      And I should see "Showing page 1 of 1"
      And I should see in this order:
        """
        Some other title
        Some message
        """

    When I follow "Some other title"
      And I follow "Edit Conversation"
      And I follow "Delete"
    Then I should see a success flash "Conversation deleted"
      And I should be on the list of conversations
      And I should see "We do not have any conversations yet"
