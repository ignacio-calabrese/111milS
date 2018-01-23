from animals import Dog

myDog = Dog("Lanudo", "Ovejero Aleman", 5, 30)

myDog.bark()

print(myDog.getName())
print(myDog.getRace())
print(myDog.getAge())
print(myDog.getWeigth())

myDog.eat()
myDog.age()
myDog.bark()

print(myDog.getName())
print(myDog.getRace())
print(myDog.getAge())
print(myDog.getWeigth())

myDog.poop(2)
print(myDog.getWeigth())
