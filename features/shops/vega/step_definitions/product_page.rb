#wga
Given(/^I am on the product page of an article$/) do
  #1 - initialize variables
  

  #2 - visit vega homepage
  step("I am on the vega-homepage")
  
  #3 - search for sku
  step("I search for an article by entering the sku in the search\-input\-field")
  step("I should be on the product page of this article")
end

When(/^I add an article to the product cart by clicking the button above the product\-list$/) do
  #1 - initialize variables
  sku = article.sku
  amount = article.amount
  
  product_page_article_table_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'li#standardset > div.a-item > table > tbody.grouped-product-row'
  end
  
  product_page_input_amount_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td.filter-qty.acc-quantity > input.input-text.qty'
  end
  
  product_page_appeared_box_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#standardset'
  end
  
  product_page_appeared_button_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#pre-cart-content > div > button'
  end


  #2 - fill formular
  page.find(product_page_article_table_path, text: sku)
  element = page.find(product_page_article_table_path, text: sku)

  element = element.find(product_page_input_amount_path)
  element.set(amount)
  out 'fill quantity input field'

  #3 - button appears
  page.find(product_page_appeared_box_path).click

  #4 - send formular
  page.find(product_page_appeared_button_path)
  element = page.find(product_page_appeared_button_path)
  element.click
  out 'click button above the product list'

end

When(/^I add an article to the product cart by clicking the button right to the product\-list$/) do
  #1 - initialize variables
  sku = article.sku
  amount = article.amount
  
  product_page_article_table_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'li#standardset > div.a-item > table > tbody.grouped-product-row'
  end
  
  product_page_input_amount_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td.filter-qty.acc-quantity > input.input-text.qty'
  end
  
  product_page_confirm_button_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'button.acc-cart'
  end

  #2 - fill formular
  page.find(product_page_article_table_path, text: sku)
  element = page.find(product_page_article_table_path, text: sku)

  field = element.find(product_page_input_amount_path)
  field.set(amount)
  out 'fill quantity input field'

  #3 - send formular
  element.find(product_page_confirm_button_path).click
  out 'click buton right to the product list'
end

Then(/^I should see a confirm\-box$/) do
  #1 - initialize variables
  
  product_page_confirm_box_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#j2t_ajax_confirm'
  end  
  #2 - check confirm box visibility
  page.has_css?(product_page_confirm_box_path, :visible => true)
end

Then(/^I should see all necessary informations about this article within the product list of the product product page$/) do
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
  
  
  product_page_article_table_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'li#standardset > div.a-item > table > tbody.grouped-product-row'
  end
  
  product_page_article_name_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td.filter-name.acc-name'
  end
  
  product_page_article_sku_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td.filter-sku'
  end
  
  product_page_article_color_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td.filter-color'
  end
  
  product_page_article_size_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td.filter-dimension'
  end
  
  product_page_article_pack_content_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td.filter-packing_amount'
  end
  
  product_page_article_price_piece_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td.filter-price'
  end
  
  product_page_article_linethrough_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'span.acc-price-linethrough'
  end
  
  product_page_article_reduced_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td.filter-price_per_package > span > span > span'
  end
  
  product_page_article_not_reduced_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'td.filter-price_per_package > span > span'
  end

  #2 - find article
  page.find(product_page_article_table_path, text: sku)
  element = page.find(product_page_article_table_path, text: sku)

  #3 - find name
  item = element.find(product_page_article_name_path)
  expect(item.text).to include(name)
  out "- name: #{item.text}"

  #4 - find sku
  item = element.find(product_page_article_sku_path)
  expect(item.text).to include(sku)
  out "- sku: #{item.text}"

  #5 - find color
  item = element.find(product_page_article_color_path)
  expect(item.text).to include(color)
  out "- color: #{item.text}"

  #6 - find size
  item = element.find(product_page_article_size_path)
  expect(item.text).to eq(size)
  out "- size: #{item.text}"

  #7 - find pack content
  item = element.find(product_page_article_pack_content_path)
  out "- pack content: #{item.text}"

  #8 - find price per piece
  item = element.find(product_page_article_price_piece_path)
  expect(item.text).to include(pricePerPiece.to_s.tr(".", ","))
  out "- price per piece: #{item.text}"

  #9 - find price per pack
  pppNet = packContent*pricePerPiece

  #check if linetrough exisits
  if(page.has_css?(product_page_article_linethrough_path))
    item = element.find(product_page_article_reduced_path)
    out('-  article is marked down')
  else
    item = element.find(product_page_article_not_reduced_path)
  end
  expect(item.text).to include(pppNet.to_s.tr(".",","))
  out "- price per pack (net): #{item.text}"

  #9 - find price per pack
  # item = element.find('#gross-price > span.price')
  # item.has_text?(pppNet+(pppNet*vat))
  # out "- price per pack (gross): #{item.text}"
end
