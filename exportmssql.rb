require "sequel"
DB  = Sequel.connect(:adapter=>'odbc',
    :driver=>'SQL Server',
    :server=>'218.90.143.202:14338',
    :uid=>"cas",
    :pwd=>"$Ultra2013",
    :database=>'cas',
    :db_type=>'mssql') 

dic= DB['Datadic']
dic.each { |e| p e  }