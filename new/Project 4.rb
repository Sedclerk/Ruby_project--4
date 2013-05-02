#Project 4: 


#Step 1:
#Given the following hash:
#{‘Chevrolet’: ‘Malibu’,
# ‘Ford’: ’Mustang’,
# ‘Ford’: ‘Taurus’,
# ‘Chevrolet’: ‘Cobalt’}

#Covert it into the following formats:
#JSON, XML, CSV, YAML

#Now we are going to convert a Hash to JSON

#Microsoft Windows [Version 6.2.9200]
#(c) 2012 Microsoft Corporation. All rights reserved.

#C:\Users\Sedinirina>irb --simple-prompt

>> require 'json'
#=> true
>> hash = {:Chevrolet => ['Malibu','Cobalt'], :Ford => ['Mustang','Taurus']}
#=> {:Chevrolet=>["Malibu", "Cobalt"], :Ford=>["Mustang", "Taurus"]}
>> hash.to_json
#=> "{\"Chevrolet\":[\"Malibu\",\"Cobalt\"],\"Ford\":[\"Mustang\",\"Taurus\"]}"
>> j hash
#{"Chevrolet":["Malibu","Cobalt"],"Ford":["Mustang","Taurus"]}
#=> nil
#>>

#Now we are going to convert a Hash to XML

#First in order to that hash to be converted to xml,
#we should convert the hash to your required
#format before converting it to xml.

# C:\Users\Sedinirina>irb --simple-prompt
>> hash = {:Chevrolet => ['Malibu','Cobalt'], :Ford => ['Mustang','Taurus']}
#=> {:Chevrolet=>["Malibu", "Cobalt"], :Ford=>["Mustang", "Taurus"]}
>> hash.each do |keys, values|
?> end
#=> {:Chevrolet=>["Malibu", "Cobalt"], :Ford=>["Mustang", "Taurus"]}
>> require 'xmlsimple'
#=> true
>> require "active_support/core_ext"
#=> true
>> hash.to_xml
#=> "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<hash>\n  <Chevrolet type=\"arra
#y\">\n    <Chevrolet>Malibu</Chevrolet>\n    <Chevrolet>Cobalt</Chevrolet>\n  </
#Chevrolet>\n  <Ford type=\"array\">\n    <Ford>Mustang</Ford>\n    <Ford>Taurus<
#/Ford>\n  </Ford>\n</hash>\n"
#>>

#Now we are going to convert aHash to CSV


#C:\Users\Sedinirina>irb --simple-prompt
>> require 'csv'
#=> true
>> hash1 = {'Chevrolet' => 'Malibu', 'Ford' => 'Mustang'}
#=> {"Chevrolet"=>"Malibu", "Ford"=>"Mustang"}
>> hash2 = {'Chevrolet' => 'Cobalt', 'Ford' => 'Taurus'}
#=> {"Chevrolet"=>"Cobalt", "Ford"=>"Taurus"}
>> hashes = [hash1, hash2]
#=> [{"Chevrolet"=>"Malibu", "Ford"=>"Mustang"}, {"Chevrolet"=>"Cobalt", "Ford"=>
#"Taurus"}]
>> all_keys_as_array = %w{Chevrolet Ford}
#=> ["Chevrolet", "Ford"]
>> h = CSV::Row.new(all_keys_as_array,[],true)
#=> #<CSV::Row "Chevrolet":nil "Ford":nil>
>> t = CSV::Table.new([h])
#=> #<CSV::Table mode:col_or_row row_count:1>
>> hashes.each do |m|
?> r = CSV::Row.new([],[],false)
>> m.each do |k, v|
?> r << {k => v}
>> end
>> t << r
>> end
#=> [{"Chevrolet"=>"Malibu", "Ford"=>"Mustang"}, {"Chevrolet"=>"Cobalt", "Ford"=>
#"Taurus"}]
>> puts t.to_csv
#Chevrolet,Ford
#Malibu,Mustang
#Cobalt,Taurus
#=> nil
#>>

#Now we are going to convert aHash to YAML


#C:\Users\Sedinirina>irb --simple-prompt
>> require 'yaml'
#=> true
>> hash = {}
#=> {}
>> hash[:Chevrolet] = "Malibu","Cobalt"
#=> ["Malibu", "Cobalt"]
>> hash[:Ford] = "Mustang","Taurus"
#=> ["Mustang", "Taurus"]
>> puts hash.to_yaml
#---
#:Chevrolet:
#- Malibu
#- Cobalt
#:Ford:
#- Mustang
#- Taurus
#=> nil
#>>

