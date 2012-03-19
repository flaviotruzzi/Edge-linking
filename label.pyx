from __future__ import division
import numpy as np
cimport numpy as np

DTYPE = np.bool
DTYPE2 = np.int
ctypedef np.bool DTYPE_t
ctypedef np.int DTYPE2_t

cdef inline int int_max(int a, int b): return a if a >= b else b
cdef inline int int_min(int a, int b): return a if a <= b else b


def checkBounding(np.ndarray[DTYPE2_t, ndim=2] label not None, DTYPE2_t i, DTYPE2_t j):
	if (i == 0):
		if (j == 0):
			return (0 | label[i+1][j] | label[i][j+1] | label[i+1][j+1])
		elif (j == label.shape[1]):
			return (0 | label[i][j-1] | label[i+1][j-1] | label[i+1][j])
		else:
			return (0 | label[i][j-1] | label[i][j+1] | label[i+1][j-1] | label[i+1][j+1] | label[i+1][j])
	elif (j == 0):
		if (i == label.shape[0]):
			return (0 | label[i-1][j] | label[i][j+1] | label[i-1][j+1])
		else:
			return (0 | label[i-1][j] | label[i-1][j+1] | label[i][j+1] | label[i+1][j] | label[i+1][j+1])
	elif (i == label.shape[0]):
		pass
	elif (j == label.shape[1]):
		pass
	else:
		

@cython.boundscheck(False)
def labels(np.ndarray[DTYPE_t, ndim=2] inp not None,
		   np.ndarray[DTYPE2_t, ndim=2] outp not None):
	cdef unsigned int i, j, ib, jb, count

	assert inp.shape == outp.shape

	count = 1
	
	ib = inp.shape[0]
	jb = inp.shape[1]

	for i in range(ib):
		for j in range(jb):
			if (inp[i][j] == True):
				if ( (outp[i+1][j] == 0) or (outp[i+1][j-1] == 0)
	
			if (outp[i][j] == 0):
				outp[i][j] = count

