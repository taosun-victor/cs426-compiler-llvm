declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
declare %Object* @Object_new()
declare %Object* @Object_abort(%Object*)
declare %String* @Object_type_name(%Object*)
declare %Object* @Object_copy(%Object*)
declare %IO* @IO_new()
declare %IO* @IO_out_string(%IO*, %String*)
declare %IO* @IO_out_int(%IO*, i32)
declare %String* @IO_in_string(%IO*)
declare i32 @IO_in_int(%IO*)
declare %String* @String_new()
declare i32 @String_length(%String*)
declare %String* @String_concat(%String*, %String*)
declare %String* @String_substr(%String*, i32, i32)
declare %Int* @Int_new()
declare void @Int_init(%Int*, i32)
declare %Bool* @Bool_new()
declare void @Bool_init(%Bool*, i1)
@str.Object = internal constant [7 x i8] c"Object\00"
%Object = type {
	%Object_vtable*
}

%Object_vtable = type {
	i32,
	i32,
	i8*,
	%Object* () *,
	%Object* (%Object*) *,
	%String* (%Object*) *,
	%Object* (%Object*) *
}

@Object_vtable_prototype = constant %Object_vtable {
	i32 0,
	i32 ptrtoint (%Object* getelementptr (%Object* null, i32 1) to i32),
	i8* getelementptr ([7 x i8]* @str.Object, i32 0, i32 0),
	%Object* () * @Object_new,
	%Object* (%Object*) * @Object_abort,
	%String* (%Object*) * @Object_type_name,
	%Object* (%Object*) * @Object_copy
}

@str.Int = internal constant [4 x i8] c"Int\00"
%Int = type {
	%Int_vtable*,
	i32
}

%Int_vtable = type {
	i32,
	i32,
	i8*,
	%Int* () *,
	%Object* (%Int*) *,
	%String* (%Int*) *,
	%Int* (%Int*) *
}

@Int_vtable_prototype = constant %Int_vtable {
	i32 1,
	i32 ptrtoint (%Int* getelementptr (%Int* null, i32 1) to i32),
	i8* getelementptr ([4 x i8]* @str.Int, i32 0, i32 0),
	%Int* () * @Int_new,
	%Object* (%Int*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Int*) *),
	%String* (%Int*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Int*) *),
	%Int* (%Int*) * bitcast (%Object* (%Object*) * @Object_copy to %Int* (%Int*) *)
}

@str.Bool = internal constant [5 x i8] c"Bool\00"
%Bool = type {
	%Bool_vtable*,
	i1
}

%Bool_vtable = type {
	i32,
	i32,
	i8*,
	%Bool* () *,
	%Object* (%Bool*) *,
	%String* (%Bool*) *,
	%Bool* (%Bool*) *
}

@Bool_vtable_prototype = constant %Bool_vtable {
	i32 2,
	i32 ptrtoint (%Bool* getelementptr (%Bool* null, i32 1) to i32),
	i8* getelementptr ([5 x i8]* @str.Bool, i32 0, i32 0),
	%Bool* () * @Bool_new,
	%Object* (%Bool*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Bool*) *),
	%String* (%Bool*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Bool*) *),
	%Bool* (%Bool*) * bitcast (%Object* (%Object*) * @Object_copy to %Bool* (%Bool*) *)
}

@str.String = internal constant [7 x i8] c"String\00"
%String = type {
	%String_vtable*,
	i8*
}

%String_vtable = type {
	i32,
	i32,
	i8*,
	%String* () *,
	%Object* (%String*) *,
	%String* (%String*) *,
	%String* (%String*) *,
	i32 (%String*) *,
	%String* (%String*,%String*) *,
	%String* (%String*,i32,i32) *
}

@String_vtable_prototype = constant %String_vtable {
	i32 3,
	i32 ptrtoint (%String* getelementptr (%String* null, i32 1) to i32),
	i8* getelementptr ([7 x i8]* @str.String, i32 0, i32 0),
	%String* () * @String_new,
	%Object* (%String*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%String*) *),
	%String* (%String*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%String*) *),
	%String* (%String*) * bitcast (%Object* (%Object*) * @Object_copy to %String* (%String*) *),
	i32 (%String*) * @String_length,
	%String* (%String*,%String*) * @String_concat,
	%String* (%String*,i32,i32) * @String_substr
}

@str.IO = internal constant [3 x i8] c"IO\00"
%IO = type {
	%IO_vtable*
}

