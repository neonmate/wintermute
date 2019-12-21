Feature: Idea messages


  @javascript
  Scenario: CRUD message
    Given there is a idea with the title "Some idea"

    When I am signed in as "thomas"
      And I go to the page for the idea above
      And I press "Reply"
    Then I should see an error flash "Message could not be saved"
      And the "Message" field should have an error

    When I fill in "Message" with "Some message"
      And I press "Reply"
    Then I should see a success flash "Message successfully saved"
      And I should be on the page for the idea above
      And I should see in this order:
      """
      Some idea
      Some message
      """

    When I follow "Edit"
    Then I should be on the form for the message above

    When I fill in "Message" with "Some other message" within the modal
      And I press "Save"
    Then I should see a success flash "Message successfully saved"
      And I should be on the page for the idea above
      And I should see "Some other message"

    When I follow "Edit"
      And I follow "Delete"
    Then I should see a success flash "Message deleted"
      And I should be on the page for the idea above
      And I should not see "Some other message"
