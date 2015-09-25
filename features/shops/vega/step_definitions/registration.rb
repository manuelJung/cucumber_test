#wga
Given(/^I am on the registration page$/) do
  #1 - initialize variables
  registration = settings.urlHttps+'customer/account/login/'
  #2 - navigate to registration
  visit(registration)
  current_url.should eq(registration),
    "Expected the current url to be #{registration}, but it was #{current_url}"
end

When(/^I login with valid informations$/) do
  #1 - initialize variables
  eMail = user.eMail
  password = user.password

  registration_input_email_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#email'
  end
  
  registration_input_password_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#pass'
  end
  
  registration_confirm_button_path = case ENV['COUNTRY']
    when 'it' then 'div.registered-users #send2'
    else '#login-form #send2'
  end

  #set CSS pathes for different countries
  url = current_url

  #2 - fill eMail input field
  element = page.find(registration_input_email_path)
  element.set(eMail)
  out "fill eMail input field"

  #3 - fill password input field
  element = page.find(registration_input_password_path)
  element.set(password)
  out 'fill password input field'
  
  # - scroll down in oder that the "Trusted Shops Icon" wont cover the button
  page.execute_script "window.scrollBy(0,10000)"

  #4 - click login button
  element = page.find(registration_confirm_button_path)
  element.click
  out 'click login button'
  current_url.should_not eq(url),
    "clicked the login button but did not change the url"
end

Then(/^I should be on my account page$/) do
  #1 - initialize variables
  customer_account_url=settings.urlHttps+'customer/account/'
  
  
  # check if I am on the customer account page
  expect(current_url).to include(customer_account_url),
    "did not land on the customer account page"
end

