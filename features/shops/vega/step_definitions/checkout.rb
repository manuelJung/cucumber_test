#wga
When(/^I fill out the personal information formular$/) do
  #1 - initilalize variables
  eMail = user.eMail
  password = user.password
  company = user.company
  owner_firstname = user.owner_firstname
  owner_lastname = user.owner_lastname
  firstname = user.firstname
  lastname = user.lastname
  prefix = user.prefix
  street = user.street
  postcode = user.postcode
  city = user.city
  telephone = user.telephone
  taxvat = user.taxvat
  organumber = user.organumber
  
  company_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#billing\3a company'
  end
  
  owner_firstname_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#billing\3a owner_firstname'
  end
  
  owner_lastname_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#billing\3a owner_lastname'
  end

  prefix_selector_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#billing\3a prefix'
  end
  
  firstname_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#billing\3a firstname'
  end
  
  lastname_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#billing\3a lastname'
  end
  
  street_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#billing\3a street1'
  end
  
  postcode_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#billing\3a postcode'
  end
  
  city_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#billing\3a city'
  end
  
  telephone_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#billing\3a telephone'
  end
  
  email_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#billing\3a email'
  end
  
  password_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#billing\3a customer_password'
  end
  
  taxvat_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#billing\3a taxvat'
  end
  
  organumber_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#billing\3a organisationsnummer'
  end
  
  confirm_password_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#billing\3a confirm_password'
  end
  
  confirm_form_button_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#billing-buttons-container > button'
  end
  

  #4 - fill formular
  out 'fill formular'
  
  # fill in company
  if company
    element = page.find(company_input_path)
    element.set(company)
    out "- company: #{company}"
  else
    out "company not available in #{ENV['COUNTRY']}"
  end
  
  # fill owner firstname
  if owner_firstname
    element = page.find(owner_firstname_input_path)
    element.set(owner_firstname)
    out "- owner first name: #{owner_firstname}"
  else
    out "owner firstname not available in #{ENV['COUNTRY']}"
  end
    
  # fill owner lastname
  if owner_lastname
    element = page.find(owner_lastname_input_path)
    element.set(owner_lastname)
    out "- owner last name: #{owner_lastname}"
  else
    out "owner lastname not available in #{ENV['COUNTRY']}"
  end
  
  # fill prefix
  if prefix
    element = page.find(prefix_selector_path)
    element.select(prefix)
    out "- prefix: #{prefix}"
  else
    out "prefix not available in #{ENV['COUNTRY']}"
  end
  
  # fill firstname
  if firstname
    element = page.find(firstname_input_path)
    element.set(firstname)
    out "- first name: #{firstname}"
  else
    out "firstname not available in #{ENV['COUNTRY']}"
  end
  
  # fill lastname
  if lastname
    element = page.find(lastname_input_path)
    element.set(lastname)
    out "- last name: #{lastname}"
  else
    out "lastname not available in #{ENV['COUNTRY']}"
  end
    
  # fill street
  if street
    element = page.find(street_input_path)
    element.set(street)
    out "- street: #{street}"
  else
    out "street not available in #{ENV['COUNTRY']}"
  end
    
  # fill postcode
  if postcode
    element = page.find(postcode_input_path)
    element.set(postcode)
    out "- postcode: #{postcode}"
  else
    out "postcode not available in #{ENV['COUNTRY']}"
  end
  
  # - fill in organumber
  if organumber
    element = page.find(organumber_input_path)
    element.set(organumber)
    out "- organumber: #{organumber}"
    expect(element.value).to eq(organumber),
      "could not insert organumber '#{organumber}'"
  else
    out("organumber not available in country #{ENV['COUNTRY']}")
  end
  
  # - fill in taxvat
  if taxvat
    element = page.find(taxvat_input_path)
    element.set(taxvat)
    out "- taxvat: #{taxvat}"
    expect(element.value).to eq(taxvat),
      "could not insert taxvat '#{taxvat}'"
  else
    out("taxvat not available in country #{ENV['COUNTRY']}")
  end
    
  # fill city
  if city
    element = page.find(city_input_path)
    element.set(city)
    out "- city: #{city}"
  else
    out "city not available in #{ENV['COUNTRY']}"
  end
    
  # fill telephone
  if telephone
    element = page.find(telephone_input_path)
    element.set(telephone)
    out "- telephone: #{telephone}"
  else
    out "telephone not available in #{ENV['COUNTRY']}"
  end
    
  # fill eMail
  if eMail
    element = page.find(email_input_path)
    element.set(eMail)
    out "- eMail: #{eMail}"
  else
    out "eMail not available in #{ENV['COUNTRY']}"
  end
    
  # fill password
  if page.has_css? password_input_path
    element = page.find(password_input_path)
    element.set(password)
    out "- password: #{password}"

    element = page.find(confirm_password_input_path)
    element.set(password)
  end
  
  # - scroll down in oder that the "Trusted Shops Icon" wont cover the button
  page.execute_script "window.scrollBy(0,10000)"

  # - confirm registration formular
  element = page.find(confirm_form_button_path)
  element.click
  out 'click "next" button'
end