# b. Create a simple ruby class called “Book”. Create “getters and setters” that allow you to set the author name and ISBN number

# Here are the  attr_* methods in which we will use below

#---------------------------------
#attr_reader :name   # Getters
#means
#def name
# @name
#end
#----------------------------------
#attr_writer :name  # Setters
#means
#def name=(value)
# @name = value
#end
#----------------------------------
#attr_accessor :name
#means these together
#def name     # Getters
# @name
#end
#
#def name=(value)  # Setters
# @name = value
#end
#

#C:\Users\Sedinirina>irb --simple-prompt
>> class Book
>> attr_accessor :author_name, :ibsn_number
>> end
#=> nil
#>>
?> b1 = Book.new # ( that creates a new object from the class, we are assigning it into a variable which is b1 and that object is been held by my variable)
#=> #<Book:0x26cf598>
>> b1.author_name = "Jim" 
#=> "Jim"
>> puts b1.author_name# 
#Jim
#=> nil
#>>       when we create an instance using .new {b1 = Book.new}, we created an object(new book) b1 that will be assigned to JIM so when we call it it will always be Jim
?> b2 = Book.new # (
#=> #<Book:0x2697b88>
>> b2.author_name = "Bob"
#=> "Bob"
>> puts b2.author_name
#Bob
=> nil
#>>
?> puts b1.author_name
#Jim
#=> nil
#>>

# c. At the bottom of the class, write some ruby code that initializes the Book class and sets some information on it.

  class Book
   def initialize(author, number)
      @name=author
      @number_set=number
   end
   def display_details()
      puts "The Author name is #@name"
      puts "The Book number is #@number_set"
   end
  end

# Here we are going to create Objects
b1=Book.new("Jim", "4556")
b2=Book.new("Bob", "7889")

# this is how we call the Methods
b1.display_details()
b2.display_details()

#the result would look like this
#The Author name is Jim
#The Book number is 4556
#=> nil
#The Author name is Bob
#The Book number is 7889
#=> nil

# Describe why b1’s author_name doesn’t change to ‘Bob’

#If we take a look inside the attr_accessor :author_name
#there is some code like this

#C:\Users\Sedinirina>irb --simple-prompt
>> class Book
>> def author_name
>> "Jim"   # This is what will be returned to us
>> end
>> end  
#=> nil # Here it defined for us, the return value returned nil from doing that just like we defined a method it didn t actually do anything besides the definition but we have to actually activate it or call upon it to do something the way we do that with classes is that we create a new object from the class, 
>> Book.new # But we need to hold on to that since we created it, so we are going to assign that to a variable
#=> #<Book:0x2638fb0>
>> b1 = Book.new # here we assign it to a variable "b1", now i created a new object and now and that object is been held by my variable, so i can always just say:
=> #<Book:0x26054a0>
>> b1 # there it is my variable b1 always points to it
#=> #<Book:0x26054a0>
>> author_name # see if we call this on its own, it says oops i don t know what that is "author_name" no idea author_name is inside the class Book, so it will tell the Book to give the name of the author in which is "Jim"
#NameError:undefined local variable or method `author_name' for main:Object
#        from (irb):9
#       from C:/Ruby193/bin/irb:12:in `<main>'
>> b1.author_name # we do that like this, there we are it returns "Jim", it did what we asked it to , it called the method "author_name" inside that object
#=> "Jim"
#>>

 # THAT IS why b1’s author_name doesn’t change to ‘Bob’


# 3. Basic Ruby stuff


# a)Create a constant variable


# C:\Users\Sedinirina\Desktop>irb --simple-prompt
>> essai = 1 # this is a simple variable name ( here we specify a variable name )
# => 1
>> ESSAI = 2 # the way we specify a constant name is with all capitals
# => 2
>> essai #  ( Here they are 2 different things and they return 2 different values)
# => 1
>> ESSAI #  ( Here they are 2 different things and they return 2 different values)
# => 2
>> Bonjour = 10 # ( remember that anything that begin with a capital letter its like a variable is considered as a constant)
# => 10
>> essai = 100
# => 100
>> ESSAI = 100 # ( how we can tell that it s a constant)
# (irb):7: warning: already initialized constant TEST
# => 100
>> ESSAI
# => 100
>> Bonjour = 20 # ( how we can tell that it s a constant)
# (irb):9: warning: already initialized constant Hello
# => 20
>>
# . What are constants? Why do we use them? How are they different than other ruby variables?

