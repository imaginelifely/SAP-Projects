
*for fixed values
*DATA: n1 TYPE i,
*      n2 TYPE i,
*      n3 type i.
*n1 = 100.
*n2 = 200.

*sum of 2 numbers input by user
PARAMETERS: n1 TYPE i,
            n2 TYPE i.
DATA: n3 TYPE i.
n3 = n1 + n2.
WRITE:/ 'Sum of',n1, 'and', n2,'is =', n3.

*comparison of three numbers input by user
PARAMETERS: n4 TYPE i,
            n5 TYPE i,
            n6 TYPE i.
WRITE:/ 'Greater number is'.
IF n4 > n5 AND n4 > n6.
  WRITE:/ n4.
ELSEIF n4 > n5 AND n4 < n6.
  WRITE:/ n6.
ELSE.
  WRITE:/ n5.
ENDIF.
