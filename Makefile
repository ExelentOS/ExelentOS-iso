andromedaiso:
	@echo "options:"
	@echo "	build: decompress and create iso image, it is recomended to run this if you just want to get the iso"
	@echo "	decompress: merge the splitted files and decompress the tar archive to get the source of the iso"
	@echo "	mkiso: build the iso out of the source files extracted(if files where extracted)"
	@echo "	clean: remove the source files for the iso"

build:
	cat src/src.split* > src/src.tar.gz
	tar -xzf src/src.tar.gz -C src/
	grub-mkrescue -o andromeda-1.0.1-x86_64.iso src/srcdir/ -r -R -J -l -iso-level 3 -V exelentos
	@echo "succesfully created andromeda iso"

decompress:
	cat src/src.split* > src/src.tar.gz
	tar -xzf src/src.tar.gz -C src/
	@echo "succesfully decompressed iso source directory"

mkiso:
	grub-mkrescue -o andromeda-1.0.1-x86_64.iso src/srcdir/ -r -R -J -l -iso-level 3 -V exelentos
	@echo "succesfully generated iso image"

clean:
	rm -rf src/srcdir src/src/tar.gz
