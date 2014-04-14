require "sequel"
require "win32ole"
require "elasticsearch"
require "hashie"

dbPath = 'd:\eclipse\CAS_old\src\publish.mdb'

DB = Sequel.ado(:conn_string=>"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=#{dbPath}")
# get all records
ds = DB[:gongdi]

code = {}
ds.each{|row| code[row[:TDYT1]]=row[:TDYT2]}
code.each{ |x,y|
    print x,"=",y
    puts 

}