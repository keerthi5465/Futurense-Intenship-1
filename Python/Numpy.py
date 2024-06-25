import numpy as np
arr = np.array([1, 2, 3, 4, 5])
print(arr)
zeros = np.zeros((2, 3))
ones = np.ones((2, 3))
full = np.full((2, 3), 7)
print(zeros)
print(ones)
print(full)
range_array = np.arange(0, 10, 2)
linspace_array = np.linspace(0, 1, 5)
print(range_array)
print(linspace_array)
identity_matrix = np.eye(3)
print(identity_matrix)
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])
print(a + b)  # Addition
print(a - b)  # Subtraction
print(a * b)  # Element-wise multiplication
print(a / b)  # Element-wise division
a = np.array([1, 2, 3])
b = np.array([1])
print(a + b)  # Broadcasting
arr = np.array([1, 2, 3, 4, 5])
print(arr[1:4])  # Slicing
arr = np.array([1, 2, 3, 4, 5])
print(arr[2])  # Indexing
arr[2] = 10
print(arr)
arr = np.array([[1, 2, 3], [4, 5, 6]])
print(arr.reshape((3, 2)))  # Reshape to 3x2
