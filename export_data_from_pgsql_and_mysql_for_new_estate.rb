#encoding: utf-8
require "sequel"
require "pg"
require 'mysql2'

# 导出新房的数据

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

# 二手房的数据导出，用forsechandhouse指定
PGSQL_DB.fetch("select estname,districtname ,estusage_ids from estate_info where cityid =1 and forsechandhouse is false and deleted is false") do |row|
    ids = row[:estusage_ids]
    if ids.nil?
        next
    end
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
