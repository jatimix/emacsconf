# Makefile for timconf
#
# Created: mardi, mai 13 2014 by Timothée Bineau

EMACS=emacs

ELS =	init.el \
	modules/tc-auto-insert.el		 \
	modules/tc-cmode.el			 \
	modules/tc-editor.el			 \
	modules/tc-global-set-key.el		 \
	modules/tc-helm.el			 \
	modules/tc-ido.el			 \
	modules/tc-modules.el			 \
	modules/tc-programming-default.el	 \
	modules/tc-ruby.el			 \
	modules/tc-smart-beginning-of-line.el	 \
	modules/tc-web-mode.el			 \
	modules/tc-elisp.el

ELCS = $(ELS:.el=.elc)

.PHONY: clean

all: $(ELCS)

%.elc: %.el
	${EMACS} -batch -Q -L . -f batch-byte-compile $<

clean:
	$(RM) $(ELCS)

# End of Makefile
