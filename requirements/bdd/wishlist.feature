Feature: Wishlist Screen
  As a user, I want to manage my list of favorite products.

Scenario: Wishlist should display a list of wishlisted products
  Given I have added products to my wishlist
  When I navigate to the wishlist screen
  Then I should see a list of my wishlisted products, each with a clear title, image, and price
  And the list should be scrollable with infinite scrolling

Scenario: Wishlist should allow removing products
  Given I have a product in my wishlist
  When I tap the "Remove" button or icon next to the product
  Then the product should be removed from the wishlist

Scenario: Wishlist should allow viewing product details
  Given I have a product in my wishlist
  When I tap on the product card
  Then I should be navigated to the product detail screen for that product

Scenario: Wishlist should be persistent across app sessions
  Given I have added products to my wishlist
  When I close and reopen the app
  Then my wishlist should still contain the previously added products