%IO_vtable = type {
	i32,
	i32,
	i8*,
	%IO* () *,
	%Object* (%IO*) *,
	%String* (%IO*) *,
	%IO* (%IO*) *,
	%IO* (%IO*,%String*) *,
	%IO* (%IO*,i32) *,
	%String* (%IO*) *,
	i32 (%IO*) *
}

@IO_vtable_prototype = constant %IO_vtable {
	i32 4,
	i32 ptrtoint (%IO* getelementptr (%IO* null, i32 1) to i32),
	i8* getelementptr ([3 x i8]* @str.IO, i32 0, i32 0),
	%IO* () * @IO_new,
	%Object* (%IO*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%IO*) *),
	%String* (%IO*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%IO*) *),
	%IO* (%IO*) * bitcast (%Object* (%Object*) * @Object_copy to %IO* (%IO*) *),
	%IO* (%IO*,%String*) * @IO_out_string,
	%IO* (%IO*,i32) * @IO_out_int,
	%String* (%IO*) * @IO_in_string,
	i32 (%IO*) * @IO_in_int
}

@str.Main = internal constant [5 x i8] c"Main\00"
%Main = type {
	%Main_vtable*,
	i32
}

%Main_vtable = type {
	i32,
	i32,
	i8*,
	%Main* () *,
	%Object* (%Main*) *,
	%String* (%Main*) *,
	%Main* (%Main*) *,
	%Main* (%Main*,%String*) *,
	%Main* (%Main*,i32) *,
	%String* (%Main*) *,
	i32 (%Main*) *,
	%Object* (%Main*) *,
	i32 (%Main*,i32) *
}

@Main_vtable_prototype = constant %Main_vtable {
	i32 5,
	i32 ptrtoint (%Main* getelementptr (%Main* null, i32 1) to i32),
	i8* getelementptr ([5 x i8]* @str.Main, i32 0, i32 0),
	%Main* () * @Main_new,
	%Object* (%Main*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Main*) *),
	%String* (%Main*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Main*) *),
	%Main* (%Main*) * bitcast (%Object* (%Object*) * @Object_copy to %Main* (%Main*) *),
	%Main* (%Main*,%String*) * bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Main* (%Main*,%String*) *),
	%Main* (%Main*,i32) * bitcast (%IO* (%IO*,i32) * @IO_out_int to %Main* (%Main*,i32) *),
	%String* (%Main*) * bitcast (%String* (%IO*) * @IO_in_string to %String* (%Main*) *),
	i32 (%Main*) * bitcast (i32 (%IO*) * @IO_in_int to i32 (%Main*) *),
	%Object* (%Main*) * @Main_main,
	i32 (%Main*,i32) * @Main_factorial
}

@str.5 = internal constant [14 x i8] c"<basic class>\00"
@String.5 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([14 x i8]* @str.5, i32 0, i32 0)
}

@str.4 = internal constant [5 x i8] c" is \00"
@String.4 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([5 x i8]* @str.4, i32 0, i32 0)
}

@str.3 = internal constant [18 x i8] c"The factorial of \00"
@String.3 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([18 x i8]* @str.3, i32 0, i32 0)
}

@str.2 = internal constant [50 x i8] c"ERROR: Number must be greater-than or equal-to 0\0A\00"
@String.2 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([50 x i8]* @str.2, i32 0, i32 0)
}

@str.1 = internal constant [46 x i8] c"Enter an integer greater-than or equal-to 0: \00"
@String.1 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([46 x i8]* @str.1, i32 0, i32 0)
}

@str.0 = internal constant [13 x i8] c"factorial.cl\00"
@String.0 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([13 x i8]* @str.0, i32 0, i32 0)
}

define i32 @main() {

entry:
	%main.obj = call %Main*( )* @Main_new(   )
	%main.retval = call %Object*(%Main* )* @Main_main( %Main* %main.obj )
	ret i32 0
}

