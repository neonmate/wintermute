@javascript
Feature: User subscription feature


  Scenario: Subscribe and unsubscribe from a repository
    Given there is a repository

    When I am signed in
      And I go to the page for the repository above
    Then I should see a button with the label "Subscribe"
      And I should see "0 subscriptions"

    When I press "Subscribe"
    Then I should see a success flash "Subscription successfully saved"
      And I should see a link labeled "Unsubscribe"
      And I should see "1 subscriptions"

    When I follow "Unsubscribe"
      And I confirm the browser dialog
    Then I should see a success flash "Subscription deleted"
      And I should see a button with the label "Subscribe"
      And I should see "0 subscriptions"
