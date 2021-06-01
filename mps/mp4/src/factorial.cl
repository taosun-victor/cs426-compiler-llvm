class Main inherits IO {
  res:Int <- 1314;
  main(): Object {{
    out_string("Enter an integer greater-than or equal-to 0: ");

    let input: Int <- in_int() in
      if input < 0 then
        out_string("ERROR: Number must be greater-than or equal-to 0\n")
      else {
	res <- factorial(input);
        out_string("The factorial of ").out_int(input);
        out_string(" is ").out_int(res);
      }
      fi;
  }};

  factorial(num: Int): Int {
    if num = 0 then 1 else num * factorial(num - 1) fi
  };
};


--@Main_vtable_prototype = constant %Main_vtable {
--0	i32 5,
--1	i32 ptrtoint (%Main* getelementptr (%Main* null, i32 1) to i32),
--2	i8* getelementptr ([5 x i8]* @str.Main, i32 0, i32 0),
--3	%Main* () * @Main_new,
--4	%Object* (%Main*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Main*) *),
--5	%String* (%Main*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Main*) *),
--6	%Main* (%Main*) * bitcast (%Object* (%Object*) * @Object_copy to %Main* (%Main*) *),
--7	%Main* (%Main*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Main* (%Main*,%String*) *),
--8	%Main* (%Main*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Main* (%Main*,i32) *),
--9	%String* (%Main*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Main*) *),
--10	i32 (%Main*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Main*) *),
--11	%Object* (%Main*) * @Main_main,
--12	i32 (%Main*,i32) * @Main_factorial
--}
