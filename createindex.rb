require "sequel"
require "win32ole"
require "elasticsearch"
require "hashie"

dbPath = 'd:\publish.mdb'

DB = Sequel.ado(:conn_string=>"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=#{dbPath}")
# get all records
ds = DB[:pidi]
# get first record
p ds.first[:NF]
p DB
# get all column name
p ds.columns

# get row
# p ds.each{|row| p row[:XMMC]}

# get elasticsearch client
ES = Elasticsearch::Client.new(host:'localhost:9200',log:true)

# get search
# response = ES.search body:{query:{match:{title:'ki'}}}

# create hash map
# mash = Hashie::Mash.new response

# get results
# results = mash.hits.hits

# loop per result
# results.each{
#     |r| p r._source.title
# }

# ES.indices.delete index:['cas','xxx']
# ES.index index: 'cas',
#         type: :pidi.to_s,
#         body:{
#             XMMC: ds.first[:XMMC]
#         }

# return the number of records
# ds.count

# ES.indices.create index:'cas',
#     body:{
#         settings:{
#             index:{
#                 refresh_interval:-1
#             }
#         },
#         mappings:{
#             document:{
#                 properties:{
#                     pidi:{
#                         type:'multi_field',
#                         fields:{
#                             XMMC:{
#                                 type:'string',
#                                 analyzer:'',
#                                 store:'no',
#                                 term_vector:'with_positions_offsets',
#                                 index_analyzer:'ik',
#                                 search_analyzer:'ik'
#                             },
#                             author:{
#                                 type:'string',
#                                 index:'not_analyzed'
#                             },
#                             publish_date:{
#                                 type:'date',
#                                 format:'yyyy/MM/dd',
#                                 index:'not_analyzed'
#                             }
#                         }
#                     }
#                 }
#             }
#         }
#     }

# ds.first(4).each{ 
#     |row| ES.index index: 'cas', type: 'pidi', body:{XMMC: row[:XMMC] }
# }

# ds.limit(10).each{
#     |row| p row[:XMMC]
# }

# ds.first(10).each{
#     |row| p row[:XMMC]
# }

# ES.indices.delete index:['cas']
# 
# insert index value
ds.each{ 
    |row| 
    ES.index index: 'cas', 
            type: 'pidi',
            body:{
                OBJECTID: row[:OBJECTID],
                XZQDM: row[:XZQDM],
                XZQMC: row[:XZQMC],
                NF: row[:NF],
                LX: row[:LX],
                XMMC: row[:XMMC],
                SHIPWWH: row[:SHIPWWH],
                SHENGPWWH: row[:SHENGPWWH],
                PCMC: row[:PCMC],
                BK: row[:BK],
                BKID: row[:BKID]
            }
}

# ES.indices.put_mapping index:'cas',type: 'pidi',body:{
#     XMMC:{
#         # type:'string',
#         store:'no',
#         term_vector:'with_positions_offsets',
#         index_analyzer:'ik',
#         search_analyzer:'ik'
#     }
# }