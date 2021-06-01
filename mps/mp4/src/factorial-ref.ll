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
@str.Object = internal constant [7 x i8] c"Object\00", align 1
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
	i32 ptrtoint (%Object* getelementptr (%Object, %Object* null, i32 1) to i32),
	i8* getelementptr ([7 x i8], [7 x i8]* @str.Object, i32 0, i32 0),
	%Object* () * @Object_new,
	%Object* (%Object*) * @Object_abort,
	%String* (%Object*) * @Object_type_name,
	%Object* (%Object*) * @Object_copy
}

@str.Int = internal constant [4 x i8] c"Int\00", align 1
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
	i32 ptrtoint (%Int* getelementptr (%Int, %Int* null, i32 1) to i32),
	i8* getelementptr ([4 x i8], [4 x i8]* @str.Int, i32 0, i32 0),
	%Int* () * @Int_new,
	%Object* (%Int*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Int*) *),
	%String* (%Int*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Int*) *),
	%Int* (%Int*) * bitcast (%Object* (%Object*) * @Object_copy to %Int* (%Int*) *)
}

@str.Bool = internal constant [5 x i8] c"Bool\00", align 1
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
	i32 ptrtoint (%Bool* getelementptr (%Bool, %Bool* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Bool, i32 0, i32 0),
	%Bool* () * @Bool_new,
	%Object* (%Bool*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Bool*) *),
	%String* (%Bool*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Bool*) *),
	%Bool* (%Bool*) * bitcast (%Object* (%Object*) * @Object_copy to %Bool* (%Bool*) *)
}

@str.String = internal constant [7 x i8] c"String\00", align 1
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
	i32 ptrtoint (%String* getelementptr (%String, %String* null, i32 1) to i32),
	i8* getelementptr ([7 x i8], [7 x i8]* @str.String, i32 0, i32 0),
	%String* () * @String_new,
	%Object* (%String*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%String*) *),
	%String* (%String*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%String*) *),
	%String* (%String*) * bitcast (%Object* (%Object*) * @Object_copy to %String* (%String*) *),
	i32 (%String*) * @String_length,
	%String* (%String*,%String*) * @String_concat,
	%String* (%String*,i32,i32) * @String_substr
}

@str.IO = internal constant [3 x i8] c"IO\00", align 1
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
	i32 ptrtoint (%IO* getelementptr (%IO, %IO* null, i32 1) to i32),
	i8* getelementptr ([3 x i8], [3 x i8]* @str.IO, i32 0, i32 0),
	%IO* () * @IO_new,
	%Object* (%IO*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%IO*) *),
	%String* (%IO*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%IO*) *),
	%IO* (%IO*) * bitcast (%Object* (%Object*) * @Object_copy to %IO* (%IO*) *),
	%IO* (%IO*,%String*) * @IO_out_string,
	%IO* (%IO*,i32) * @IO_out_int,
	%String* (%IO*) * @IO_in_string,
	i32 (%IO*) * @IO_in_int
}

@str.Main = internal constant [5 x i8] c"Main\00", align 1
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
	i32 ptrtoint (%Main* getelementptr (%Main, %Main* null, i32 1) to i32),
	i8* getelementptr ([5 x i8], [5 x i8]* @str.Main, i32 0, i32 0),
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

@str.5 = internal constant [14 x i8] c"<basic class>\00", align 1
@String.5 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([14 x i8], [14 x i8]* @str.5, i32 0, i32 0)
}

@str.4 = internal constant [5 x i8] c" is \00", align 1
@String.4 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([5 x i8], [5 x i8]* @str.4, i32 0, i32 0)
}

@str.3 = internal constant [18 x i8] c"The factorial of \00", align 1
@String.3 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([18 x i8], [18 x i8]* @str.3, i32 0, i32 0)
}

@str.2 = internal constant [50 x i8] c"ERROR: Number must be greater-than or equal-to 0\0A\00", align 1
@String.2 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([50 x i8], [50 x i8]* @str.2, i32 0, i32 0)
}

@str.1 = internal constant [46 x i8] c"Enter an integer greater-than or equal-to 0: \00", align 1
@String.1 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([46 x i8], [46 x i8]* @str.1, i32 0, i32 0)
}

@str.0 = internal constant [13 x i8] c"factorial.cl\00", align 1
@String.0 = constant %String {
	%String_vtable* @String_vtable_prototype,
	i8* getelementptr ([13 x i8], [13 x i8]* @str.0, i32 0, i32 0)
}

define i32 @main() {
entry:
	%main.obj = call %Main*() @Main_new( )
	%main.retval = call %Object*(%Main*) @Main_main( %Main* %main.obj )
	ret i32 0
}

