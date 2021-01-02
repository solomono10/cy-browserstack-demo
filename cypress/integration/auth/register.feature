Feature: Account Registration

  # Scenario Outline: As a user, I can register an account

  #   Given I am on the registration page
  #   And I see "Join My Club" in the title
  #   When I register with <firstName>, <lastName> and <email>
  #   Then I should see a success message 'Welcome Solomon!'

  #   Examples:
  #     | firstName | lastName | email            |
  #     | Solomon   | Omo      | solomon@test.com |

  @browserstack
  Scenario Outline: As a user, I can request a catalogue

    Given I am on the registration page
    And I request a catalogue with <firstName>, <lastName>, <email> and <address>
    Then I should see a success message 'Welcome Solomon!'

    Examples:
      | firstName | lastName | email        | address |
      | Solomon   | Omo      | sol@test.com | London  |
