class Settings
  attr_accessor :urlHttp, :urlHttps, :urlBackend, :baby_steps, :vat
  
  def initialize
    if ENV['SYSTEM'] == "int"
      @urlHttp = case ENV['COUNTRY']
        when 'de' then 'http://intcewga.emmos.de/'
        when 'at' then 'http://intcewge.emmos.de/'
        when 'ch' then 'http://intcewgc.emmos.de/'
        when 'es' then 'http://intceves.emmos.de/'
        when 'it' then 'http://intcevit.emmos.de/'
        when 'fr' then 'http://intcevfa.emmos.de/'
        when 'nl' then 'http://intcevnl.emmos.de/'
        when 'no' then 'http://intcevno.emmos.de/'
        when 'se' then 'http://intcevse.emmos.de/'
        when 'be' then 'http://intcevfa.emmos.de/'
      end
      
      @urlHttps = case ENV['COUNTRY']#Important:write 's
        when 'de' then 'http://intcewga.emmos.de/'
        when 'at' then 'http://intcewge.emmos.de/'
        when 'ch' then 'http://intcewgc.emmos.de/'
        when 'es' then 'http://intceves.emmos.de/'
        when 'it' then 'http://intcevit.emmos.de/'
        when 'fr' then 'http://intcevfa.emmos.de/'
        when 'nl' then 'http://intcevnl.emmos.de/'
        when 'no' then 'http://intcevno.emmos.de/'
        when 'se' then 'http://intcevse.emmos.de/'
        when 'be' then 'http://intcevfa.emmos.de/'
      end
      
      @urlBackend = 'http://magentointce.emmos.de'
    end
    if ENV['SYSTEM'] == "live"
      @urlHttp = case ENV['COUNTRY']
        when 'de' then 'http://www.vega-direct.com/'
        when 'at' then 'http://www.vega-direct.at/'
        when 'ch' then 'http://www.vega-ch.com/'
        when 'es' then 'http://www.vega-es.com/'
        when 'it' then 'http://www.vega-direct.it/'
        when 'fr' then 'http://www.vega-fr.com/'
        when 'nl' then 'http://www.vega-direct.nl/'
        when 'no' then 'http://www.vega-direkt.no/'
        when 'se' then 'http://www.vega-direkt.se/'
        when 'be' then 'http://www.vega-fr.com/'
      end
      
      @urlHttps = case ENV['COUNTRY']
        when 'de' then 'https://www.vega-direct.com/'
        when 'at' then 'https://www.vega-direct.at/'
        when 'ch' then 'https://www.vega-ch.com/'
        when 'es' then 'https://www.vega-es.com/'
        when 'it' then 'https://www.vega-direct.it/'
        when 'fr' then 'https://www.vega-fr.com/'
        when 'nl' then 'https://www.vega-direct.nl/'
        when 'no' then 'https://www.vega-direkt.no/'
        when 'se' then 'https://www.vega-direkt.se/'
        when 'be' then 'https://www.vega-fr.com/'
      end
      
      @urlBackend = 'http://magentodevce.emmos.de'
    end
    @baby_steps = true
    @vat = 0.19
  end
end