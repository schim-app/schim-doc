Qt provides `QGraphicsView`_ and `QGraphicsScene`_ to visually represent
`QGraphicsItem`_-s. You should have at least a basic knowledge of these classes
if you wish to develop the GUI. We have created custom subclasses of these
classes. A sheet is represented by a :ref:`SheetView` and :ref:`SheetScene`, and
an object is represented by a :ref:`gobject`.

.. note:: The base classes are also used on their own in some places.

SheetView
---------
Defined in `src/ui/sheetview.h`

This is a widget that displays a schematic to the user. It cooperates with
SheetScene to display and interact with graphical objects.

Rubber band selection
*********************

Schim supports two types of rubber band selection. If the user initially drags
the rubber band to the right, objects are selected only if they are wholly
contained in the band. On the other hand, if the user initially drags the band
to the left, any objects that are touched by the band are selected. Here's a
coarse overview of what happens in the program.

* ``mousePressEvent`` receives a left click and memorizes the position
* Subsequent calls of ``mouseMoveEvent`` try to determine whether dragging is to
  the left or to the right by calling ``processRubberBandDrag``.
* ``mouseReleaseEvent`` disables the state of dragging.

SheetScene
----------
Defined in `src/ui/sheetscene.h`

Scene operations
****************
Defined in `src/ui/operations.h`

Many user actions are composed of multiple steps. For example inserting a line
requires the insertion of two points in succession. For this functionality, we
have created the class ``SceneOperation``.

To start an operation, construct it and call ``SheetScene::startOperation``. The
operation will receive and process any applicable events. Once the operation
finishes, it will emit the ``SceneOperation::finished`` signal. The scene will
pick up on this signal.

.. tabs::

   .. tab:: Outline

      .. doxygenclass:: SceneOperation
         :outline:

   .. tab:: Details

      .. doxygenclass:: SceneOperation
         :no-link:

The following operations are currently defined:

* `OpInsertLine <../../doxygen/classOpInsertLine.html>`_
* `OpInsertRect <../../doxygen/classOpInsertLine.html>`_
* `OpInsertText <../../doxygen/classOpInsertLine.html>`_
* `OpInsertComponent <../../doxygen/classOpInsertComponent.html>`_

Snap feature
************

The snap-to-grid feature is enabled/disabled by calling
``SheetScene::setSnapEnabled``.

Scene vs view
-------------

Sometimes it may seem arbitrary whether to implement a feature in the view or
in the scene. Sometimes it is. But as a rule of thumb:

Implement a feature in the scene if:

- it changes the structure of the sheet
- objects need to be aware of the feature and/or react to it

Implement a feature in the view if:

- it doesn't change the structure of the sheet (e.g. zooming, panning)
- it requires access to the global coordinate system (an exception would be if
  the global position can be obtained from a mouse event)
- it needs to display items that are transform-invariant
- multiple views containing the same scene can use the feature at the same time

The general idea is to let the scene know as little as possible about the view.
This is because multiple views can be used to display the same scene at the same
time. If the scene (or an object by calling a scene function) needs to
communicate with a view, use signals and slots. This way, only interested views
can pick up on that.

.. _gobject:

GObject
-------

|startovw|

.. rubric:: Inheritance graph
.. image:: /_build/html/doxygen/classGObject__inherit__graph.svg
   :align: center

|br|

.. rubric:: Collaboration graph
.. image:: /_build/html/doxygen/classGObject__coll__graph.svg
   :align: center

|endcollapse|

An object is visually represented as a :ref:`GObject`, which is a wrapper around
an :ref:`Object`. Derived classes follow the same naming convention. Namely, the
graphical class is named by prepending the corresponding model class name with
the letter 'G' (for graphical). For example, a :ref:`Line` is wrapped by
:ref:`GLine`.

To construct a :ref:`GObject` to wrap an `Object` ``obj`` call
``GObject::assign(obj)``.

The following classes are derived from :ref:`GObject`:

* `GLine <../../doxygen/classGLine.html>`_
* `GRect <../../doxygen/classGRect.html>`_
* `GText <../../doxygen/classGText.html>`_
* `GCompositeObject <../../doxygen/classGCompositeObject.html>`_
* `GHeader <../../doxygen/classGHeader.html>`_

.. tabs::

   .. tab:: Outline

      .. doxygenclass:: GObject
         :outline:

   .. tab:: Details

      .. doxygenclass:: GObject
         :no-link:
         :undoc-members:
* `Full reference <../../doxygen/classGObject.html>`_
     ..

.. _QGraphicsView: https://doc.qt.io/qt-5/qgraphicsview.html
.. _QGraphicsScene: https://doc.qt.io/qt-5/qgraphicsscene.html
.. _QGraphicsItem: https://doc.qt.io/qt-5/qgraphicsitem.html

