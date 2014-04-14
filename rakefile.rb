desc "deploy program"
task :program do
    ftp = Net::FTP.open('192.168.0.250','user001','!sys.us,2013') do |ftp|
        
    end

end

desc 'deploy db'
task :db do 
    
end

task :default => :program