define %Object* @Main_main(%Main* %self) {

entry:
	%tmp.0 = alloca %Main*
	store %Main* %self, %Main** %tmp.0
	%tmp.1 = load %Main*, %Main** %tmp.0
	%tmp.2 = icmp eq %Main* %tmp.1, null
	br i1 %tmp.2, label %abort, label %ok.0

ok.0:
	%tmp.3 = getelementptr %Main, %Main* %tmp.1, i32 0, i32 0
	%tmp.4 = load %Main_vtable*, %Main_vtable** %tmp.3
	%tmp.5 = getelementptr %Main_vtable, %Main_vtable* %tmp.4, i32 0, i32 7
	%tmp.6 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.5
	%tmp.7 = call %Main*(%Main*, %String*) %tmp.6( %Main* %tmp.1, %String* @String.1 )
	%tmp.8 = load %Main*, %Main** %tmp.0
	%tmp.9 = icmp eq %Main* %tmp.8, null
	br i1 %tmp.9, label %abort, label %ok.1

ok.1:
	%tmp.10 = getelementptr %Main, %Main* %tmp.8, i32 0, i32 0
	%tmp.11 = load %Main_vtable*, %Main_vtable** %tmp.10
	%tmp.12 = getelementptr %Main_vtable, %Main_vtable* %tmp.11, i32 0, i32 10
	%tmp.13 = load i32 (%Main*) *, i32 (%Main*) ** %tmp.12
	%tmp.14 = call i32(%Main*) %tmp.13( %Main* %tmp.8 )
	%tmp.15 = alloca i32
	store i32 %tmp.14, i32* %tmp.15
	%tmp.16 = alloca %Main*
	%tmp.17 = load i32, i32* %tmp.15
	%tmp.18 = icmp slt i32 %tmp.17, 0
	br i1 %tmp.18, label %true.0, label %false.0

true.0:
	%tmp.19 = load %Main*, %Main** %tmp.0
	%tmp.20 = icmp eq %Main* %tmp.19, null
	br i1 %tmp.20, label %abort, label %ok.2

ok.2:
	%tmp.21 = getelementptr %Main, %Main* %tmp.19, i32 0, i32 0
	%tmp.22 = load %Main_vtable*, %Main_vtable** %tmp.21
	%tmp.23 = getelementptr %Main_vtable, %Main_vtable* %tmp.22, i32 0, i32 7
	%tmp.24 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.23
	%tmp.25 = call %Main*(%Main*, %String*) %tmp.24( %Main* %tmp.19, %String* @String.2 )
	store %Main* %tmp.25, %Main** %tmp.16
	br label %end.0

false.0:
	%tmp.26 = load i32, i32* %tmp.15
	%tmp.27 = load %Main*, %Main** %tmp.0
	%tmp.28 = icmp eq %Main* %tmp.27, null
	br i1 %tmp.28, label %abort, label %ok.3

ok.3:
	%tmp.29 = getelementptr %Main, %Main* %tmp.27, i32 0, i32 0
	%tmp.30 = load %Main_vtable*, %Main_vtable** %tmp.29
	%tmp.31 = getelementptr %Main_vtable, %Main_vtable* %tmp.30, i32 0, i32 12
	%tmp.32 = load i32 (%Main*,i32) *, i32 (%Main*,i32) ** %tmp.31
	%tmp.33 = call i32(%Main*, i32) %tmp.32( %Main* %tmp.27, i32 %tmp.26 )
	%tmp.34 = load %Main*, %Main** %tmp.0
	%tmp.35 = getelementptr %Main, %Main* %tmp.34, i32 0, i32 1
	store i32 %tmp.33, i32* %tmp.35
	%tmp.36 = load i32, i32* %tmp.15
	%tmp.37 = load %Main*, %Main** %tmp.0
	%tmp.38 = icmp eq %Main* %tmp.37, null
	br i1 %tmp.38, label %abort, label %ok.5

ok.5:
	%tmp.39 = getelementptr %Main, %Main* %tmp.37, i32 0, i32 0
	%tmp.40 = load %Main_vtable*, %Main_vtable** %tmp.39
	%tmp.41 = getelementptr %Main_vtable, %Main_vtable* %tmp.40, i32 0, i32 7
	%tmp.42 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.41
	%tmp.43 = call %Main*(%Main*, %String*) %tmp.42( %Main* %tmp.37, %String* @String.3 )
	%tmp.44 = icmp eq %Main* %tmp.43, null
	br i1 %tmp.44, label %abort, label %ok.4

ok.4:
	%tmp.45 = getelementptr %Main, %Main* %tmp.43, i32 0, i32 0
	%tmp.46 = load %Main_vtable*, %Main_vtable** %tmp.45
	%tmp.47 = getelementptr %Main_vtable, %Main_vtable* %tmp.46, i32 0, i32 8
	%tmp.48 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %tmp.47
	%tmp.49 = call %Main*(%Main*, i32) %tmp.48( %Main* %tmp.43, i32 %tmp.36 )
	%tmp.50 = load %Main*, %Main** %tmp.0
	%tmp.51 = getelementptr %Main, %Main* %tmp.50, i32 0, i32 1
	%tmp.52 = load i32, i32* %tmp.51
	%tmp.53 = load %Main*, %Main** %tmp.0
	%tmp.54 = icmp eq %Main* %tmp.53, null
	br i1 %tmp.54, label %abort, label %ok.7

ok.7:
	%tmp.55 = getelementptr %Main, %Main* %tmp.53, i32 0, i32 0
	%tmp.56 = load %Main_vtable*, %Main_vtable** %tmp.55
	%tmp.57 = getelementptr %Main_vtable, %Main_vtable* %tmp.56, i32 0, i32 7
	%tmp.58 = load %Main* (%Main*,%String*) *, %Main* (%Main*,%String*) ** %tmp.57
	%tmp.59 = call %Main*(%Main*, %String*) %tmp.58( %Main* %tmp.53, %String* @String.4 )
	%tmp.60 = icmp eq %Main* %tmp.59, null
	br i1 %tmp.60, label %abort, label %ok.6

ok.6:
	%tmp.61 = getelementptr %Main, %Main* %tmp.59, i32 0, i32 0
	%tmp.62 = load %Main_vtable*, %Main_vtable** %tmp.61
	%tmp.63 = getelementptr %Main_vtable, %Main_vtable* %tmp.62, i32 0, i32 8
	%tmp.64 = load %Main* (%Main*,i32) *, %Main* (%Main*,i32) ** %tmp.63
	%tmp.65 = call %Main*(%Main*, i32) %tmp.64( %Main* %tmp.59, i32 %tmp.52 )
	store %Main* %tmp.65, %Main** %tmp.16
	br label %end.0

end.0:
	%tmp.66 = load %Main*, %Main** %tmp.16
	%tmp.67 = bitcast %Main* %tmp.66 to %Object*
	ret %Object* %tmp.67

abort:
	call void @abort(  )
	unreachable
}

