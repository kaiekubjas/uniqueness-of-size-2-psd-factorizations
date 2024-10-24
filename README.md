# uniqueness-of-size-2-psd-factorizations
This repository contains the code for the article "Uniqueness of size-2 positive semidefinite matrix factorizations" by Kristen Dawson, Serkan Hoşten, Kaie Kubjas, Lilja Metsälampi

### File descriptions

- Mathematica file `Test_Template.nb` contains code to construct a size-2 PSD factorization along with the code to define the cone of possible motions of the factorization using the software `polymake`.

#### Section 4.1: No orthogonal pairs

- Mathematica file `no_orthgonoal_pair_leftkernel_generator.nb` contains construction of the left kernel generator of the matrix C when the factorization does not contain any orthogonal pairs. 
- Mathematica files `Farkas_lemma_nAmB.nb` contains computations used to determine if the left kernel of the C-matrix is empty, when n rows of C correspond to A factors and m rows of C correspond to B factors, and the factorization does not contain any orthogonal pairs. 

#### Section 4.2: One orthogonal pair 

- Mathematica file `1-orthogonal_pair_leftkernel_generator` contains construction of the left kernel generator of the matrix C when the factorization contains one orthogonal pair.
- Mathematica files `1-orth_Farkas_lemma_nAmB.nb` contains computations used to determine if the left kernel of the C-matrix is empty when n rows of C correspond to A factors and m rows of C correspond to B factors, and the factorization contains precisely one orthogonal pair.
