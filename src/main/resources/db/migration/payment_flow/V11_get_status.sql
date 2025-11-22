CREATE OR REPLACE FUNCTION payment_flow.get_status_code(p_id INT) RETURNS TEXT AS $$
DECLARE
    v_status_code TEXT;
BEGIN
    SELECT status_code INTO v_status_code
    FROM payment_flow.status_master
    WHERE id = p_id;
    RETURN v_status_code;
END;
$$ LANGUAGE plpgsql STABLE;


ALTER FUNCTION payment_flow.get_status_code(p_id INT) OWNER TO root;

GRANT EXECUTE ON FUNCTION payment_flow.get_status_code(INT) TO app_payment_flow;