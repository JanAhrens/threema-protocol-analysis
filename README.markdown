Threema protocol analysis
=========================

This paper is the result of an analysis of the protocol used by the
commercial mobile messaging application
[Threema](http://threema.ch/en/).

Along with the paper this repository includes the source code of the LaTeX files that were used to generate the PDF document.

Building the PDF document
-------------------------

I used the [TeX Live](https://www.tug.org/texlive/) distribution to build this document.
You probably need to install these additional packages:

* [bytefield](http://www.ctan.org/pkg/bytefield)
* [pgf-umlsd](http://www.ctan.org/pkg/pgf-umlsd)
* [gitinfo](http://www.ctan.org/pkg/gitinfo)

You can use `make` to create the PDF document.

After you cloned this repository you need to setup gitinfo once. `make` will complain if you have forgotten this.

Setting up gitinfo
------------------

The gitinfo package provides a mechanism for including information about the git repository in LaTeX documents.
To setup gitinfo it needs to be integrated with git using git-hooks.

You have to create a post-commit, post-checkout and post-merge hook in your local `.git/hooks` directory.
I used the [example file](http://mirrors.ctan.org/macros/latex/contrib/gitinfo/post-xxx-sample.txt) from the gitinfo package.
