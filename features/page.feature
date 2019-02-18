Feature: Page

  Scenario: Visit the privacy page

    Given I am on the homepage
    Then "Privacy" should link to "/privacy"

    When I follow "Privacy"
    Then I should see "Privacy Policy"
