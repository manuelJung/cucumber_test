#wga
When(/^I add an article by direct ordering$/) do
  #1 - initialize variables
  homepage = settings.urlHttp
  sku = article.sku
  amount = article.amount
  
  
  direct_ordering_formular_path = case ENV['COUNTRY']
    when 'it' then 'body > div.wrapper > div > div.header-container > div.header-tabbed > div.header-panel.header > div > div > div > span'
    else 'body > div.wrapper > div > div.header-container > div.header > div.header-panel > div > div.quick-access > div > span'
  end
  
  direct_ordering_sku_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#direct-shoping > div > ul > li:nth-child(2) > div.input-box.input-box-large.ajax-order-input > input'
  end
  
  direct_ordering_amount_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#direct-shoping > div > ul > li:nth-child(2) > div:nth-child(2) > input'
  end
  
  direct_ordering_confirm_button_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#send2 > span > span'
  end
  
  
  #2 - navigate to homepage
  visit(homepage)
 
  #2 - open formular for direct ordering
  element = page.find(direct_ordering_formular_path)
  element.click
  out 'opened formular for direct ordering'

  #3 - fill formular
  element = page.find(direct_ordering_sku_input_path)
  element.set(sku)
  out "filled sku input field: #{sku}"
  
  element = page.find(direct_ordering_amount_input_path)
  element.set(amount)
  out "filled quantitiy input field: #{amount}"

  #prevent_popup
  #4 - send formular
  element = page.find(direct_ordering_confirm_button_path)
  element.click
  out 'clicked send button'
  out "current_url: #{current_url}"
end

Then(/^I should see a box which tells me, that I added my article$/) do
  #first close f. popup

  
  #1 - initilalize variables
  name = article.name
  amount = article.amount
  
  direct_ordering_popup_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#dynamicTopCartContent'
  end
  
  direct_ordering_css_name_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#cart-sidebar > li > div > p'
  end
  
  direct_ordering_css_amount_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#cart-sidebar > li > div > div.dynamictopcart-product-amount'
  end

  # search for direct_ordering_popup_path
  page.find(direct_ordering_popup_path, :visible => true)
  # box = page.find(direct_ordering_popup_path, :visible => true)
  
  # element = box.find(direct_ordering_css_name_path)
  # element.has_text? name

  # element = box.find(direct_ordering_css_amount_path)
  # element.has_text? amount
end