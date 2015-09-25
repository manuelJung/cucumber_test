#wga
Given(/^I am on the vega\-homepage$/) do
  #1 - initialize variables
  homepage = settings.urlHttp
  #2 - navigate to homepage
  visit(homepage)
  current_url.should eq(homepage),
    "Expected the current url to be #{homepage}, but it was #{current_url}"
  prevent_popup
end

Given(/^no user account with my data exists$/) do
  #1 - initialize variables
  eMail = user.eMail

  #2 - delete user
  if magento.customer_exists?(eMail)
    cancel = magento.delete_customers(eMail)
    out "deleted customer: #{cancel}"
  end
end

Given(/^I already created an user account$/) do
  if magento.customer_exists?(user.eMail) == false
    customer = magento.create_customer(user)
    out "matched customer: #{customer}"
  end
end

Given(/^I am logged in$/) do
  step("I am on the registration page")
  step("I login with valid informations")
end

Given(/^the product cart contains an article$/) do
  #1 - initilalize variables
  step("I am on the vega\-homepage")
  add_to_cart(article.sku, article.amount)
  out "added #{article.amount} articles with sku #{article.sku}"
end



Then(/^I should see this article in the product cart$/) do
  #1 - initilalize variables
  

  #2 - navigate to product cart
  step("I am on the product cart page")
  out "navigated to product cart"

  #3 - find article and amount
  step("I should see all necessary informations about this article within the product list of the product cart")
end