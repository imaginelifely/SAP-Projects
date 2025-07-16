REPORT ztable_report1.

DATA: it_table TYPE TABLE OF mara WITH HEADER LINE.

SELECT * FROM mara INTO TABLE it_table.
WRITE:/5 'MATNR'color 1,
       25 sy-vline,
       35 'MANDT'color 3,
       48 sy-vline,
       50 'MBRSH'color 4,
       58 sy-vline,
       60 'MTART'color 5,
       67 sy-vline,
       70 'MEINS'color 7.
ULINE.
LOOP AT it_table.
  WRITE:/5 it_table-matnr,
         25 sy-vline,
         35 it_table-mandt,
         48 sy-vline,
         50 it_table-mbrsh,
         58 sy-vline,
         60 it_table-mtart,
         67 sy-vline,
         70 it_table-meins.
ENDLOOP.
ULINE.
CLEAR it_table.
