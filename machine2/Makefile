name = $(shell grep -P '^pkgname' PKGBUILD | cut -d= -f2)
rel = $(shell date +%s)

all:
	sed -i 's/^pkgrel=[0-9]*$$/pkgrel='$(rel)'/' PKGBUILD
	tar cvf source.tar etc
	makepkg -dfc
	rm source.tar
	mv $(name)-1-$(rel)-any.pkg.tar ~/.local/repo/
	(cd ~/.local/repo/; repo-add localrepo.db.tar $(name)-1-$(rel)-any.pkg.tar; cd -)
