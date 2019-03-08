Feature: Session authentication


  Scenario: Sign in and sign out via Github
    Given I am signed in on Github with the nickname "github" and the email "github@example.com"

    When I go to the homepage
      And I follow "Sign in"
    Then I should see a success flash "Successfully signed in as github (github@example.com)"

    When I follow "Sign out"
    Then I should see a success flash "Successfully signed out"
