from random import randint

SIZE=10000

vector = []

def burbujeo(vector):
    for i in range(0, SIZE - 1):
        for j in range(i + 1, SIZE):
            if vector[i] > vector[j]:
                auxiliary = vector[i]
                vector[i] = vector[j]
                vector[j] = auxiliary
                
for i in range(SIZE):
    vector.append(randint(0, SIZE))
     
burbujeo(vector)

for i in range(SIZE):
	print (vector[i])