define i32 @Main_factorial(%Main* %self, i32 %num) {

entry:
	%tmp.68 = alloca %Main*
	store %Main* %self, %Main** %tmp.68
	%tmp.69 = alloca i32
	store i32 %num, i32* %tmp.69
	%tmp.70 = alloca i32
	%tmp.71 = load i32, i32* %tmp.69
	%tmp.72 = icmp eq i32 %tmp.71, 0
	br i1 %tmp.72, label %true.1, label %false.1

true.1:
	store i32 1, i32* %tmp.70
	br label %end.1

false.1:
	%tmp.73 = load i32, i32* %tmp.69
	%tmp.74 = load i32, i32* %tmp.69
	%tmp.75 = sub i32 %tmp.74, 1
	%tmp.76 = load %Main*, %Main** %tmp.68
	%tmp.77 = icmp eq %Main* %tmp.76, null
	br i1 %tmp.77, label %abort, label %ok.8

ok.8:
	%tmp.78 = getelementptr %Main, %Main* %tmp.76, i32 0, i32 0
	%tmp.79 = load %Main_vtable*, %Main_vtable** %tmp.78
	%tmp.80 = getelementptr %Main_vtable, %Main_vtable* %tmp.79, i32 0, i32 12
	%tmp.81 = load i32 (%Main*,i32) *, i32 (%Main*,i32) ** %tmp.80
	%tmp.82 = call i32(%Main*, i32) %tmp.81( %Main* %tmp.76, i32 %tmp.75 )
	%tmp.83 = mul i32 %tmp.73, %tmp.82
	store i32 %tmp.83, i32* %tmp.70
	br label %end.1

end.1:
	%tmp.84 = load i32, i32* %tmp.70
	ret i32 %tmp.84

abort:
	call void @abort(  )
	unreachable
}

define %Main* @Main_new() {

entry:
	%tmp.85 = getelementptr %Main_vtable, %Main_vtable* @Main_vtable_prototype, i32 0, i32 1
	%tmp.86 = load i32, i32* %tmp.85
	%tmp.87 = call i8*(i32) @malloc( i32 %tmp.86 )
	%tmp.88 = bitcast i8* %tmp.87 to %Main*
	%tmp.89 = getelementptr %Main, %Main* %tmp.88, i32 0, i32 0
	store %Main_vtable* @Main_vtable_prototype, %Main_vtable** %tmp.89
	%tmp.90 = alloca %Main*
	store %Main* %tmp.88, %Main** %tmp.90
	%tmp.91 = getelementptr %Main, %Main* %tmp.88, i32 0, i32 1
	store i32 1314, i32* %tmp.91
	ret %Main* %tmp.88

abort:
	call void @abort(  )
	unreachable
}

