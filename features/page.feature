Feature: Page


  Scenario: Visit the about page that serves as root
    When I go to the homepage
    Then I should see "Wintermute tries to achieve a wider adaption of open source web applications."
      And "About" should link to "/about"


  Scenario: Visit the privacy page
    When I am on the homepage
    Then "Privacy" should link to "/privacy"

    When I follow "Privacy"
    Then I should see "Privacy Policy"
