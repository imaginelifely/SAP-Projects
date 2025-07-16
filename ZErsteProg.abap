REPORT zmeinersteprog.
WRITE:/ 'Meine Erste Programme in SAP ABAP'.
*WRITE:/ 'Es ist klasse 5' comment by ctrl+< key

WRITE:/ 'Printing char values'.
DATA: var1 TYPE c LENGTH 20 VALUE 'method 1' .
*var1 = 'Test Case'.
DATA: var2(20) TYPE c VALUE 'method 2'.
WRITE:/ var1,var2.
*here we basically declared a char variable wrote its value and print

WRITE:/ 'printing integer values'.
DATA: n1 TYPE i,
      n2 TYPE i.
n1 = 20.
n2 = 30.
WRITE:/ n1,n2.

DATA: n3(3) TYPE n.
n3 = 90.
WRITE:/ 'as numeric char'.
WRITE:/ n3.

DATA: Dt TYPE d.
Dt = sy-datum.
WRITE:/ 'system date'.
WRITE:/ Dt.
