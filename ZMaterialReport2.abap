REPORT zmaterialreport_2.
TABLES: mara.
TYPES: BEGIN OF ty_mara,
       matnr type mara-matnr,
       mandt type mara-mandt,
       mtart type mara-mtart,
       mbrsh type mara-mbrsh,
       meins type mara-meins,
       END OF ty_mara.
DATA: it_table TYPE TABLE OF mara,
      wa_table TYPE mara.
SELECT-OPTIONS: s_matnr FOR mara-matnr,
                s_mtart FOR mara-mtart NO INTERVALS NO-EXTENSION OBLIGATORY DEFAULT 'DIEN'.
SELECT matnr
       mandt
       mtart
       mbrsh
       meins FROM mara INTO TABLE it_table WHERE matnr IN s_matnr
                                            AND mtart IN s_mtart.
WRITE:/5 'MATNR'COLOR 1,
       25 sy-vline,
       35 'MANDT'COLOR 3,
       48 sy-vline,
       50 'MBRSH'COLOR 4,
       58 sy-vline,
       60 'MTART'COLOR 5,
       67 sy-vline,
       70 'MEINS'COLOR 7.
ULINE.
LOOP AT it_table INTO wa_table.
  WRITE:/5 wa_table-matnr,
         25 sy-vline,
         35 wa_table-mandt,
         48 sy-vline,
         50 wa_table-mbrsh,
         58 sy-vline,
         60 wa_table-mtart,
         67 sy-vline,
         70 wa_table-meins.
ENDLOOP.
