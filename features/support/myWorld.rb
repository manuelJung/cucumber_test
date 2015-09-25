module MyWorld
  
  def settings
    @settings ||= Settings.new
  end
  
  def article
  	@article ||= Article.new
  end
  
  def user
    @user ||= User.new
  end
  
  def magento
    @magento ||=MagentoAPI.new(settings.urlBackend,ENV['MAGENTO_USERNAME'],ENV['MAGENTO_PASSWORD'])
  end
  
  def out(msg)
  	if settings.baby_steps then puts msg end
  end
  
  def error_msg(msg)
    puts "<ERROR>#{msg}<ERROR>"
  end
  
  def add_to_cart(sku, amount)
    page.driver.browser.execute_script("
      function myAddToCartFunction()
      {
  	    var formData = new FormData();
  	    formData.append('article_code[0]','"+sku+"');
  	    formData.append('article_qty[0]','"+amount.to_s+"');
  	    
  	    if(window.XMLHttpRequest)
  	    {
  	      r = new XMLHttpRequest();
  	  	  r.open('POST', '/order/order/orderBySku/', false);
  	  	  //r.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  	  	  r.send(formData);
  	    }
      }
      myAddToCartFunction();
      ")
  end
  
  #js-function for closing new iframe of newsletter-pop
  def prevent_popup
    page.driver.browser.execute_script("
      var now=new Date();
      document.cookie=\"emnlpc=1; expires=\" +now.toGMTString() +\"; path=/\";
    ")
    puts "treated popup"
  end

end

World(MyWorld)
