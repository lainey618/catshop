public
class CatList
    attr_accessor :head

    def initialize
        @front = CatNode.new
    end

    def add(catinfo)

        if (@front.catinfo != nil)
            if catinfo < @front.catinfo
                temp_cat = CatNode.new
                temp_cat.add catinfo
                temp_cat.nextNode = @front
                @front = temp_cat
            else
                @front.add catinfo
            end
        else 
            @front.add catinfo
        end
    end

    def find(index)                             #part of coding test
        return @front.getTheDamnCat index
    end

    def catTail
        node = @front

        return node if !node.nextNode
        return node if !node.nextNode while (node = node.nextNode)
    end

    def addAfter(target, catinfo)
        node = find(target)

        return unless node

        old_next = node.nextNode
        node.nextNode = CatNode.new(catinfo, nil)
        node.nextNode.nextNode = old_next
    end

    
    def getTheDamnCat(index)         #part of coding test, good for testing, not great for speed
        return @front.getTheDamnCat(index)
    end
end

    public
    class CatNode
        attr_accessor :catinfo, :nextNode

        def add catinfo
            if @catinfo == nil
                @catinfo = catinfo
            else
                if @nextNode == nil
                    @nextNode = CatNode.new
                    @nextNode.add catinfo
                else
                    if @nextNode.catinfo > catinfo
                        temp_cat = CatNode.new
                        temp_cat.add catinfo
                        temp_cat.nextNode = @nextNode
                        @nextNode = temp_cat
                    else
                        @nextNode.add catinfo
                    end
                end
            end
        end

        def getTheDamnCat(index)
        
            if (index == 0)
                return @catinfo
            else
                if @nextNode == nil
                    return "hello"
                end
                return @nextNode.getTheDamnCat(index - 1)
            end
        end
    end

catshop = CatList.new

catshop.add("Savannah")
catshop.add("Russian Blue")
catshop.add("Persian")
catshop.add("Bobtail")
catshop.add("Lynx")

#catshop.addAfter("Persian", "Tabby")            #adds a cat after persian
#puts catshop.getTheDamnCat(2)                 #find the cat at this position

 (0..4).each do |i|                              #prints out all of the cats
     puts catshop.getTheDamnCat(i)
 end

#A BUNCH OF TESTS BELOW HERE

# puts catshop.head.catinfo
# puts catshop.head.nextNode.catinfo
# puts catshop.find("Persian")
# puts catshop.find("persian")
# puts catshop.find("Tabby")
# puts catshop.find("Russian Blue")
# puts catshop.catTail.catinfo
# puts catshop.find("Tabby").catinfo