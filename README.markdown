Threema protocol analysis
=========================

These are the LaTeX files used to generate a PDF document that
describes the details of the protocol used by [Threema](http://threema.ch/en/).

Necessary LaTeX packages:

* [bytefield](http://www.ctan.org/pkg/bytefield)
* [pgf-umlsd](http://www.ctan.org/pkg/pgf-umlsd)
* [gitinfo](http://ctan.org/pkg/gitinfo)

# Setup gitinfo

Create a the file `.git/hooks/post-commit` with the following
content:

```bash
#!/bin/sh
# Copyright 2011 Brent Longborough
# Please read gitinfo.pdf for licencing and other details
# -----------------------------------------------------
# Post-{commit,checkout,merge} hook for the gitinfo package
#
prefixes="."              # Default --- in the working copy root
for pref in $prefixes
	do
	git log -1 --date=short \
	--pretty=format:"\usepackage[%
		shash={%h},
		lhash={%H},
		authname={%an},
		authemail={%ae},
		authsdate={%ad},
		authidate={%ai},
		authudate={%at},
		commname={%an},
		commemail={%ae},
		commsdate={%ad},
		commidate={%ai},
		commudate={%at},
		refnames={%d}
	]{gitsetinfo}" HEAD > $pref/gitHeadInfo.gin
	done
```

Link that `post-commit` to `post-checkout` and `post-merge`.

```
ln -s post-commit .git/hooks/post-checkout
ln -s post-commit .git/hooks/post-merge
```
