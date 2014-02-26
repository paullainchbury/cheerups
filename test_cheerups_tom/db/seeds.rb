def user(name)
  User.where(name: name).first_or_create(password: "password")
end

user("RyanB").cheerups.create! content: "Rails makes me happy\nbut sometimes I make a mess\nand then I am sad"
user("RyanB").cheerups.create! content: "Staring at blank screen\ntest driven development\nand then we are done"
user("RyanB").cheerups.create! content: "Mondays can be blue\nthen I code throughout the week\nFriday hugs are best"
user("Evan").cheerups.create! content: "If time is money,\nAre ATMs time machines?\nYour mind has been blown."
user("Daniel").cheerups.create! content: "Error in syntax\nhaiku dot c line two\ntoo few syllables"
user("Safiya").cheerups.create! content: "When faced with trouble\nand in need of an escape\ndivide by zero."
user("T-Shirt").cheerups.create! content: "Haikus are easy\nbut sometimes they don't make sense\nrefrigerator"
user("Mitchell").cheerups.create! content: "Error 404:\nYour haiku could not be found.\nTry again later."
user("Jack").cheerups.create! content: "To get some more hearts\nPress up, down, up, down, left, right\nLeft, right, B, A, Start"
user("Jeffrey").cheerups.create! content: "The tricorder broke\ncommunicator is dead\nand my shirt is red"