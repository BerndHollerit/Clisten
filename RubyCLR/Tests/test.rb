require 'rubyclr'

RubyClr::reference_file "testtargets.dll"
include System::Collections
include RubyClr::Tests

john = Person.new('John')
steve = Person.new('Steve')
mike = Person.new('Mike')

a = ArrayList.new
a.add(john)
a.add(steve)
a.add(mike)

b = a.sort