require "sequel"
require "pg"

FILE = File.new('export.dat',"w")
DB = Sequel.connect(:adapter  => 'postgres',
                    :host     => '192.168.0.253',
                    :database => 'tongfang',
                    :user     => 'postgres',
                    :password => 'pg1234*')
# get all records
ds = DB[:estate_info]

traffic = ds.where(:traffic => ['',nil]).and(:deleted => false,:forcase => false,:cityid => 1)
it = ds.and(:deleted => false,:forcase => false,:cityid => 1).count()
p it
p traffic.sql

# get file info

file_table = DB[:estate_file].select(:estid).distinct(:estid)
eatid = []
file_table.each { |row| eatid << row[:estid] }
all_items = ds.and(:deleted => false,:forcase => false,:cityid => 1)
all_file = all_items.exclude(:id => eatid)
p all_file

all_file.each { |row|
    d = row[:estname].to_s
    x = row[:districtname].to_s
    FILE.puts "#{d} #{x}"
}


# traffic.each do |row|
#     d = row[:estname].to_s
#     t = row[:traffic].to_s
#     FILE.puts d 
# end



FILE.close()