class CatList
    attr_accessor :head

    def initialize
        self.head = CatNode.new
    end

    def add(catinfo)

        if (self.head.catinfo != nil)
            if catinfo < self.head.catinfo
                temp_cat = CatNode.new
                temp_cat.add catinfo
                temp_cat.nextNode = self.head
                self.head = temp_cat
            else
                self.head.add catinfo
            end
        else 
            self.head.add catinfo
        end
        #take in a catinfo from the user (aka us)
        #loop through the list and compare that catinfo to stored catinfos
        #find where in the list the new catinfo belongs
        #store that new catinfo in the list in the correct spot
            #move the ones after +1 in the index

        if(self.head.nil?)
            self.head = CatNode.new(catinfo, nil)
        else
            lastNode = self.head
            while(!lastNode.nextNode.nil?)
                lastNode = lastNode.nextNode
            end
            lastNode.nextNode = CatNode.new(catinfo, nil)
        end
    end

    def find(catinfo)                             #part of coding test
        node = self.head
        while(!node.nil?)
            if(node.catinfo == catinfo)
                return node
            end
            node = node.nextNode
        end
        false 
    end

    def catTail
        node = self.head

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
        return self.head.getTheDamnCat(index)
    end

    private 
    class CatNode
        attr_accessor :catinfo, :nextNode

        # def initialize(catinfo, nextNode)
        #     self.catinfo = nil
        #     self.nextNode = nil
        # end

        def add data
            if @catinfo == nil
                @catinfo == catinfo
            else
                if @next == nil
                    @next = CatNode.new
                    @next.add catinfo
                else
                    if @next.catinfo > catinfo
                        temp_cat = CatNode.new
                        temp_cat.add catinfo
                        temp_cat.nextNode = @next
                        @next = temp_cat
                    else
                        @next.add catinfo
                    end
                end
            end
        end

        def getTheDamnCat(index)
        
            if (index == 0)
                return catinfo
            else
                if @next == nil
                    return nil
                end
                return self.nextNode.getTheDamnCat(index - 1)
            end
        end
    end
end

catshop = CatList.new
catshop.add("Persian")
catshop.add("Savannah")
catshop.add("Russian Blue")
catshop.add("Bobtail")
catshop.add("Lynx")

#catshop.addAfter("Persian", "Tabby")            #adds a cat after persian
puts catshop.getTheDamnCat(2)                 #find the cat at this position

(0..3).each do |i|                              #prints out all of the cats
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