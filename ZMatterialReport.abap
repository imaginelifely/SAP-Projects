REPORT ZMATERIALREPORT.
TABLES: mara.
DATA: it_table TYPE TABLE OF mara WITH HEADER LINE.
SELECT-OPTIONS: s_matnr for mara-matnr,
                s_mtart for mara-mtart NO INTERVALS NO-EXTENSION OBLIGATORY DEFAULT 'DIEN'.
SELECT * FROM mara INTO TABLE it_table WHERE matnr in s_matnr
                                       and mtart in s_mtart.
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
*double click and f1 to open help
