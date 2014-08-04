class Point
    attr_reader :x,:y
    def initialize(x,y)
        @x,@y = x,y
    end

    def to_s
        "(#{@x},#{@y})"
    end

    def self.sum(*points)
        x = y =0
        points.each {|p| x += p.x; y+= p.y}
        Point.new(x,y)
    end
end

module Test
    def prt
        p "hello"
        # self.each{|x| p x}
    end

    def self.hello
        p "world"
    end
end

