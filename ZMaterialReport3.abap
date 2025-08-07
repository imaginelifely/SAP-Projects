REPORT zmaterialreport_3.
TABLES: mara.
TYPES: BEGIN OF ty_mara,
         matnr TYPE mara-matnr,
         mandt TYPE mara-mandt,
         mtart TYPE mara-mtart,
         mbrsh TYPE mara-mbrsh,
         meins TYPE mara-meins,
       END OF ty_mara.

TYPES: BEGIN OF ty_final,
         matnr TYPE mara-matnr,
         mandt TYPE mara-mandt,
         mtart TYPE mara-mtart,
         mtbez TYPE t134t-mtbez,
         mbrsh TYPE mara-mbrsh,
         meins TYPE mara-meins,
         maktx TYPE makt-maktx,
       END OF ty_final.

DATA: it_table TYPE TABLE OF ty_mara,
      wa_table TYPE ty_mara.

DATA: it_makt TYPE TABLE OF makt,
      wa_makt TYPE makt.

DATA: it_t134t TYPE TABLE OF t134t,
      wa_t134t TYPE t134t.

DATA: it_final TYPE TABLE OF ty_final,
      wa_final TYPE ty_final.

SELECT-OPTIONS: s_matnr FOR mara-matnr,
                s_mtart FOR mara-mtart NO INTERVALS NO-EXTENSION OBLIGATORY DEFAULT 'DIEN'.

SELECTION-SCREEN SKIP 1.
PARAMETERS: ok as CHECKBOX.

SELECT matnr
       mandt
       mtart
       mbrsh
       meins FROM mara INTO TABLE it_table WHERE matnr IN s_matnr
                                            AND mtart IN s_mtart.
IF it_table IS NOT INITIAL.
  SELECT * FROM makt INTO TABLE it_makt FOR ALL ENTRIES IN it_table
                                            WHERE matnr = it_table-matnr
                                             AND spras = sy-langu.

 SELECT * FROM t134t INTO TABLE it_t134t FOR ALL ENTRIES IN it_table
                                          WHERE spras = sy-langu
                                          AND mtart = it_table-mtart.
ENDIF.

LOOP AT it_table INTO wa_table.
  MOVE-CORRESPONDING wa_table TO wa_final.

  READ TABLE it_makt INTO wa_makt WITH KEY matnr = wa_table-matnr.
IF sy-subrc = 0.
  wa_final-maktx = wa_makt-maktx.
ENDIF.

READ TABLE it_t134t INTO wa_t134t WITH KEY mtart = wa_table-mtart.
if sy-subrc = 0.
  wa_final-mtbez = wa_t134t-mtbez.
  ENDIF.

  APPEND wa_final TO it_final.
ENDLOOP.


if it_final IS NOT INITIAL.

WRITE:/5 'MATNR'COLOR 1,
       25 sy-vline,
       35 'MANDT'COLOR 3,
       48 sy-vline,
       50 'Mat Type' color 6,
       58 sy-vline,
       60 'MBRSH'COLOR 4,
       67 sy-vline,
       70 'MTART'COLOR 5,
       76 sy-vline,
       85 'MEINS'COLOR 7,
       90 sy-vline,
       96 'Description' COLOR 6.
ULINE.

LOOP AT it_final INTO wa_final.
  WRITE:/5 wa_final-matnr,
         25 sy-vline,
         35 wa_final-mandt,
         48 sy-vline,
         50 wa_final-mtbez,
         58 sy-vline,
         60 wa_final-mbrsh,
         67 sy-vline,
         70 wa_final-mtart,
         76 sy-vline,
         85 wa_final-meins,
         90 sy-vline,
         96 wa_final-maktx.
ENDLOOP.

else.

  MESSAGE 'Data Not Found' TYPE 's'.

  ENDIF.
