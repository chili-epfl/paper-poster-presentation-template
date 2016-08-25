paper-poster-presentation-template
==================================

A paper/report/poster/presentation package template using ieeetran, sigchi, baposter and beamer. Modules share figures and bibliography.

For example outputs, see the `output/` directory.

Tested with TeX Live 2015. Beamer video playback tested with Okular 0.24.2 on KDE 4.14.16.

Here are the current modules:

  - **paper-ieeetran**: A IEEEtran conference paper template, built with pdflatex. *Requires the IEEEtran package.*
  - **paper-sigchi**: The official 2016 SIGCHI proceedings paper template, built with pdflatex.
  - **poster**: A baposter poster template, built with pdflatex.
  - **poster-nccr**: NCCR poster template as an SVG, built with inkscape. *Requires inkscape.*
  - **presentation-simple**: A simple beamer presentation template, including in-frame video playback, built with lualatex.
  - **presentation-hri**: An HRI-themed beamer presentation template, including in-frame video playback, built with lualatex. Thanks to Séverin Lemaignan and Benjamin Weiss for the style.

More template modules will be added with different styles.

How to build
------------

In the root directory, run

```
make
```

How to export version-controlled outputs
----------------------------------------

In the root directory, run

```
make output
```

This will copy all the output PDFs and videos from the build directories to the `output/` directory in the root.
