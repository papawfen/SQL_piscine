create function func_minimum(variadic arr numeric[])
    returns numeric as $$ declare
        num numeric := arr[1];
        i numeric := 0;
    begin
        foreach i in array arr loop
            if i < num then
                num := i;
            end if;
        end loop;
        return num;
    end;
$$ language 'plpgsql';

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);