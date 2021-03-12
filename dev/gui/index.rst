===
GUI
===

.. toctree::

.. important:: If you need to quickly find out where a graphical item is defined
   in the source code, open the application and activate
   
   .. centered:: :menuselection:`Help --> Toggle Developer Hints`

   Then place your mouse over a widget. This will display in the window's status
   bar where the widget's source code is. **This is probably the quickest way to
   get started.**

Directory structure
===================

All code related to the GUI resides in `src/ui/`. The directory structure
(including the most important header files) is as follows:

.. code-block::

   src/ui/
   ├── objects/      # GObjects and subclasses
   ├── widgets/      # Reusable QWidgets
   ├── windows/      # Windows and dialogs
   ├── mainwindow.h  # MainWindow
   ├── sheetview.h   # SheetView
   ├── sheetscene.h  # SheetScene
   ├── operations.h  # Scene operations
   ├── commands.h    # Undo-able commands
   └── vim.h         # Vim mode

The main window
===============

The main window is implemented as a singleton in the class ``MainWindow``. The
active instance can be obtained using ``MainWindow::getInstance``.

.. tabs::

   .. tab:: Outline

      .. doxygenclass:: MainWindow
         :outline:

   .. tab:: Details

      .. doxygenclass:: MainWindow
         :no-link:
         :undoc-members:
* `Full reference <../../doxygen/classMainWindow.html>`_
     ..

The schematic editor
====================

.. include:: schematic-editor.rst

Dialogs
=======

Vim mode
========

.. include:: vim.rst
