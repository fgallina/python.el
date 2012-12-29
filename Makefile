CARTON = carton
EMACS = emacs
ECUKES = $(shell find elpa/ecukes-*/ecukes | tail -1)

all: install test

test:
	EMACS=${EMACS} ECUKES_EMACS=${EMACS} ${CARTON} exec ${ECUKES} features

install:
	${CARTON} install

clean:
	rm -rf elpa
