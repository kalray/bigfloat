cimport cgmp

cdef extern from "mpfr.h":
    # MPFR type declarations
    ctypedef int mpfr_prec_t
    ctypedef int mpfr_sign_t
    ctypedef cgmp.mp_exp_t mpfr_exp_t

    ctypedef struct __mpfr_struct:
        mpfr_prec_t _mpfr_prec
        mpfr_sign_t _mpfr_sign
        mpfr_exp_t  _mpfr_exp
        cgmp.mp_limb_t   *_mpfr_d

    ctypedef __mpfr_struct mpfr_t[1]

    # MPFR rounding modes
    ctypedef enum mpfr_rnd_t:
        MPFR_RNDN = 0
        MPFR_RNDZ
        MPFR_RNDU
        MPFR_RNDD
        MPFR_RNDA
        MPFR_RNDF
        MPFR_RNDNA = -1

    # Limits
    mpfr_prec_t MPFR_PREC_MIN
    mpfr_prec_t MPFR_PREC_MAX

    mpfr_exp_t MPFR_EMIN_DEFAULT
    mpfr_exp_t MPFR_EMAX_DEFAULT

    # Functions to get and set exponent min and max values.
    mpfr_exp_t mpfr_get_emin()
    mpfr_exp_t mpfr_get_emin_min()
    mpfr_exp_t mpfr_get_emin_max()
    mpfr_exp_t mpfr_get_emax()
    mpfr_exp_t mpfr_get_emax_min()
    mpfr_exp_t mpfr_get_emax_max()
    int mpfr_set_emin(mpfr_exp_t exp)
    int mpfr_set_emax(mpfr_exp_t exp)

    # MPFR function definitions
    void mpfr_init2(mpfr_t x, mpfr_prec_t prec)
    void mpfr_clear(mpfr_t x)
    int mpfr_set(mpfr_t rop, mpfr_t op, mpfr_rnd_t rnd)
    int mpfr_set_d(mpfr_t rop, double op, mpfr_rnd_t rnd)

    int mpfr_set_str(
        mpfr_t rop, char *s, int base, mpfr_rnd_t rnd
    )

    char * mpfr_get_str(
        char *str, mpfr_exp_t *expptr, int b,
        size_t n, mpfr_t op, mpfr_rnd_t rnd
    )

    void mpfr_free_str(char *str)

    int mpfr_const_pi(mpfr_t rop, mpfr_rnd_t rnd)
