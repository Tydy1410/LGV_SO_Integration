CLASS zcl_text DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_text IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    " Đếm số record trước khi xóa (để báo lại cho rõ)
    SELECT COUNT(*) FROM ztb_so_log INTO @DATA(lv_count).

    DELETE FROM ztb_so_log.

    IF sy-subrc = 0.
      COMMIT WORK.
      out->write( |Deleted { lv_count } record(s) from ZTB_SO_LOG| ).
    ELSE.
      ROLLBACK WORK.
      out->write( |Nothing to delete - ZTB_SO_LOG is already empty| ).
    ENDIF.

*    SELECT UnitOfMeasure,
*         UnitOfMeasureISOCode,
*         UnitOfMeasureSAPCode
*    FROM I_UnitOfMeasure
*    WHERE UnitOfMeasure IN ( 'EA', 'ST', 'PC' )
*    INTO TABLE @DATA(lt_uom).
*
*    out->write( lt_uom ).

  ENDMETHOD.

ENDCLASS.
