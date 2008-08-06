TARGETS=utests prime-finder mctest-div mctest-mult mctest-add mctest-sub
ALL_TARGETS=utests prime-finder
BASE=bigint.kl1 modulus.kl1 number_theory.kl1 primality_tests.kl1 montgomery.kl1
UTESTSRC=utests_main.kl1 unittest.kl1 ${BASE}
PFSRC=prime_finder.kl1 ${BASE}
MCBASE=bigint.kl1 unittest.kl1
CPP=/usr/lib/cpp
SED=/bin/sed

all: ${ALL_TARGETS}
mctests: mctest-div mctest-mult mctest-add mctest-sub
clean:
	rm -f *.c *.h *.ext klic.db *.o ${TARGETS} *.kl1

utests: ${UTESTSRC}
	klic -O2 -o $@ $^

prime-finder: ${PFSRC}
	klic -O2 -o $@ $^

mctest-add: ${MCBASE} mctest-add.kl1
	klic -O2 -o $@ $^

mctest-sub: ${MCBASE} mctest-sub.kl1
	klic -O2 -o $@ $^

mctest-div: ${MCBASE} mctest-div.kl1
	klic -O2 -o $@ $^

mctest-mult: ${MCBASE} mctest-mult.kl1
	klic -O2 -o $@ $^

.pkl1.kl1:
	${CPP} $< | ${SED} -e "/^#.*/d" > $@

.SUFFIXES: .kl1 .pkl1
