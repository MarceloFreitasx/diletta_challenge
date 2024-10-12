Feature: Home Screen
   As a user, I want to be able to search for products, view my favorites, and browse the product catalog.

Scenario: Home screen should display a list of products with infinite scrolling
   Given I am on the home screen
   Then I should see a list of products, each with a clear title, image, and price
   And the list should be scrollable
   And the list should have infinite scrolling, loading more products as I scroll

Scenario: Home screen should have a functional search bar
   Given I am on the home screen
   When I enter a search term in the search bar and press Enter
   Then the list of products should be filtered to display only those matching the search term
   And the filtered list should be scrollable with infinite scrolling

Scenario: Home screen should display a favorites icon
   Given I am on the home screen
   Then I should see a favorites icon in the app bar

Scenario: Clicking a product card should navigate to the product detail screen
   Given I am on the home screen
   When I click on a product card
   Then I should be navigated to the product detail screen for that product

Scenario: Clicking the favorites icon should navigate to the favorites screen
   Given I am on the home screen
   When I click on the favorites icon
   Then I should be navigated to the favorites screen