#Constants are similar to vairables
#  - Not true objects
#  - point to objects
  
#A constant name starts with an uppercase letter followed by
#name characters. Class names and module names are constants,
#and follow the constant naming conventions.
  
#Constants begin with an uppercase letter. Constants defined within a class or module can be accessed
#from within that class or module, and those defined outside a class or module can be accessed globally.

#Constants may not be defined within methods. Referencing an uninitialized constant produces an error.
#Making an assignment to a constant that is already initialized produces a warning.

#A Ruby constant is like a variable, except that its value is supposed to
#remain constant for the duration of the program. The Ruby interpreter does
#not actually enforce the constancy of constants, but it does issue a warning
#if a program changes the value of a constant (as shown in the simple example a)) 
# Here is an example of what we just mentioned about class

#C:\Users\Sedinirina\Desktop>irb --simple-prompt
# here is an example of constant using class
class Essai
   SEDY1 = 5
   SEDY2 = 8
   def sedclerk
       puts "Value of first Constant is #{VAR1}"
       puts "Value of second Constant is #{VAR2}"
   end
end

# here we will create objects
object = Essai.new()
object.sedclerk
# Here SEDY1 and SEDY2 are constant.
# This will produce the following result:

# Value of first Constant is 5
# Value of second Constant is 8

# b) Implement a variety of “loops” i.e. (while, for, etc..)


# c) Do some math (addition, subtraction, multiplication, division)


# d) What is a boolean?

#A boolean expression is an expression traditionally used in a
#conditional or loop construct that decide what path the Ruby
#interpreter should take. In other words, Ruby will ask
#itself "if this boolean expression is true do this, otherwise do that."
#The boolean expression is what makes the decision.

#Since this is a boolean expression, this implies that the expression
#evaluates to either true or false. In Ruby, the true and false values
#are represented by two keywords and classes. The true keyword references
#an instance of the TrueClass class. The false keyword references an
#instance of the FalseClass class. Both of these classes are special,
#you can't instantiate any more of them and all occurrences of the
#true and false class refer to the same two objects.

# e) If a is a boolean (and is set to true), what would !a return?

#First , this "!" is a NOT OPERATOR and it is a logic operators and it says
#that something is not the case, we can put in the front  just
#about anything including just variable names. so "!a" means that "a" doesn't
#have a value , "a" is either unset or it has been set to FALSE or NIL or something
#like that, that would also return FALSE

# f) How are these two statements different?
 #   a == ‘hi’ 
 #   a = ‘hi’
# Boolean expressions usually involve one or more comparison operators.
# evaluating an expression), compares them in some way and evaluates to
# either true or false. This is the primary way that boolean expressions
# are constructed.

# The most used of these comparison operators is the equality
# operator: == (two equals signs). This should evaluate to true if
# the two objects passed to it are equal. The word "should" is used
# here because the == operator is implemented as methods to each class.
# How "equality" is defined depends on the objects being compared.
# However, there won't be many surprises here. If you compare two
# strings, the operator will be evaluated as true if the strings
# are equal. If you compare two numbers, it will be true if they're
# equal. If you compare two objects of different types, the behavior
# of the operator isn't well defined.

# Also, don't confuse the assignment (=, single equals sign) with the
# assignment operator (==, double equals sign). Some languages infer
# which operator is needed, and there is only one operator for both
# functions. Other languages use an operator like := for assignment,
# and = for equality. It's easy to get confused, and this error
# won't throw any red flags in most cases. It will silently
# fail and you'll be wondering why your code doesn't work.
# Some have even gone as far as putting objects that cannot
# be assigned to on the left side of the operator.
# For example, instead of saying a == 10, say 10 == a.
# If you type 10 = a by accident, you cannot assign to 10,
# so there will be an error.
# here is an example

# eg : Microsoft Windows [Version 6.2.9200]
# (c) 2012 Microsoft Corporation. All rights reserved.

# C:\Users\Sedinirina>irb --simple-prompt
>> a = 10
# => 10
>> a == 10
# => true
>> a != 10
# => false
>> !a
# => false
>>

# Microsoft Windows [Version 6.2.9200]
# (c) 2012 Microsoft Corporation. All rights reserved.

# C:\Users\Sedinirina>irb --simple-prompt
>> a = 10
# => 10
>> a == 10
# => true
>>

