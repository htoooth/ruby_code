require "sequel"
require 'csv'
DB = Sequel.sqlite('d:\work_data\Industry_survey\north_tong\.project\map.db')

csv = CSV.read('d:\work_data\Industry_survey\north_tong\.project\Export_Output.csv')

header = csv[0]
body = csv[1..-1]

DB.create_table :zd do
    header.each { |e| String e }
end

#items = DB[:zd]

#body.each { |e| items.insert(Hash[header.zip(e)])}

