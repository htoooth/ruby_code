require "sequel"
require "win32ole"

dbPath = 'd:\publish.mdb'

DB = Sequel.ado(:conn_string=>"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=#{dbPath}")
# get all records
# ds = DB[:pidi]
# get first record
# p ds.first[:NF]
# p DB
# get all column name
# p ds.columns

DB.create_table :yongdinew do
    Integer :id #objectid
    String :bsm #标识码
    String :ysdm #要素代码

    # 一 土地供应情况
    String :xmmc #项目名称
    String :yddwmc #用地单位名称
    String :xmsd #项目属地
    String :zdh #宗地号
    String :gdfs #供地方式
    String :crhth #出让合同号
    Date :qdtdsyqsj #取得土地使用权时间    as nf
    String :ydwz #用地位置
    String :gdtj #供地条件
    String :tdsyqlx #土地使用权类型
    Integer :gdczexx #规定投资额下限
    String :ghyt #规划用途
    String :dkjb #地块级别
    Float :ghlhlxx #规划绿化率下限
    Float :ghjzmdxx #规划建筑密度下限
    Float :ghjzmdsx #规划建筑密度上限
    Float :ghrjlxx #规划容积率下限
    Float :ghrjlsx #规划容积率上限
    
    # 二 交地情况
    Float :gdmj #供地面积
    Float :wcqmj #未拆迁面积
    Float :ydjdmj #约定交地面积
    Date :ydjdsj #约定交地时间
    Float :sjjdmj #实际交地面积
    Date :sjjdsj #实际交地时间
    Float :wjdmj #未交地面积
    Float :dqwjdmj #到期未交地面积
    
    # 三 开竣工情况
    Date :ydkgsj #约定开工时间
    Date :wkgts #未开工天数
    Date :sjkgsj #实际开工时间
    
    Date :ydjgsj #约定竣工时间
    Date :sjjgsj #实际竣工时间
    String :wjgts #未竣工天数
    
    String :sfxz #是否闲置
    String :xzyy #闲置原因
    String :nczfz #拟处置方案

    ##########################
    Float :ykgmj #已开工面积
    Float :wkgmj #未开工面积
    Float :crmj #出让面积
    String :ydqk #用地情况 ：逾期开工,逾期竣工,正常使用,疑似闲置,疑似低效，闲置土地，低效土地
    ##########################
        
    # 四 抵押查封情况
    
    # 土地抵押情况
    String :tdzsh #土地证书号
    String :sfsd #是否设定
    String :dyqr #抵押权人
    Float :dymj #抵押面积
    Float :dypgje #抵押评估金额
    Float :dkje #贷款金额
    Date :dydjsj #抵押登记时间
    String :txqzsh #他项权证书号
    Integer :dyqx #抵押期限
    Date :jyrq #解押日期
    
    # 法院查封情况
    String :sfsdfy #是否设定法院
    String :cffy #查封法院
    Date :cfrq #查封日期
    String :cfwh #查封文号
    Date :jfrq #解封日期
    String :czqk #处置情况
    
    # 五 企业用地情况
    Float :zjzmj #总建筑面积
    Float :yjsydmj #已建设用地面积
    Float :gzwzdmj #构筑物占地面积
    Float :dczdmj #堆场占地面积
    Float :xzbghshfwssydmj #行政办公和生活服务设施用地面积
    Float :ldmj #绿地面积
    Float :jzjdmj #建筑基底面积
    Float :gdzcljtr #固定资产累计投入
    Float :nztr #内资投入
    Float :wztr #外资投入
    Float :nyysr #年营业收入
    Float :nnsze #年纳税总额
    String :sfdy #是否低效
    String :dyyy #低效原因
    String :czyj #处置意见
    String :bz #备注
    
    String :xzqdm #行政区代码
    String :xzqmc #行政区名称
    String :bkid #板块号
    String :bk #板块名
    Float :area #图形面积
end

DB.create_table :pidinew do
    Integer :id #要素ID
    String :bsm #标识码
    String :ysdm #要素代码

    String :bpnf #批报年份
    String :lx #批地类型
    String :xmmc #项目名称
    String :shipwwh #市批文号
    String :shengpwwh #省批文号
    String :pcmc #批次名称
    
    #位置信息
    String :xzqdm #行政区代码
    String :xzqmc #行政区名称
    String :bkid #板块号
    String :bk #板块名
    Float :area #图形面积
end

DB.create_table :TuDiChuBeinew do
    Integer :id #objectid
    String :xmmc #项目名称
    String :tdzl #土地坐落
    Float :dkmj #地块面积
    String :gdsj #供地时间
    String :dyqr #抵押权人
    Float :dymj #抵押面积
    Float :dypgje #抵押评估金额
    Float :dkje #贷款金额
    Date :dydjrq #抵押登记日期
    String :txqzsh #他项权证书号
    String :dyqx #抵押期限
    Date :jyrq #解押日期

    String :xzqmc #行政区名称
    String :xzqdm #行政区代码
    String :bk #板块
    String :bkid #板块id
    Float :area #图形面积
end

DB.create_table :PiErWeiGongnew do
    Integer :id #要素ID
    String :bsm #标识码
    String :ysdm #要素代码
    String :pdnf #年份
    String :lx #类型
    String :xmmc #项目名称
    String :shipwwh #市批文号
    String :shengpwwh #省批文号
    String :pcmc #批次名称
    String :type #批而未供土地类型
    Float :mj #面积
    
  #位置信息
    String :xzqdm #行政区代码
    String :xzqmc #行政区名称
    String :bkid #板块号
    String :bk #板块名
    Float :area #图形面积
end

DB.create_table :LinShiYongDinew do
    Integer :id #objectid
    String :yddwmc #单位名称
    String :xmmc #项目名称
    String :ydwz #用地位置
    Float :ydmj #用地面积
    String :pzwh #批准文号
    Date   :pzsj #批准时间
    Date   :jzsj #截至时间
    String :bz #备注

    String :xzqmc #行政区名称
    String :xzqdm #行政区代码
    String :bk #板块
    String :bkid #板块id
    Float :area #图形面积
end

DB.create_table :GongDinew do
    Integer :id #objectid
    String :bsm #标识码
    String :ysdm #要素代码

    # 一 土地供应情况
    String :xmmc #项目名称
    String :yddwmc #用地单位名称
    String :xmsd #项目属地
    String :zdh #宗地号
    String :gdfs #供地方式
    String :crhth #出让合同号
    Date :qdtdsyqsj #取得土地使用权时间    as nf
    String :ydwz #用地位置
    String :gdtj #供地条件
    String :tdsyqlx #土地使用权类型
    Integer :gdczexx #规定投资额下限
    String :ghyt #规划用途
    String :dkjb #地块级别
    Float :ghlhlxx #规划绿化率下限
    Float :ghjzmdxx #规划建筑密度下限
    Float :ghjzmdsx #规划建筑密度上限
    Float :ghrjlxx #规划容积率下限
    Float :ghrjlsx #规划容积率上限
    Float :gdmj #供地面积  as area 
    
    #位置信息
    String :xzqdm #行政区代码
    String :xzqmc #行政区名称
    String :bkid #板块号
    String :bk #板块名
    Float :area #图形面积
end


#最后的正则表达式
# " (\w+);#" ===> " :$1 #"

