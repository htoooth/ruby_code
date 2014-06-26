require "sequel"
require "pg"
require 'mysql2'

data = File.new('export.dat',"w")

PGSQL_DB = Sequel.connect(:adapter  => 'postgres',
                    :host     => '192.168.0.253',
                    :database => 'tongfang',
                    :user     => 'postgres',
                    :password => 'pg1234*')

MYSQL_DB = Sequel.connect(:adapter  => 'mysql2',
                    :host     => '192.168.0.253',
                    :port     => '3307',
                    :database => 'tongfang',
                    :user     => 'root',
                    :password => 'rootroot'
                    )

dic = MYSQL_DB[:sys_dictionary]

PGSQL_DB.fetch("select estname,districtname ,estusage_ids from estate_info where cityid =1 and forsechandhouse is true and deleted is false") do |row|
    ids = row[:estusage_ids]
    ids = ids.split(",").select {|it| it!=""}
    item_name = []
    ids.each do |id| 
        item = dic.where(:Id =>id).first
        s = item[:ItemName]
        item_name << item[:ItemName]
    end
    data.puts "#{row[:estname]}\t#{row[:districtname]}\t#{item_name.join(",")}"
end

data.close