# g) Provide an example of using “&&” and “||” in a if statement
# First : these are Pypes , and using these pypes you can use parenthesis around booleans
  
#   “&&” means And
#   “||” means Or

  a = (10 <= 11) && (2 <= 50)
  if a == true
    puts a
  else
    puts !a
  end

# Ok so it has to go through all 2 of them, the first one its true
# and the second one its true but let add and see if one of them will be false

# C:\Users\Sedinirina>irb --simple-prompt
>> a = (10 <= 11) && (2 <= 50) && (8 >= 9)
# => false
>>   if a == true
>>     puts a
>>   else
?>     puts !a
>>   end
# true
# => nil
>> !a
# => true
>> a
# => false
# >> from here you can see that (8 >= 9) is false then "a" will
# be considered as False ( the whole thing returns false)

# or for this “||” won t be the same as “&&”
# let see how is that?
  
#  C:\Users\Sedinirina>irb --simple-prompt
>> a = (10 <= 11) || (2 <= 50) || (8 >= 9)
=> true
>>   if a == true
>>     puts a
>>   else
?>     puts !a
>>   end
# true  # So here it says TRUE that because (10 <= 11) is true or it doesn t matter what the rest is! it doesn t even have to keep going , because the first one is already true SO ONE OF THESE THINGS HAS TO BE TRUE
# => nil
>> a
# => true
>> !a
# => false

# ok so now lets change this to see the opposite if the first will be false

# C:\Users\Sedinirina>irb --simple-prompt
>> a = (8 >= 9) || (2 <= 50) || (10 <= 11)
# => true
>>   if a == true
>>     puts a
>>   else
?>     puts !a
>>   end
# true  # Still because (8 >= 9) is not true OR MAY BE (2 <= 50) that is true and its stopped right there because it has found one of these that s true
# => nil
>> a
# => true
>> !a
# => false

And last thing if none of them is TRUE then it returns FALSE

# h) Implement a case statement

# Ok so right here we are going to implement a case statement
# first of all, how a case statement  works
    
#  result = case value
#  when match1 then result1
#  when match2 then result2
#  when match3 then result3
#  so on............
#  else result4
#  end
   
   
# here is the real example
   

print "Enter your grade: "
grade = gets.chomp
case grade
when "A"
  puts 'Well done!'
when "B"
  puts 'Try harder!'
when "C"
  puts 'You need help!!!'
else
  puts "You just making it up!"
end

# ok so let say we are using  multiple values, let s check that

# Ruby allows you to supply multiple values to a when statement rather than just one

print "Enter your grade: "
grade = gets.chomp
case grade
when "A", "B"
  puts 'Awesome! You pretty smart!'
when "C", "D"
  puts 'Shame, You need to work hard!!'
else
  puts "Eish, I m very dissapointed on YOU, You can't even use a computer!"
end

# And also

# You can almost consider case/when statements to be syntactic sugar
# for a method call. Every object in Ruby inherits a method called
# the case equality method, also known as the triple equals (===).
# You can think of it as an operator if it helps (the === operator),
# but we know that Ruby operators are just syntactic sugar for
# method calls. So whenever a when is trying to match a value
# (except when we are using a no-value case) there is a method
# call behind the scenes to the === method/operator. We can therefore
# take our very first example and re-write it using if statements to
# be completely equivalent to a case statement:

print "Enter your grade: "
grade = gets.chomp
if "A" === grade
  puts 'Well done!'
elsif "B" === grade
  puts 'Try harder!'
elsif "C" === grade
  puts 'You need help!!!'
else
  puts "You just making it up!"
end


# i) Create a loop that prints 1 through 20. i.e..
# Loop does exactly what you think it would, it loops through
# abit of a code over and over again until you tell it to stop,
# and the way that we define Loop in ruby is simply by having
 Loop do
   ..... # and the code that we want to repeat will be in here
 end
 
# everything from do to end will be called CODE BLOCK
 
# there are control structures using loops
 
# break = Terminate the whole loop
# next = Jump to the next loop
# redo = Redo this loop
# retry = Start the whole loop over
  
# in this example , we will be using break so check this out
  
# C:\Users\Sedinirina>irb --simple-prompt
>> a = 0
# => 0
>> loop do
?> a += 1
>> break if a >= 21
>> puts a
>> end
# 1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9
# 10
# 11
# 12
# 13
# 14
# 15
# 16
# 17
# 18
# 19
# 20
# => nil
>>
