#wga
When(/^I search for an article by entering the sku in the search\-input\-field$/) do
  #1 - initilalize variables
  sku = article.sku
  url = current_url
  
  searchfield_input_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#search'
  end
  
  seachfield_confirm_button_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#search_mini_form > div > button'
  end
 
  #2 - input sku in search-field
  page.find(searchfield_input_path)
  element = page.find(searchfield_input_path)
  element.set(sku)
  element.value.should eq(sku),
    "value of search-field should be #{sku}, but it was #{element.value}"
  out "input sku '#{sku}' in search-field"

  #4 - click search button
  element = page.find(seachfield_confirm_button_path)
  element.click
  current_url.should_not eq(url),
  "did not visit the product-page after clicking the search button"
    out "click search button"
end

Then(/^I should be on the product page of this article$/) do
  #1 - initilalize variables
  name = article.name
  
  search_table_accordeontab_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '#standardset > div.a-item > table'
  end
  
  search_table_row_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else '.grouped-product-row'
  end
  
  search_table_article_name_path = case ENV['COUNTRY']
    when 'COUNTRY' then ''
    else 'tr.grouped-product-row-top > td.acc-name'
  end

  #2 - find article
  accordeontab = page.find(search_table_accordeontab_path)
  row = accordeontab.find(search_table_row_path, text:article.sku)
  element = row.find(search_table_article_name_path)
  expect(element.text).to include(name)
end
