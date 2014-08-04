require './test'
require 'find'

class T
    include Test
    def each
        yield 1
        yield 2
    end
end

class S
    extend Test
    def each
        yield 4
        yield 3
    end
end

t = T.new
t.prt

def test
    puts "en"
    p=Proc.new {puts "fdas";return}
    p.call
    puts "out"
end

def dirSize(path)
    filesize = 0
    Find.find(path)do |p|
        if FileTest.file?(p)
            s = File.stat(p)
            filesize += s.size
        end
    end
    filesize
end

p dirSize("c:/")