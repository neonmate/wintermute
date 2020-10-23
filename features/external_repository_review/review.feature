Feature: External repository review

  @javascript
  Scenario: Add an external repository to the existing repositories
    Given I am signed in as admin
      And there is an external repository review with these attributes:
        | identifier   | neonmate/wintermute    |
        | homepage url | https://wintermute.app |

    When I go to the list of external repository reviews
    Then I should see a table with exactly the following rows:
      | Github URL                             | Website                |
      | https://github.com/neonmate/wintermute | https://wintermute.app |

    When I press "Add"
    Then I should see a success flash "External Repository Review successfully saved"
      And I should be on the list of external repository reviews
      And I should see "No pending reviews."

    When I go to the list of repositories
    Then I should see "wintermute"


  @javascript
  Scenario: Add an external repository to the existing repositories
    Given I am signed in as admin
      And there is an external repository review with these attributes:
        | identifier   | neonmate/wintermute    |
        | homepage url | https://wintermute.app |

    When I go to the list of external repository reviews
    Then I should see a table with exactly the following rows:
      | Github URL                             | Website                |
      | https://github.com/neonmate/wintermute | https://wintermute.app |

    When I press "Reject"
    Then I should see a success flash "External Repository Review successfully saved"
      And I should be on the list of external repository reviews
      And I should see "No pending reviews."

    When I go to the list of repositories
    Then I should see "We do not have any repositories yet."


  @javascript
  Scenario: Trying to add an existing repository will show an error message
    Given I am signed in as admin
      And there is an external repository review with these attributes:
        | identifier   | neonmate/wintermute    |
        | homepage url | https://wintermute.app |
      And there is a repository with the owner "neonmate" and the name "wintermute"

    When I go to the list of external repository reviews
    Then I should see "https://github.com/neonmate/wintermute"

    When I press "Add"
    Then I should see an error flash "Repository already exists"
      And I should see "https://github.com/neonmate/wintermute"

    When I press "Reject"
    Then I should see a success flash "External Repository Review successfully saved"
      And I should see "No pending reviews."
