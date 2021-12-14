class CatList
    attr_accessor :head

    def initialize
        self.head = nil
    end

    def add(value)

        #take in a value from the user (aka us)
            ### DONE (aka our)
        #loop through the list and compare that value to stored values
            ### Start from the first one
        #find where in the list the new value belongs
        #store that new value in the list in the correct spot
            #move the ones after +1 in the index

        if(self.head.nil?)
            self.head = CatNode.new(value, nil)
        else
            lastNode = self.head
            while(!lastNode.nextNode.nil?)
                lastNode = lastNode.nextNode
                nodeAskii = lastNode.value[1].ord
                valueAskii = value[1].ord

                if (valueAskii > nodeAskii)
                    lastNode.nextNode = CatNode.new(value, nil)
                elsif (valueAskii < nodeAskii)
                    lastNode.nextNode = CatNode.new(value, lastNode)
                end
            end
            lastNode.nextNode = CatNode.new(value, nil)
        end
    end

    def find(value)                             #part of coding test
        node = self.head
        while(!node.nil?)
            if(node.value == value)
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

    def addAfter(target, value)
        node = find(target)

        return unless node

        old_next = node.nextNode
        node.nextNode = CatNode.new(value, nil)
        node.nextNode.nextNode = old_next
    end

    def getTheDamnCat(index)         #part of coding test, good for testing, not great for speed
        return self.head.getTheDamnCat(index)
    end

    private 
    class CatNode
        attr_accessor :value, :nextNode

        def initialize(value, nextNode)
            self.value = value
            self.nextNode = nextNode
        end

        def getTheDamnCat(index)
        
            if (index == 0)
                return value
            else
                return self.nextNode.getTheDamnCat(index - 1)
            end
        end
    end
end

catshop = CatList.new
catshop.add("Persian")
catshop.add("Savannah")
catshop.add("Russian Blue")

catshop.addAfter("Persian", "Tabby")            #adds a cat after persian
puts catshop.getTheDamnCat(2)                 #find the cat at this position

(0..3).each do |i|                              #prints out all of the cats
    puts catshop.getTheDamnCat(i)
end

#A BUNCH OF TESTS BELOW HERE

# puts catshop.head.value
# puts catshop.head.nextNode.value
# puts catshop.find("Persian")
# puts catshop.find("persian")
# puts catshop.find("Tabby")
# puts catshop.find("Russian Blue")
# puts catshop.catTail.value
# puts catshop.find("Tabby").value