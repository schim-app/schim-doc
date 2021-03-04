
# <img align="left" width="25" src="https://github.com/schim-app/schim/raw/master/res/img/icon.svg"/> Schim Documentation

<img src="https://img.shields.io/readthedocs/schim?color=%232980B9&label=ReadTheDocs"/>

The [documentation](https://schim.rtfd.io) is built using
[Sphinx](https://www.sphinx-doc.org/en/master/) and hosted on the great
[ReadTheDocs](https://docs.rtfd.io) using their beautiful HTML theme.

## Building

While only the HTML version is hosted online, the following additional docs can
be built locally:

* Man pages
* Qt Help
* PDF via LaTeX

The above formats are the ones that are used in this project, although Sphinx
supports many more.

The documentation can be built by the following command:

```shell
make <format>
```

This will build the documentation in the directory `_build/<format>`. The
`<format>` can be any of the following: `html`, `man`, `qthelp`, `pdf`. You can also
specify multiple of these formats separated by spaces.

### Dependencies

#### Python dependencies

* [Python](https://python.org) >= 3.7
* [Sphinx](https://www.sphinx-doc.org/en/master/usage/installation.html) >= 3.0.0
* [ReadTheDocs theme](https://pypi.org/project/sphinx-rtd-theme/)
* [Breathe](https://breathe.readthedocs.io/en/latest/index.html) >= 4.26.1

The python-based dependencies can be installed using:

```shell
pip install sphinx sphinx-rtd-theme breathe 
```

#### Other dependencies
* Make >= TODO
* Doxygen >= TODO
* [Graphviz](https://graphviz.org/) >= TODO
* qt5-tools >= TODO (for Qt Help)

