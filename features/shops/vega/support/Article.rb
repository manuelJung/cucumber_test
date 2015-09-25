class Article
  attr_accessor :sku, :amount, :name, :color, :size, :packagingUnit, :deliveryState, :pricePerPiece, :packContent
  
  def initialize
    @sku = case ENV['COUNTRY']
      when 'de' then '93876i1'
      when 'at' then '93876i1'
      when 'ch' then '93876i1'
      when 'es' then '93876i1'
      when 'it' then '93876i1'
      when 'fr' then '93876i1'
      when 'nl' then '93876i1'
      when 'no' then '93876i1'
      when 'se' then '93876i1'
      when 'be' then '93876i1'
    end
    @amount = case ENV['COUNTRY']
      when 'de' then 2
      when 'at' then 2
      when 'ch' then 2
      when 'es' then 2
      when 'it' then 2
      when 'fr' then 2
      when 'nl' then 2
      when 'no' then 2
      when 'se' then 2
      when 'be' then 2
    end
    @name = case ENV['COUNTRY']
      when 'de' then 'Loungetisch Melrose'
      when 'at' then 'Loungetisch Melrose'
      when 'ch' then 'Loungetisch Melrose'
      when 'es' then 'Mesa cuadrada Melrose'
      when 'it' then 'Tavolino Piccolo Oasi'
      when 'fr' then 'Série mobilier Florida'
      when 'nl' then 'Loungetafel Melrose'
      when 'no' then 'Loungebord Melrose kvadratiskt'
      when 'se' then 'Soffbord Melrose'
      when 'be' then 'Série mobilier Florida'
    end
    @color = case ENV['COUNTRY']
      when 'de' then 'weiß'
      when 'at' then 'weiß'
      when 'ch' then 'weiss'
      when 'es' then 'blanco'
      when 'it' then 'bianco'
      when 'fr' then 'blanc'
      when 'nl' then 'wit'
      when 'no' then 'vit'
      when 'se' then 'vit'
      when 'be' then 'blanc'
    end
    @size = case ENV['COUNTRY']
      when 'de' then 'BxTxH=45x45x45 cm'
      when 'at' then 'BxTxH=45x45x45 cm'
      when 'ch' then 'BxTxH=45x45x45 cm'
      when 'es' then 'AnxLgxAt 45 x 45 x 45 cm'
      when 'it' then 'LxPxH 45x45x45 cm'
      when 'fr' then 'L x P x H : 45 x 45 x 45 cm'
      when 'nl' then nil
      when 'no' then '(BxTxH) 45x45x45 cm'
      when 'se' then '(BxTxH) 45x45x45 cm'
      when 'be' then 'L x P x H : 45 x 45 x 45 cm'
    end
    @packagingUnit = case ENV['COUNTRY']
      when 'de' then 'Stk'
      when 'at' then 'Stk'
      when 'ch' then 'Stk'
      when 'es' then nil
      when 'it' then nil
      when 'fr' then 'pièce'
      when 'nl' then 'stuk'
      when 'no' then 'styck'
      when 'se' then 'styck'
      when 'be' then 'pièce'
    end
    @deliveryState = case ENV['COUNTRY']
      when 'de' then 'sofort lieferbar'
      when 'at' then 'sofort lieferbar'
      when 'ch' then 'sofort lieferbar'
      when 'es' then 'Disponible'
      when 'it' then 'Disponibile a magazzino'
      when 'fr' then 'disponible'
      when 'nl' then 'Direct leverbaar'
      when 'no' then 'På lager'
      when 'se' then 'I lager'
      when 'be' then 'disponible'
    end
    @pricePerPiece = case ENV['COUNTRY']
      when 'de' then 19.99
      when 'at' then 21.99
      when 'ch' then 38.00
      when 'es' then 29.99
      when 'it' then 30.50
      when 'fr' then 30.00
      when 'nl' then 30.00
      when 'no' then 259.00
      when 'se' then 259.00
      when 'be' then 30.00
    end
    @packContent = case ENV['COUNTRY']
      when 'de' then 1
      when 'at' then 1
      when 'ch' then 1
      when 'es' then 1
      when 'it' then 1
      when 'fr' then 1
      when 'nl' then 1
      when 'no' then 1
      when 'se' then 1
      when 'be' then 1
    end
  end
end