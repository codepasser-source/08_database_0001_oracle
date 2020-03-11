CREATE OR REPLACE TRIGGER tpsc_test.tri_ddl
  BEFORE ALTER OR DROP ON DATABASE
DECLARE
  lv_login_user VARCHAR2(30) := 'TPSC_TEST';
  lv_errmsg VARCHAR2(200) := 'You have no permission to this operation';
BEGIN
  IF ORA_LOGIN_USER = lv_login_user AND ORA_DICT_OBJ_TYPE IN ('TABLE','SYNONYM','VIEW','TYPE')THEN
    IF ORA_SYSEVENT IS NULL THEN
      raise_application_error(-20001, ora_dict_obj_owner || '.' || ora_dict_obj_name || ' ' || lv_errmsg);
    ELSIF ORA_SYSEVENT = 'ALTER' THEN
      raise_application_error(-20001, ora_dict_obj_owner || '.' || ora_dict_obj_name || ' ' || lv_errmsg);
    ELSIF ORA_SYSEVENT = 'DROP' THEN
      raise_application_error(-20001, ora_dict_obj_owner || '.' || ora_dict_obj_name || ' ' || lv_errmsg);
    END IF;
  END IF;
EXCEPTION
  WHEN no_data_found THEN
    NULL;
END;
/

