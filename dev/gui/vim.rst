You should read TODO in the manual before proceeding.

Vim mode is implemented in ``src/ui/vim.h`` and ``src/ui/vim.cpp``. It is enabled
and disabled by calling ``Vim::enable``.

When a ``QWidget`` or ``GObject`` receives a ``keyPressEvent``, it has the
option to process that event in Vim mode. It is supposed to call
``Vim::registerKeyPress``, providing the incoming event and a pointer to a
callback function as parameters.  The callback function will be invoked if a
proper key sequence is matched.

.. todo:: Add more details.

.. tabs::

   .. tab:: Outline

      .. doxygennamespace:: Vim
         :outline:

   .. tab:: Details

      .. doxygennamespace:: Vim
         :no-link:
* `Full reference <../../doxygen/namespaceVim.html>`_
     ..
