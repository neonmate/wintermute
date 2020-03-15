@javascript
Feature: User subscription feature


  Scenario: Subscribe and unsubscribe from a idea
    Given there is a idea

    When I am signed in
      And I go to the page for the idea above
    Then I should see a button with the label "Subscribe"

    When I press "Subscribe"
    Then I should see a success flash "Subscription successfully saved"
      And I should see a link labeled "Unsubscribe"

    When I follow "Unsubscribe"
      And I confirm the browser dialog
    Then I should see a success flash "Subscription deleted"
      And I should see a button with the label "Subscribe"
