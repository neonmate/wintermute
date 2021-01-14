Feature: Session authentication


  Scenario: Sign in and sign out via Github
    Given I am signed in on Github with the nickname "github" and the email "github@example.com"

    When I go to the homepage
      And I follow "Sign in"
    Then I should see a success flash "Successfully signed in as github (github@example.com)"

    When I follow "Sign out"
    Then I should see a success flash "Successfully signed out"


  Scenario: Redirect to the homepage if a signed out user is not authenticated for a protected resource
    When I go to the list of test unauthorized
    Then I should see an error flash "You need to be signed in to access this page"
      And I should be on the homepage
