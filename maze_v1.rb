

class Maze
attr_accessor :currentloc, :lastloc, :rowindex, :movematrix



def initialize(mz)
@mz = mz
@map = []
# @mz contains the maze!
movematrix = []
end

def processmaze()

# still got @mz baby!
m1 = @mz.split("\n")
# maze is now split into an array of lines

m1.each_with_index do |e,i|
 
 if e.match("A") then @start = i
 end
 
 if e.match("B") then @end = i
 end
 
end

firstline = m1[@start].scan(/./)
s = firstline.index "A"
lastline = m1[@end].scan(/./)
endy = lastline.index "B"
puts "Your target is at position #{endy} in row #{@end}"

 # gives 0-first array index of m1's B (target) line
puts "Your origin is in position #{s} in row #{@start}"

#buildpath(m1[@start], s)
i = @start


while i < @end

@map.push(buildpath(m1[i],s))
i=i+1
end

@map.push(buildpath(m1[@end],endy))
@map.uniq.sort!


parsemap(@map,s,endy)


end

# each loop buildpath(i,s)
# startplace doesnt matter, as long as it will scan the entire row entry














##########parsemap function

def parsemap(mp, startloc, endloc)

self.currentloc = mp[0].index startloc

i = 0
while i < (mp.size)

getpossiblemoves(mp[i],startloc)

i=i+1
end






end


def getpossiblemoves(mp_row, value)

mp_row = mp_row.sort!.uniq
self.currentloc = mp_row.index value




i = 0

 while i < ((mp_row.size))
 
 ###BISHER
 
  b = value - i
  ; value = 8
  ; index = 
  i = value + i
 
  if mp_row.index (b)==(mp_row[(mp_row.index value)+i])
  then movematrix.push(mp_row[i])
  end
  if mp_row.index (value-i)==(mp_row[self.currentloc-i])
  then movematrix.push(mp_row[self.currentloc-i])
  end
  i=i+1
 end

p movematrix
# the reason this isnt working is that the matrix is missing
# the original startlocation cypher. 

# now we have to change self.currentloc so that when this
# function returns to the next line, it will change the 
# currentloc position to reflect the way through the maze. 
# but how do we know how to set it?
# OK, we generate a move-matrix for EACH POSSIBLE MOVE.
# self.currentloc determines how it builds the possible moves,
# so where do you start your next move?


end



 


end






def buildpath(line, startplace)

availspace = []
line = line.scan(/./)
i = 0
line.each_index do |i|

if (line[startplace-i] ==(" " || "A" || "B"))
	availspace.push(startplace-i)
end

if (line[startplace+i] ==(" " || "A" || "B"))
   availspace.push(startplace+i)
end

# now availspace contains each space in each line, plus some negatives
# plus some non-consecutives but I digress. Now we need to map our way
# through availspace
@avail = availspace

end

@avail.push(startplace)

return @avail


# @start now contains the array index of the first line containing A
# @end contains array index of target.


# Objective: find how to access B

end





eo = Maze.new(%{# # # ## # #
###  ## #  # #
# # # # ## # 
# # # # # # # 
  # #   A # ## 
# # # ## # # 
#### #  ## 
#  # # #
# ## 
#
### # # #B###
# # ## # # })
eo.processmaze()

