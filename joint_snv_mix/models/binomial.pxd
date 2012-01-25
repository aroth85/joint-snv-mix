'''
Created on 2012-01-16

@author: Andrew Roth
'''
from __future__ import division

from libc.math cimport exp, log
from libc.stdlib cimport malloc, free

from joint_snv_mix.counter cimport JointBinaryData, JointBinaryCountData

from joint_snv_mix.models.abstract cimport Density, Ess, MixtureModel, Parameters, Priors

from joint_snv_mix.models.utils cimport binomial_log_likelihood, beta_log_likelihood, dirichlet_log_likelihood, \
                                        log_space_normalise, log_sum_exp 

cdef class BinomialPriors(Priors):
    cdef tuple _mu_N
    cdef tuple _mu_T
     
cdef class BinomialParameters(Parameters):
    cdef tuple _mu_N
    cdef tuple _mu_T
    
cdef class BinomialModel(MixtureModel):
    cdef _get_updated_mu(self, a, b, prior)            

cdef class BinomialDensity(Density):
    cdef int _num_normal_genotypes
    cdef int _num_tumour_genotypes
    cdef int _num_joint_genotypes
    
    cdef double * _mu_N
    cdef double * _mu_T
    cdef double * _log_mix_weights

    cdef _init_arrays(self)

cdef class BinomialEss(Ess):
    cdef int _num_normal_genotypes
    cdef int _num_tumour_genotypes
    cdef int _num_joint_genotypes
    
    cdef double * _a_N
    cdef double * _b_N
    cdef double * _a_T
    cdef double * _b_T
    cdef double * _n

    cdef _init_arrays(self)