When(/^I create an new account with my data$/) do
  #1 - initialize variables
  eMail = user.eMail
  password = user.password
  company = user.company
  firstname = user.firstname
  lastname = user.lastname
  owner_firstname = user.owner_firstname
  owner_lastname = user.owner_lastname
  prefix = user.prefix
  street = user.street
  postcode = user.postcode
  city = user.city
  telephone = user.telephone
  organumber = user.organumber
  taxvat = user.taxvat
  
  url_createAccount = settings.urlHttps+"customer/account/create/"
  
  registration_create_account_button_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'div.new-users > div > button'
  end
  
  registration_confirm_formular_button_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#form-validate > div.buttons-set.form-buttons > button'
  end
  
  registration_form_email_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#email_address'
  end
  
  registration_form_password_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#password'
  end
  
  registration_form_password_confirm_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#confirmation'
  end
  
  registration_form_company_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#company'
  end
  
  registration_form_prefix_selector_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#prefix'
  end
  
  registration_form_owner_firstname_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#owner_firstname'
  end
  
  registration_form_owner_lastname_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#owner_lastname'
  end
  
  registration_form_firstname_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#firstname'
  end
  
  registration_form_lastname_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#lastname'
  end
  
  registration_form_street_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#street_1'
  end
  
  registration_form_postcode_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#postcode'
  end
  
  registration_form_city_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#city'
  end
  
  registration_form_telephone_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#telephone'
  end
  
  registration_form_organumber_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#organisationsnummer'
  end
  
  registration_form_taxvat_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#taxvat'
  end
  

  #2 - click "create account" button
  element = page.find(registration_create_account_button_path)
  element.click
  out 'click "create account" button'
  current_url.should eq(url_createAccount),
    'did not visit the createAccount-page after clicking the "create account" button'

  #3 - fill formular
  out 'fill formular'
  
  # - fill in company
  if company
    element = page.find(registration_form_company_input_path)
    element.set(company)
    out "- company: #{company}"
    expect(element.value).to eq(company),
      "could not insert variable '#{company}'"
  else
    out("company not available in country #{ENV['COUNTRY']}")
  end
  
  # - fill in prefix
  if prefix
    element = page.find(registration_form_prefix_selector_path)
    element.select(prefix)
    out "- prefix: #{prefix}"
    expect(element.value).to eq(prefix),
      "could not insert variable '#{prefix}'"
  else
    out("prefix not available in country #{ENV['COUNTRY']}")
  end
  
  # - fill in owner_firstname
  if owner_firstname
    element = page.find(registration_form_owner_firstname_input_path)
    element.set(owner_firstname)
    out "- owner_firstname: #{owner_firstname}"
    expect(element.value).to eq(owner_firstname),
      "could not insert variable '#{owner_firstname}'"
  else
    out("owner_firstname not available in country #{ENV['COUNTRY']}")
  end
  
  # - fill in owner_lastname
  if owner_lastname
    element = page.find(registration_form_owner_lastname_input_path)
    element.set(owner_lastname)
    out "- owner_lastname: #{owner_lastname}"
    expect(element.value).to eq(owner_lastname),
      "could not insert variable '#{owner_lastname}'"
  else
    out("owner_lastname not available in country #{ENV['COUNTRY']}")
  end
  
  # - fill in firstname
  if firstname
    element = page.find(registration_form_firstname_input_path)
    element.set(firstname)
    out "- firstname: #{firstname}"
    expect(element.value).to eq(firstname),
      "could not insert variable '#{firstname}'"
  else
    out("firstname not available in country #{ENV['COUNTRY']}")
  end
  
  # - fill in lastname
  if lastname
    element = page.find(registration_form_lastname_input_path)
    element.set(lastname)
    out "- lastname: #{lastname}"
    expect(element.value).to eq(lastname),
      "could not insert variable '#{lastname}'"
  else
    out("lastname not available in country #{ENV['COUNTRY']}")
  end
  
  # - fill in organumber
  if organumber
    element = page.find(registration_form_organumber_input_path)
    element.set(organumber)
    out "- organumber: #{organumber}"
    expect(element.value).to eq(organumber),
      "could not insert organumber '#{organumber}'"
  else
    out("organumber not available in country #{ENV['COUNTRY']}")
  end
  
  # - fill in taxvat
  if taxvat
    element = page.find(registration_form_taxvat_input_path)
    element.set(taxvat)
    out "- taxvat: #{taxvat}"
    expect(element.value).to eq(taxvat),
      "could not insert taxvat '#{taxvat}'"
  else
    out("taxvat not available in country #{ENV['COUNTRY']}")
  end
  
  # - fill in street
  if street
    element = page.find(registration_form_street_input_path)
    element.set(street)
    out "- street: #{street}"
    expect(element.value).to eq(street),
      "could not insert variable '#{street}'"
  else
    out("street not available in country #{ENV['COUNTRY']}")
  end
  
  # - fill in postcode
  if postcode
    element = page.find(registration_form_postcode_input_path)
    element.set(postcode)
    out "- postcode: #{postcode}"
    expect(element.value).to eq(postcode),
      "could not insert variable '#{postcode}'"
  else
    out("postcode not available in country #{ENV['COUNTRY']}")
  end
  
  # - fill in city
  if city
    element = page.find(registration_form_city_input_path)
    element.set(city)
    out "- city: #{city}"
    expect(element.value).to eq(city),
      "could not insert variable '#{city}'"
  else
    out("city not available in country #{ENV['COUNTRY']}")
  end
  
  # - fill in telephone
  if telephone
    element = page.find(registration_form_telephone_input_path)
    element.set(telephone)
    out "- telephone: #{telephone}"
    expect(element.value).to eq(telephone),
      "could not insert variable '#{telephone}'"
  else
    out("telephone not available in country #{ENV['COUNTRY']}")
  end
  
  # - fill in eMail
  if eMail
    element = page.find(registration_form_email_input_path)
    element.set(eMail)
    out "- eMail: #{eMail}"
    expect(element.value).to eq(eMail),
      "could not insert variable '#{eMail}'"
  else
    out("eMail not available in country #{ENV['COUNTRY']}")
  end
  
  # - fill in password & confirmed password
  if password
    element = page.find(registration_form_password_input_path)
    element.set(password)
    out "- password: #{password}"
    element = page.find(registration_form_password_confirm_input_path)
    element.set(password)
    expect(element.value).to eq(password),
      "could not insert variable '#{password}'"
  else
    out("password not available in country #{ENV['COUNTRY']}")
  end

  #3 - send formular
  element = page.find(registration_confirm_formular_button_path)
  element.click
  out 'clicked send button'
  current_url.should_not eq(url_createAccount),
    'could not send the formular'
end
