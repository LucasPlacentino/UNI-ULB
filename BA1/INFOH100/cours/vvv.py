def symetrie_horizontale(A):
    B = A.copy()
    if A == []:
        return []
    for i in range(len(A[0])):
        for j in range(len(A[0])):
            B[i][j] = A[-1-i][j]
            print(B[i][j])
    #B = [[A[j][i] for j in range(len(A[0]))] for i in range(len(A[0]))]
    return B

print(symetrie_horizontale([['a', 'b'], ['c', 'd']]))