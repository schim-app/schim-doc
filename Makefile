
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = .
BUILDDIR      = _build

# Should be /bin/bash for ReadTheDocs
SHELL = '/bin/bash'

# Put it first so that "make" without argument is like "make help".
help:
	@${SPHINXBUILD} -M help "${SOURCEDIR}" "${BUILDDIR}" ${SPHINXOPTS} ${O}

.PHONY: help man html pdf latex

################################################################################
#                       Targets that build documentation                       #
################################################################################

all: html

html: doxygen
	@echo "Generating man pages..."
	@cd schim/docs; "${MAKE}" prepare-man
	@${SPHINXBUILD} -M $@ "${SOURCEDIR}" "${BUILDDIR}" ${SPHINXOPTS}
	@"${MAKE}" graphs

################################################################################
#                       Wrappers for schim/docs/Makefile                       #
################################################################################

man:
	@cd schim/docs/; "${MAKE}" man BUILDDIR="../../_build"

qthelp:
	@cd schim/docs/; "${MAKE}" qthelp BUILDDIR="../../_build"

pdf:
	@cd schim/docs/; "${MAKE}" pdf BUILDDIR="../../_build"

################################################################################
#                            Intermediate targets                              #
################################################################################

doxygen:
	@mkdir -p _build/{html/doxygen,doxygen/xml}
	@doxygen

graphs:
	@echo "Creating DOT graphs..."
	@PREFIX="$$(pwd)"; \
	shopt -s globstar nullglob; \
	for f in $$(find dev/ -name "*.dot" -type f); do \
	    DEST="_build/html/$${f/.dot/}.svg"; \
	    mkdir -p "$$(dirname "$$DEST")" && \
	    dot -Tsvg "$$f" -o "$$DEST"; \
	done
	@echo "Done creating graphs."

################################################################################

clean:
	rm -rf {,schim/docs/}{_build,_intermediate}/