define %Object* @Main_main(%Main* %self) {

entry:
	%tmp.0 = alloca %Main*
	store %Main* %self, %Main** %tmp.0
	%tmp.1 = load %Main** %tmp.0
	%tmp.2 = getelementptr %Main* %tmp.1, i32 0, i32 1
	%tmp.3 = icmp eq %Main* %tmp.1, null
	br i1 %tmp.3, label %abort, label %ok.0

ok.0:
	%tmp.4 = getelementptr %Main* %tmp.1, i32 0, i32 0
	%tmp.5 = load %Main_vtable** %tmp.4
	%tmp.6 = getelementptr %Main_vtable* %tmp.5, i32 0, i32 7
	%tmp.7 = load %Main* (%Main*,%String*) ** %tmp.6
	%tmp.8 = call %Main*(%Main*,  )* %tmp.7( %Main* %tmp.1,   )
	%tmp.9 = load %Main** %tmp.0
	%tmp.10 = getelementptr %Main* %tmp.9, i32 0, i32 1
	%tmp.11 = icmp eq %Main* %tmp.9, null
	br i1 %tmp.11, label %abort, label %ok.1

ok.1:
	%tmp.12 = getelementptr %Main* %tmp.9, i32 0, i32 0
	%tmp.13 = load %Main_vtable** %tmp.12
	%tmp.14 = getelementptr %Main_vtable* %tmp.13, i32 0, i32 10
	%tmp.15 = load i32 (%Main*) * %tmp.14
	%tmp.16 = call %Main*(%Main* )* %tmp.15( %Main* %tmp.9 )
	%tmp.17 = alloca i32
	store %Main* %tmp.16, i32* %tmp.17
	%tmp.18 = alloca %Main
	%tmp.19 = load i32* %tmp.17
	%tmp.20 = getelementptr i32 %tmp.19, i32 0, i32 1
	%tmp.21 = icmp slt i32 %tmp.19, 0
	br i1 %tmp.21, label %true.0, label %false.0

true.0:
	%tmp.22 = load %Main** %tmp.0
	%tmp.23 = getelementptr %Main* %tmp.22, i32 0, i32 1
	%tmp.24 = icmp eq %Main* %tmp.22, null
	br i1 %tmp.24, label %abort, label %ok.2

ok.2:
	%tmp.25 = getelementptr %Main* %tmp.22, i32 0, i32 0
	%tmp.26 = load %Main_vtable** %tmp.25
	%tmp.27 = getelementptr %Main_vtable* %tmp.26, i32 0, i32 7
	%tmp.28 = load %Main* (%Main*,%String*) ** %tmp.27
	%tmp.29 = call %Main*(%Main*,  )* %tmp.28( %Main* %tmp.22,   )
	store %Main* %tmp.29, %Main* %tmp.18
	br label %end.0

false.0:
	%tmp.30 = load %Main** %tmp.0
	%tmp.31 = getelementptr %Main* %tmp.30, i32 0, i32 1
	%tmp.32 = load i32* %tmp.17
	%tmp.33 = getelementptr i32 %tmp.32, i32 0, i32 1
	%tmp.34 = icmp eq %Main* %tmp.30, null
	br i1 %tmp.34, label %abort, label %ok.3

ok.3:
	%tmp.35 = getelementptr %Main* %tmp.30, i32 0, i32 0
	%tmp.36 = load %Main_vtable** %tmp.35
	%tmp.37 = getelementptr %Main_vtable* %tmp.36, i32 0, i32 12
	%tmp.38 = load i32 (%Main*,i32) * %tmp.37
	%tmp.39 = call %Main*(%Main*, i32 )* %tmp.38( %Main* %tmp.30, i32 %tmp.32 )
	%tmp.40 = load %Main** %tmp.0
	%tmp.41 = getelementptr %Main* %tmp.40, i32 0, i32 1
	store %Main* %tmp.39, %Main** %tmp.41
	%tmp.42 = load %Main** %tmp.0
	%tmp.43 = getelementptr %Main* %tmp.42, i32 0, i32 1
	%tmp.44 = icmp eq %Main* %tmp.42, null
	br i1 %tmp.44, label %abort, label %ok.5

ok.5:
	%tmp.45 = getelementptr %Main* %tmp.42, i32 0, i32 0
	%tmp.46 = load %Main_vtable** %tmp.45
	%tmp.47 = getelementptr %Main_vtable* %tmp.46, i32 0, i32 7
	%tmp.48 = load %Main* (%Main*,%String*) ** %tmp.47
	%tmp.49 = call %Main*(%Main*,  )* %tmp.48( %Main* %tmp.42,   )
	%tmp.50 = load i32* %tmp.17
	%tmp.51 = getelementptr i32 %tmp.50, i32 0, i32 1
	%tmp.52 = icmp eq %Main* %tmp.49, null
	br i1 %tmp.52, label %abort, label %ok.5

ok.5:
	%tmp.53 = getelementptr %Main* %tmp.49, i32 0, i32 0
	%tmp.54 = load %Main_vtable** %tmp.53
	%tmp.55 = getelementptr %Main_vtable* %tmp.54, i32 0, i32 8
	%tmp.56 = load %Main* (%Main*,i32) ** %tmp.55
	%tmp.57 = call %Main*(%Main*, i32 )* %tmp.56( %Main* %tmp.49, i32 %tmp.50 )
	%tmp.58 = load %Main** %tmp.0
	%tmp.59 = getelementptr %Main* %tmp.58, i32 0, i32 1
	%tmp.60 = icmp eq %Main* %tmp.58, null
	br i1 %tmp.60, label %abort, label %ok.7

ok.7:
	%tmp.61 = getelementptr %Main* %tmp.58, i32 0, i32 0
	%tmp.62 = load %Main_vtable** %tmp.61
	%tmp.63 = getelementptr %Main_vtable* %tmp.62, i32 0, i32 7
	%tmp.64 = load %Main* (%Main*,%String*) ** %tmp.63
	%tmp.65 = call %Main*(%Main*,  )* %tmp.64( %Main* %tmp.58,   )
	%tmp.66 = load %Main** %tmp.0
	%tmp.67 = getelementptr %Main* %tmp.66, i32 0, i32 1
	%tmp.68 = icmp eq %Main* %tmp.65, null
	br i1 %tmp.68, label %abort, label %ok.7

ok.7:
	%tmp.69 = getelementptr %Main* %tmp.65, i32 0, i32 0
	%tmp.70 = load %Main_vtable** %tmp.69
	%tmp.71 = getelementptr %Main_vtable* %tmp.70, i32 0, i32 8
	%tmp.72 = load %Main* (%Main*,i32) ** %tmp.71
	%tmp.73 = call %Main*(%Main*, %Main* )* %tmp.72( %Main* %tmp.65, %Main* %tmp.66 )
	store %Main* %tmp.73, %Main* %tmp.18
	br label %end.0

end.0:
	%tmp.74 = load %Main* %tmp.18
	%tmp.75 = bitcast %Main %tmp.74 to %Object*
	ret %Object* %tmp.75

abort:
	call void @abort(  )
	unreachable
}

