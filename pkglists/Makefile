all:
	@echo '[installed+unregistered] <=> [not installed+registered]'
	@comm --total -3 <(yay -Qqe | sort) <(cat X.pkglist core.pkglist devel.pkglist jera-$(shell hostname).pkglist | sort -u)

%.pkglist: null
	xargs --arg-file=$@ -o yay -S --needed --norebuild --noredownload

null:
.PHONEY: null
