Feature: Product Detail Screen
  As a user, I want to view detailed information about a selected product.

Scenario: Load product details
  Given I am on the product details screen for "Microsoft Xbox"
  When the screen is loaded
  Then the product's name, price, and description should be displayed
  And the product's image should be displayed

Scenario: Check for accurate product information
  Given I am on the product details screen for "Microsoft Xbox"
  When I verify the product's price
  Then the displayed price should match the price returned by the API

Scenario: Navigate back to the product list
  Given I am on the product details screen
  When I click the back button or the "Go Back" button (if applicable)
  Then I should be redirected to the previous screen, which is likely the product list screen