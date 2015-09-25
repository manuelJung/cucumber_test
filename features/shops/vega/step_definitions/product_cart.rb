#wga
Given(/^I am on the product cart page$/) do
  #1 - initialize variables
  url = settings.urlHttp+'checkout/cart/'

  #2 - navigate to product cart
  visit(url)

  expect(current_url).to eq(url),
    "Expected the current url to be #{url}, but it was #{current_url}"
end

When(/^I remove this article from the product cart$/) do
  #1 - initilalize variables
  sku = article.sku

  product_cart_table_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#shopping-cart-table > tbody > tr.first.odd'
  end
  
  product_cart_delete_button_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td.a-center.last > a'
  end

  #2 - remove article
  page.find(product_cart_table_path, text: sku)
  element = page.find(product_cart_table_path, text: sku)
  element = element.find(product_cart_delete_button_path)
  element.click
  page.driver.browser.switch_to.alert.accept
  out "remove article by clicking the delete button in the product cart table"
end

Then(/^the cart should not contain this article$/) do
  #1 - initilalize variables
  sku = article.sku
  
  product_cart_deleted_article_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#shopping-cart-table > tbody'
  end  

  #3 - search for article
  page.has_no_css?(product_cart_deleted_article_path)
end

Then(/^I should see all necessary informations about this article within the product list of the product cart$/) do
  #1 - initilalize variables
  name = article.name
  sku = article.sku
  amount = article.amount
  color = article.color
  size = article.size
  packagingUnit = article.packagingUnit
  deliveryState = article.deliveryState
  pricePerPiece = article.pricePerPiece
  packContent = article.packContent

  
  product_cart_table_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#shopping-cart-table > tbody > tr'
  end

  product_cart_product_attributes_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td:nth-child(2)'
  end
  
  product_cart_delivery_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td:nth-child(3)'
  end
  
  product_cart_pack_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td:nth-child(4) > ul > li'
  end
  
  product_cart_pack_price_color_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'span.cart-price-colored'
  end
  
  product_cart_pack_price_reduced_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td:nth-child(4) > span > span > span > span'
  end
  
  product_cart_pack_price_not_reduced_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td:nth-child(4) > span > span > span'
  end
  
  product_cart_pack_quantity_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td:nth-child(5) > input'
  end
  
  product_cart_subtotal_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td:nth-child(6) > span > span'
  end

  #2 - find article
  page.find(product_cart_table_path, text: sku)
  element = page.find(product_cart_table_path, text: sku)

  #3 - find product attributes
  attributes = element.find(product_cart_product_attributes_path)
#  attributes.has_text?(name)
  expect(attributes.text).to include(name)
  out "- name: #{name}"
  #attributes.has_text?(sku)
  expect(attributes.text).to include(sku)
  out "- sku: #{sku}"
  #attributes.has_text?(color)
  expect(attributes.text).to include(color)
  out "- color: #{color}"
  #attributes.has_text?(size)
  expect(attributes.text).to include(size)
  out "- size: #{size}"
  # only on dach-websites
  if(ENV['COUNTRY'] == 'de') || (ENV['COUNTRY'] == 'at') || (ENV['COUNTRY'] == 'ch')
    expect(attributes.text).to include(packagingUnit)
    out "- packaging unit: #{packagingUnit}"
  end

  #4 - find delivery state
  item = element.find(product_cart_delivery_path)
  #item.has_text?(deliveryState)
  expect(item.text).to include(deliveryState)
  out "- delivery state: #{deliveryState}"

  #5 - find pack content
  item = element.find(product_cart_pack_path)
  #item.has_text?("Packinhalt: #{packContent}")
  sPackContent = packContent.to_s
  expect(item.text).to include(sPackContent)
  out "- pack content: #{packContent}"

  #6 - find price per piece
  item = element.find(product_cart_pack_path)
  expect(item.text).to include(pricePerPiece.to_s.tr(".", ","))
  out "- price per piece: #{pricePerPiece}"

  #7 - find pack price
  if (page.has_css?(product_cart_pack_price_color_path))
    item = element.find(product_cart_pack_price_reduced_path)
    out('-  article is marked down')
  else
    item = element.find(product_cart_pack_price_not_reduced_path)
  end
  price = pricePerPiece*packContent
  expect(item.text).to include(price.to_s.tr(".", ","))
  out "- pack price: #{pricePerPiece*packContent}"

  #8 - find quantity
  item = element.find(product_cart_pack_quantity_path)
  out "- quantity: #{amount}"

  #9 - find subtotal
  subtotal = pricePerPiece*packContent*amount
  item = element.find(product_cart_subtotal_path)
  expect(item.text).to include(subtotal.to_s.tr(".", ","))
  out "- subtotal: #{subtotal}"
end

When(/^I navigate to the checkout by clicking the button which navigates to the checkout$/) do
  #1 - initialize variables
  
  product_cart_button_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'body > div.wrapper > div > div.cont > div.main.col1-layout > div > div.cart > div.page-title.title-buttons > ul > li:nth-child(2) > button'
  end

  #2 - navigate to checkout by clicking button
  find(product_cart_button_path)
  element = page.find(product_cart_button_path)
  element.click
  out 'click the button which navigates to the checkout'
end

Then(/^I should be on the checkout\-page$/) do
  #1 - initilalize variables
  checkout = settings.urlHttps+'checkout/onepage/'

  #2 - check url
  expect(current_url).to eq(checkout),
    "Expected the current url to be #{checkout}, but it was #{current_url}"
end

Then(/^I should see the were worth of this article$/) do
  #1 - initilalize variables
  
  product_cart_worth_table_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#shopping-cart-totals-table'
  end
  
  product_cart_worth_subtotal_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'tbody > tr:nth-child(1)'
  end
  
  product_cart_worth_text_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td:nth-child(2) > span'
  end
  
  product_cart_worth_shipping_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'tbody > tr:nth-child(2)'
  end
  
  product_cart_worth_netto_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'tfoot > tr:nth-child(1)'
  end
  
  product_cart_worth_text_strong_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td:nth-child(2) > strong > span'
  end
  
  product_cart_worth_mwst_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'tfoot > tr:nth-child(2)'
  end
  
  product_cart_worth_gross_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'tfoot > tr:nth-child(3)'
  end

  #2 - find were worth
  page.find(product_cart_worth_table_path)
  path = page.find(product_cart_worth_table_path)

  element = path.find(product_cart_worth_subtotal_path)
  out "- subtotal: #{element.find(product_cart_worth_text_path).text}"

  element = path.find(product_cart_worth_shipping_path)
  element.has_text?('Versand (Standard - Versandkosten)')
  out "- shipping costs: #{element.find(product_cart_worth_text_path).text}"

  element = path.find(product_cart_worth_netto_path)
  element.has_text?('Warenwert (Netto)')
  out "- were worth (net): #{element.find(product_cart_worth_text_strong_path).text}"

  element = path.find(product_cart_worth_mwst_path)
  element.has_text?('19% Mwst')
  out "- 19% VAT: #{element.find(product_cart_worth_text_path).text}"

  element = path.find(product_cart_worth_gross_path)
  element.has_text?('Warenwert (Brutto)')
  out "- were worth (gross): #{element.find(product_cart_worth_text_strong_path).text}"
end
