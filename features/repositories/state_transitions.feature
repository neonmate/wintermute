Feature: Repositories state transitions


  Scenario: It allows to change the state of a repository
    When I am signed in as admin
      And I go to the list of repositories
      And I follow "New Repository"
    Then I should see a button with the label "Publish"
      And I should see a button with the label "Save"

    When I fill in "Repository URL" with "https://github.com/github/example"
      And I press "Save"

    Then I should see a success flash "Repository successfully saved"
      And I should see "State Draft"

    When I follow "Edit"
      And I press "Publish"
    Then the "Preview image" field should have an error
      And I should see "Preview image can't be blank"
      And I should see "Delivery model can't be blank"
      And I should see "Categories can't be blank"

    When I attach the file "spec/fixtures/files/image_1.jpg" to "Preview image"
      And I select "SaaS" from "Delivery model"
      And I fill in "Categories" with "service, managment"
      And I press "Publish"
    Then I should see a success flash "Repository successfully saved"
      And I should see "State Published"

    When I follow "Edit"
    Then I should see a button with the label "Reject"
      And I should see a button with the label "Save"

    When I press "Reject"
    Then I should see a success flash "Repository successfully saved"
      And I should see "State Rejected"
