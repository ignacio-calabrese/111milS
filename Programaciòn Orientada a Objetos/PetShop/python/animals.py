class Dog(object):
	def __init__(self, name, race, weight, age = 0):
		self.__name = name
		self.__race = race
		
		if weight < 1:
			self.weight = 1
		else:
			self.__weight = weight
		
		if age < 0:
			self.__age = 0
		else:
			self.__age = age
	
	def bark(self):
		print(self.__name + " dice: Guau Guau")
	
	def getName(self):
		return self.__name
	
	def getRace(self):
		return self.__race
	
	def getAge(self):
		return self.__age
	
	def age(self):
		self.__age += 1
	
	def getWeigth(self):
		return self.__weight
	
	def eat(self, food = 1):
		if food > 0:
			self.__weight += food
	
	def poop(self, shit = 1):
		if shit > 0 and self.__weight > shit:
			self.__weight -= shit