When(/^I confirm AGB$/) do
  #1 - initilalize variables
  
  agreement_checkbox_path = case ENV['COUNTRY']
    when 'it' then '#agreement-19'
    else '#agreement-checkbox input'
  end
  
  confirm_form_button_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#shipping-method-buttons-container > button'
  end
  
  # - agree AGB Checkbox marked
  element = page.find(agreement_checkbox_path)
  element.click
  out 'confirm AGB by checking checkbox'

  # - confirm agb formular
  element = page.find(confirm_form_button_path)
  element.click
  out 'click "ahead" button'
end

When(/^I choose pay method$/) do
  #1 - initilalize variables
  
  payment_selector_path = case ENV['COUNTRY']
    when 'ch' then '#p_method_aufrechnung'
    else '#p_method_bankpayment'
  end
  
  confirm_form_button_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#payment-buttons-container > button'
  end
  
  # - select payment method
  element = page.find(payment_selector_path)
  element.click
  out 'choose pay method: "Vorkasse"'
  
  # - scroll down in oder that the "Trusted Shops Icon" will not cover the button
  page.execute_script "window.scrollBy(0,10000)"

  # - confirm payment formular
  element = page.find(confirm_form_button_path)
  element.click
  out 'click "ahead" button'
end

Given(/^I am on the checkout page$/) do
  #1 - initilalize variables
  checkout = settings.urlHttps+'checkout/onepage/'

  # - navigate to checkout
  visit(checkout)
  out "visit #{checkout}" 
  current_url.should eq(checkout),
    "Expected the current url to be #{checkout}, but it was #{current_url}"
end

When(/^I send a correctly filled checkout formular without existing account and without creating an account$/) do
  #1 - initilalize variables
  
  guest_login_selector_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#login\3a guest'
  end
  
  confirm_selection_button_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#checkout-step-login > div > div.col-2 > div > button'
  end
  
  confirm_checkout_form_button_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#review-buttons-container > button'
  end

  #2 - click radio button
  element = page.find(guest_login_selector_path)
  element.click
  out 'click radio button "loggin as guest"'
  
  # - scroll down in oder that the "Trusted Shops Icon" wont cover the button
  page.execute_script "window.scrollBy(0,10000)"

  #3 - click "go" button
  element = page.find(confirm_selection_button_path)
  element.click
  out 'click "go" button'

  #4 - fill formular
  step("I fill out the personal information formular")
  step("I confirm AGB")
  step("I choose pay method")
  
  # - scroll down in oder that the "Trusted Shops Icon" wont cover the button
  page.execute_script "window.scrollBy(0,10000)"
  
  #7 - send formular
  element = page.find(confirm_checkout_form_button_path)
  element.click
  out 'click "send" button'
end

When(/^I send a correctly filled checkout formular with existing account$/) do
  #1 - initilalize variables
  
  confirm_billing_button_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#billing-buttons-container > button'
  end

  confirm_checkout_form_button_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#review-buttons-container > button'
  end
  
  # - scroll down in oder that the "Trusted Shops Icon" wont cover the button
  page.execute_script "window.scrollBy(0,10000)"

  #3 - choose invoice address
  element = page.find(confirm_billing_button_path)
  element.click
  out 'choose invoice address "deliver to my address"'

  #4 - fill formular
  step("I confirm AGB")
  step("I choose pay method")

  #6 - send formular
  element = page.find(confirm_checkout_form_button_path)
  element.click
  out 'click "send" button'
end

When(/^I send a correctly filled checkout formular without existing account and with creating an account$/) do
  #1 - initilalize variables
  
  registration_selector_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#login\3a register'
  end
  
  confirm_registration_button_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#checkout-step-login > div > div.col-2 > div > button'
  end
  
  confirm_checkout_form_button_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#review-buttons-container > button'
  end
  
  # - scroll down in oder that the "Trusted Shops Icon" wont cover the button
  page.execute_script "window.scrollBy(0,10000)"

  #2 - click radio button
  element = page.find(registration_selector_path)
  element.click
  out 'click radio button'

  #3 - click "go" button
  element = page.find(confirm_registration_button_path)
  element.click
  out 'click "go" button'
  #4 - fill formular
  step("I fill out the personal information formular")
  step("I confirm AGB")
  step("I choose pay method")

  #7 - send formular
  element = page.find(confirm_checkout_form_button_path)
  element.click
  out 'click "send" button'
end

Then(/^Magento should have my order$/) do
  #1 - initialize variables

  success_text_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'body > div.wrapper > div > div.cont > div.main.col1-layout > div > div.page-title'
  end
  
  transaction_ID_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'body > div.wrapper > div > div.cont > div.main.col1-layout > div > form > input[type="hidden"]:nth-child(1)'
  end

  #2 - search for success text
  page.find(success_text_path)
  
  #3 - get transaction ID
  element = page.find(transaction_ID_path, :visible => false)
  transactionID = element.value
  out "transaction ID: #{transactionID}"

  #4 - cancel order
  cancel = magento.order_cancel(transactionID)
  out "canceled order: #{cancel}"
end

Then(/^I should have a user account$/) do
  #1 - initilalize variables
  eMail = user.eMail

  #2 - search for user account
  magento.customer_exists?(eMail)
end

