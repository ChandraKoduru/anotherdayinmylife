TARGET=target
EXE=$(TARGET)/anotherdayinmylife
DIST_EXE=$(EXE)-$(shell uname -s)-$(shell uname -m)
DIST_EXE_SIG=$(DIST_EXE).sig

build:
	stack build anotherdayinmylife

build-prof:
	stack build --profile --ghc-options="-rtsopts -fprof-auto" anotherdayinmylife

install:
	stack install anotherdayinmylife

bindist:
	mkdir -p $(TARGET)
	stack --local-bin-path $(TARGET) install anotherdayinmylife
	upx --best $(EXE)
	mv $(EXE) $(DIST_EXE)
	gpg --output $(DIST_EXE_SIG) --detach-sign $(DIST_EXE)

clean:
	stack clean
	rm -rf target

tags:
	hasktags-generate .

sources:
	stack-unpack-dependencies


.PHONY: build build-prof clean tags sources
