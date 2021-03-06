Notes from running various cases of time-dependent_fusion+ComPat.ipynb
======================================================================

The predicted central electron temperature (Te[0]) for various
combinations of alpha and dt.

All simulations were done so that NITER * dt = 10.

+-------+------+--------------------+--------------------+
| alpha |  dt  |        mean        |        std dev     |
+=======+======+====================+====================+
|       |      | 4265.361759529173  |                    |
+-------+------+--------------------+--------------------+
|       |      |                    |                    |
+-------+------+--------------------+--------------------+
| 0.1   | 0.1  | 4275.151162094346  | 778.0172251421841  |
+-------+------+--------------------+--------------------+
| 0.01  | 0.1  | 4160.413094732757  | 406.85788020865584 |
+-------+------+--------------------+--------------------+
| 0.001 | 0.1  | 4332.135361915326  | 231.3712846547442  |
+-------+------+--------------------+--------------------+
|       |      |                    |                    |
+-------+------+--------------------+--------------------+
| 0.1   | 0.01 | 3903.7613592943676 | 367.2402867919008  |
+-------+------+--------------------+--------------------+
| 0.01  | 0.01 | 4203.482142056402  | 185.01110660094113 |
+-------+------+--------------------+--------------------+
| 0.001 | 0.01 | 4232.743227632796  | 108.4731617660731  |
+-------+------+--------------------+--------------------+
|       |      |                    |                    |
+-------+------+--------------------+--------------------+
| 0.1   |0.001 | 3902.6890104232157 | 132.64479476732697 |
+-------+------+--------------------+--------------------+
| 0.01  |0.001 | 4206.859466971045  |  83.22469810261143 |
+-------+------+--------------------+--------------------+
| 0.001 |0.001 | 4278.092801189918  |  71.36400228597064 |
+-------+------+--------------------+--------------------+
|       |      |                    |                    |
+-------+------+--------------------+--------------------+
| 0.001 | 0.1  | 4332.135361915326  |  231.3712846547442 |
+-------+------+--------------------+--------------------+
+ 0.001 | 0.01 | 4232.743227632796  |  108.4731617660731 |
+-------+------+--------------------+--------------------+
| 0.001 | 0.001| 4278.092801189918  |   71.36400228597064|
+-------+------+--------------------+--------------------+

