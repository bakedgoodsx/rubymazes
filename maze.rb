# maze.rb
# Erix

 
class Maze
attr_accessor :pathcounter,:xrow,:xlocation

def initialize(mz)
	@mz = mz
	@map = []
	paths = []
end

def processmaze()
m1 = @mz.split("\n")
# maze split into array of lines

m1.each_with_index do |e,i|
	if e.match("A") then @s = i
	end

	if e.match("B") then @e = i
	end

end

firstline = m1[@s].scan(/./)

lastline = m1[@e].scan(/./)


# chop off beginning of maze.
@m2 = m1[@s..@e]

self.xrow = 0
# finding the index of "A" before we have converted to spaces
# would be meaningless.

@m3 = converttospaces(@m2)


# up to this point we are doing fine.
# the converttospaces returns a matrix
# with all spaces including A & B !!

advance

end

def converttospaces(miz)
	positionmat = []
	# the matrix of spaces
	
	miz.each_with_index do |e, i|
		# each e is a line within the array!
		self.xrow = i
		
		positionmat[self.xrow] = []
				
		arrchars = e.scan(/./)
		# arrchars = [" ", " ", "#", " ", "#"] 
		arrchars.each_with_index do |echar,i|
		

			if (echar==("A") || echar==("B") || echar==(" "))
				# finally this worxed!
				positionmat[self.xrow].push(i)	
		
				# add to positionmatrix
		
				if (echar==("A"))
				   self.xlocation = positionmat[self.xrow].index i
				end
				# a very important line /\
				# This gives us a zero-based index position
				# for the startlocation within the positionmatrix
		
			end

	
		end
		showme("positionmat[self.xrow]",positionmat[self.xrow],self.xlocation)
	end
return positionmat
end

# now each possible location is stored in positionmat.



def showme(varnames, *vars)
	vardisplay = []
	puts "The variables you wanted to see are #{varnames} \n And the values of these are #{vars} \n"
end


def advance(row = 0)
# :bleeding
	
	self.xrow = row
	n = neighborspace
	
	n.each do |x|
		self.xlocation = x
		if x.advancable?
			advance(self.xrow + 1)
		end
	end

end


def neighborspace
	# what are we being passed? self.xlocation = startlocation [index("A")]
	# Wait it only makes sense for neighborspace ever
	# to deal with 1 row!!! 
	
	nbspacemat = []
	#this is our matrix of neighboring positions in the row!
	
	row = @m3[self.xrow]
	i = row.size - 1
	# accounting for indexing from zero, judging size from 1


	#:bleeding - just use old friggin method, fuck delta matrices!

end

	

def advancable?
end

def writetopath
end
end




eo = Maze.new(%{# # # ## # #
###  ## #  # #
# # # # ## # 
# # # # # # # 
  # #   A # ## 
# # # ## # # 
#### #  ## 
#  # # #
# ## #  # # #
#           
### # # #B###
# # ## # # })
eo.processmaze()