define i32 @Main_factorial(%Main* %self, %Main* %self, i32 %num) {

entry:
	%tmp.77 = alloca %Main*
	store %Main* %self, %Main** %tmp.77
	%tmp.78 = alloca %Main*
	store %Main* %self, %Main** %tmp.78
	%tmp.79 = alloca i32
	store i32 %num, i32* %tmp.79
	%tmp.80 = alloca i32
	%tmp.81 = load i32* %tmp.79
	%tmp.82 = icmp eq i32 %tmp.81, 0
	br i1 %tmp.82, label %true.1, label %false.1

true.1:
	store i32 1, i32* %tmp.80
	br label %end.1

false.1:
	%tmp.83 = load i32* %tmp.79
	%tmp.84 = load %Main** %tmp.78
	%tmp.85 = load i32* %tmp.79
	%tmp.86 = sub i32 %tmp.85, 1
	%tmp.87 = icmp eq %Main* %tmp.84, null
	br i1 %tmp.87, label %abort, label %ok.8

ok.8:
	%tmp.88 = getelementptr %Main* %tmp.84, i32 0, i32 0
	%tmp.89 = load %Main_vtable** %tmp.88
	%tmp.90 = getelementptr %Main_vtable* %tmp.89, i32 0, i32 12
	%tmp.91 = load i32 (%Main*,i32) * %tmp.90
	%tmp.92 = call %Main*(%Main*, i32 )* %tmp.91( %Main* %tmp.84, i32 %tmp.86 )
	%tmp.93 = mul i32 %tmp.83, %tmp.92
	store i32 %tmp.93, i32* %tmp.80
	br label %end.1

end.1:
	%tmp.94 = load i32* %tmp.80
	ret i32 %tmp.94

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%tmp.96 = getelementptr %Main_vtable* @Main_vtable_prototype, i32 0, i32 1
	%tmp.97 = load i32* %tmp.96
	%tmp.98 = call i8*(i32 )* @malloc( i32 %tmp.97 )
	%tmp.99 = bitcast i8* %tmp.98 to %Main*
	%tmp.100 = getelementptr %Main* %tmp.99, i32 0, i32 0
	store %Main_vtable* @Main_vtable_prototype, %Main_vtable** %tmp.100
	%tmp.101 = alloca %Main*
	store %Main* %tmp.99, %Main** %tmp.101
	%tmp.102 = getelementptr %Main* %tmp.99, i32 0, i32 1
	store i32 1314, i32* %tmp.102
	ret %Main* %tmp.99

abort:
	call void @abort(  )
	unreachable
}

