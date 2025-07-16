REPORT zcalculator_prog.

PARAMETERS : input1 TYPE int2,
             input2 TYPE int2.
DATA: result  TYPE int2,
      sign TYPE c,
      flag    TYPE int1 VALUE 0.
SELECTION-SCREEN :BEGIN OF SCREEN 500 TITLE text-001,
                  PUSHBUTTON /10(10) add  USER-COMMAND add,
                  PUSHBUTTON 25(10) sub USER-COMMAND sub,
                  PUSHBUTTON 40(10) mul USER-COMMAND multiply,
                  PUSHBUTTON 55(10) div USER-COMMAND divide,
END OF SCREEN 500.

INITIALIZATION.
  add = 'Add'.
  sub = 'Subtract'.
  mul = 'Multiply'.
  div = 'Divide'.

AT SELECTION-SCREEN.
  CASE sy-ucomm.
    WHEN 'ADD'.
      flag = 1.
      result = input1 + input2.
    WHEN 'SUB'.
      flag = 1.
      result = input1 - input2.
    WHEN 'DIVIDE'.
      IF ( input2 <> 0 ).
        flag = 1.
         result = input1 / input2.
      ELSE.
        flag = 2.
      ENDIF.
    WHEN 'MULTIPLY'.
      flag = 1.
       result = input1 * input2.
  ENDCASE.

START-OF-SELECTION.
  IF input1 IS NOT INITIAL OR input2 IS NOT INITIAL.
    CALL SELECTION-SCREEN '500' STARTING AT 10 10.
    IF flag = 1.
      WRITE: result.
    ELSEIF flag = 2.
      WRITE: 'Cannot Divide a number by 0'.
    ELSEIF flag = 0.
      MESSAGE 'Press any Button to perform any operation!' TYPE 'I'.
    ENDIF.
  ELSE.
    MESSAGE 'Please give both Input to proceed!' TYPE 'I'.
  ENDIF.
