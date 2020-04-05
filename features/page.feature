Feature: Page


  Scenario: Visit the about page that serves as root
    When I go to the homepage
    Then I should see "Wintermute aims to bring a wider attention to open source web applications for a better world."
      And "About" should link to "/about"


  Scenario: Visit the privacy page
    When I am on the homepage
    Then "Privacy" should link to "/privacy"

    When I follow "Privacy"
    Then I should see "Privacy Policy"
