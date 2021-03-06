EMACS ?= emacs

all: update compile test

update:
	$(EMACS) --version
	$(EMACS) -batch -l util/install-deps.el

compile:
	$(EMACS) -batch -l util/load-deps.el . --eval '(setq byte-compile-error-on-warn t)' \
	-f batch-byte-compile ox-wk.el
test:
	${EMACS} -batch -l util/load-deps.el -l ox-wk-test.el -f ert-run-tests-batch-and-exit

clean:
	rm -f *.elc

.PHONY: all compile test clean
