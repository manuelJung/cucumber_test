class User
  attr_accessor :eMail, :password, :company, :firstname, :lastname, :prefix, :street, :postcode, :city, :telephone, :store, :website_id, :store_id, :region_id, :country_id, :taxvat, :organumber, :country, :owner_firstname, :owner_lastname
  
  def initialize
    @eMail = case ENV['COUNTRY']
      when 'de' then 'testmail_wga@test.de'
      when 'at' then 'testmail_wge@test.de'
      when 'ch' then 'testmail_wgc@test.de'
      when 'es' then 'testmail_ves@test.de'
      when 'it' then 'testmail_vit@test.de'
      when 'fr' then 'testmail_vfr@test.de'
      when 'nl' then 'testmail_vnl@test.de'
      when 'no' then 'testmail_vno@test.de'
      when 'se' then 'testmail_vse@test.de'
      when 'be' then 'testmail_vbe@test.de'
    end
    @password = case ENV['COUNTRY']
      when 'de' then '123456'
      when 'at' then '123456'
      when 'ch' then '123456'
      when 'es' then '123456'
      when 'it' then '123456'
      when 'fr' then '123456'
      when 'nl' then '123456'
      when 'no' then '123456'
      when 'se' then '123456'
      when 'be' then '123456'
    end
    @company = case ENV['COUNTRY']
      when 'de' then 'Testfirma'
      when 'at' then 'Testfirma'
      when 'ch' then 'Testfirma'
      when 'es' then 'Testfirma'
      when 'it' then 'Testfirma'
      when 'fr' then 'Testfirma'
      when 'nl' then 'Testfirma'
      when 'no' then 'Testfirma'
      when 'se' then 'Testfirma'
      when 'be' then 'Testfirma'
    end
    @taxvat = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
      when 'es' then '01234567890'
      when 'it' then '01234567890'
      when 'fr' then nil
      when 'nl' then nil
      when 'no' then nil
      when 'se' then nil
      when 'be' then nil
    end
    @organumber = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
      when 'es' then '123'
      when 'it' then '01234'
      when 'fr' then nil
      when 'nl' then '123'
      when 'no' then '012345-012'
      when 'se' then '123456-1234'
      when 'be' then nil
    end
    @country = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
      when 'es' then nil
      when 'it' then nil
      when 'fr' then 'France'
      when 'nl' then nil
      when 'no' then nil
      when 'se' then nil
      when 'be' then nil
    end
    @owner_firstname = case ENV['COUNTRY']
      when 'de' then 'Vorname'
      when 'at' then nil
      when 'ch' then nil
      when 'es' then nil
      when 'it' then nil
      when 'fr' then 'Vorname'
      when 'nl' then 'Vorname'
      when 'no' then nil
      when 'se' then nil
      when 'be' then 'Vorname'
    end
    @owner_lastname = case ENV['COUNTRY']
      when 'de' then 'Nachname'
      when 'at' then nil
      when 'ch' then nil
      when 'es' then nil
      when 'it' then nil
      when 'fr' then 'Nachname'
      when 'nl' then 'Nachname'
      when 'no' then nil
      when 'se' then nil
      when 'be' then 'Nachname'
    end
    @firstname = case ENV['COUNTRY']
      when 'de' then 'Vorname'
      when 'at' then 'Vorname'
      when 'ch' then 'Vorname'
      when 'es' then 'Vorname'
      when 'it' then 'Vorname'
      when 'fr' then 'Vorname'
      when 'nl' then 'Vorname'
      when 'no' then 'Vorname'
      when 'se' then 'Vorname'
      when 'be' then 'Vorname'
    end
    @lastname = case ENV['COUNTRY']
      when 'de' then 'Nachname'
      when 'at' then 'Nachname'
      when 'ch' then 'Nachname'
      when 'es' then 'Nachname'
      when 'it' then 'Nachname'
      when 'fr' then 'Nachname'
      when 'nl' then 'Nachname'
      when 'no' then 'Nachname'
      when 'se' then 'Nachname'
      when 'be' then 'Nachname'
    end
    @prefix = case ENV['COUNTRY']
      when 'de' then 'Herr'
      when 'at' then 'Herr'
      when 'ch' then 'Herr'
      when 'es' then 'Sr.'
      when 'it' then 'Sig.'
      when 'fr' then 'M.'
      when 'nl' then 'dhr'
      when 'no' then nil
      when 'se' then nil
      when 'be' then 'M.'
    end
    @street = case ENV['COUNTRY']
      when 'de' then 'Testweg'
      when 'at' then 'Testweg'
      when 'ch' then 'Testweg'
      when 'es' then 'Testweg'
      when 'it' then 'Testweg'
      when 'fr' then 'Testweg'
      when 'nl' then 'Testweg'
      when 'no' then 'Testweg'
      when 'se' then 'Testweg'
      when 'be' then 'Testweg'
    end
    @postcode = case ENV['COUNTRY']
      when 'de' then '12345'
      when 'at' then '1234'
      when 'ch' then '1234'
      when 'es' then '12345'
      when 'it' then '12345'
      when 'fr' then '12345'
      when 'nl' then '1234AB'
      when 'no' then '12345'
      when 'se' then '12345'
      when 'be' then '12345'
    end
    @city = case ENV['COUNTRY']
      when 'de' then 'Teststadt'
      when 'at' then 'Teststadt'
      when 'ch' then 'Teststadt'
      when 'es' then 'Teststadt'
      when 'it' then 'Teststadt'
      when 'fr' then 'Teststadt'
      when 'nl' then 'Teststadt'
      when 'no' then 'Teststadt'
      when 'se' then 'Teststadt'
      when 'be' then 'Teststadt'
    end
    @telephone = case ENV['COUNTRY']
    when 'de' then '01234567'
      when 'at' then '01234567'
      when 'ch' then '0123456789'
      when 'es' then '012345678'
      when 'it' then '0123456789'
      when 'fr' then '0123456789'
      when 'nl' then '0123456789'
      when 'no' then '012345678'
      when 'se' then '0123456789'
      when 'be' then '0123456789'
    end
    @store = case ENV['COUNTRY']
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
    @store_id = case ENV['COUNTRY']
      when 'de' then '1'
      when 'at' then '7'
      when 'ch' then '9'
      when 'es' then '39'
      when 'it' then '37'
      when 'fr' then '25'
      when 'nl' then '33'
      when 'no' then '39'
      when 'se' then '29'
      when 'be' then '25'
    end
    @website_id = case ENV['COUNTRY']
      when 'de' then '1'
      when 'at' then '3'
      when 'ch' then '5'
      when 'es' then '21'
      when 'it' then '19'
      when 'fr' then 1
      when 'nl' then 1
      when 'no' then 1
      when 'se' then 1
      when 'be' then 1
    end
    @country_id = case ENV['COUNTRY']
      when 'de' then 'DE'
      when 'at' then 'AT'
      when 'ch' then 'CH'
      when 'es' then 'ES'
      when 'it' then 'IT'
      when 'fr' then 'FR'
      when 'nl' then 'NL'
      when 'no' then 'NO'
      when 'se' then 'SE'
      when 'be' then 'FR'
    end
    @backend_region_id = case ENV['COUNTRY']
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
    @registration_form_region_id = case ENV['COUNTRY']
      when 'de' then nil
      when 'at' then nil
      when 'ch' then nil
      when 'es' then 'Península e Islas Baleares'
      when 'it' then nil
      when 'fr' then 'France métropolitaine, Corse et Monaco'
      when 'nl' then nil
      when 'no' then nil
      when 'se' then nil
      when 'be' then nil
    end
  end
end