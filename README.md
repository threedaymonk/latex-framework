Basic LaTeX article framework
=============================

This is the LaTeX framework I use for writing reports. It's based on the
`article` class. It might be useful to you. Using XeTeX instead of plain TeX
makes it much easier to use fonts installed on the computer: there's no
additional work required beyond specifying them by name.

Usage
-----

* Edit `article.tex` and `sources.bib`
* Run `rake`
* Look at generated PDF
* Repeat until satisfied.

Bibliography
------------

Uncomment the `\bibliography` line in `article.tex` and add references to
`sources.bib`.

Images
------

You can add images like this:

    \includegraphics{foo.pdf}

Or, if you want a label:

    \begin{figure}
    \includegraphics{foo.pdf}
    \caption{Say what it is}
    \label{fig:somehandyname}
    \end{figure}

SVG files are converted to PDF when you run `rake`.

Cleaning up
-----------

To clean up intermediate files:

    rake clean

To remove generated PDFs as well:

    rake clobber

Prerequisites
-------------

The following programs must be installed and available in the path:

* `rake`
* `xelatex`
* `inkscape` (only needed for SVG diagrams)

On Ubuntu, this can be satisfied by installing these packages:

* `rake`
* `texlive`
* `texlive-xetex`
* `inkscape`

On OS X, you can install [MacTeX](http://www.tug.org/mactex/) (It's a huge
download) and [Inkscape](http://inkscape.org/download/), though you'll have to
add both to your path before running `rake`. `rake` itself is supplied with the
operating system.
