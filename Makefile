## r binaries
R_BIN := R

PACKAGE_NAME := $(shell sed -n "s/Package: *\([^ ]*\)/\1/p" DESCRIPTION)
PACKAGE_VERSION := $(shell sed -n "s/Version: *\([^ ]*\)/\1/p" DESCRIPTION)
SRC := $(shell basename $(PWD))
LOCALDIR := .local
TESTDIR := $(PACKAGE_NAME)/inst/tests

.PHONY: clean check build install remove local_install local_remove test vignette clean_vignette

all: clean check build

build:
	cd .. ;\
	$(R_BIN) CMD build $(SRC)

install: build
	cd .. ;\
	$(R_BIN) CMD INSTALL $(PACKAGE_NAME)_$(PACKAGE_VERSION).tar.gz

remove:
	$(R_BIN) CMD REMOVE $(PACKAGE_NAME)

local_install: local_remove
	cd .. ;\
	mkdir $(LOCALDIR) ;\
	$(R_BIN) CMD INSTALL --library=$(LOCALDIR) $(PACKAGE_NAME)

local_remove:
	cd ..;\
	$(RM) -rf $(LOCALDIR)

test: local_install
	cd .. ;\
	$(R_BIN) -q -e "library(\"$(PACKAGE_NAME)\", lib.loc=\"$(LOCALDIR)\")" \
		   		    -e "library(\"testthat\")" \
				      -e "test_dir(\"$(TESTDIR)\")"

check: build
	cd .. ;\
	$(R_BIN) CMD check $(PACKAGE_NAME)_$(PACKAGE_VERSION).tar.gz --as-cran

win-builder: check
	cd .. ;\
	ncftpput -u anonymous -p '' win-builder.r-project.org R-devel $(PACKAGE_NAME)_$(PACKAGE_VERSION).tar.gz

vignette:
	cd vignettes ;\
	$(R_BIN) --vanilla -e "library(knitr); knit2pdf(\"cleaver.Rnw\");"

clean_vignette:
	cd vignettes ;\
	$(RM) *.aux *.bbl *.blg *.log *.out *.pdf *.tex *.toc ;\
	$(RM) -r figure

clean: local_remove clean_vignette
	cd .. ;\
	$(RM) -r $(PACKAGE_NAME).Rcheck/ ;\
	$(RM) $(PACKAGE_NAME)_*.tar.gz

