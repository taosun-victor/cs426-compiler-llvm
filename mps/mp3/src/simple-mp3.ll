declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
define i32 @Main_main() {

entry:
	%vtpm.0 = alloca i32
	store i32 0, i32* %vtpm.0
	%vtpm.1 = alloca i1
	store i1 false, i1* %vtpm.1
	store i1 false, i1* %vtpm.1
	store i32 1, i32* %vtpm.0
	ret i32 1

abort:
	call void @abort(  )
	unreachable
}

@.str = constant [25 x i8] c"Main.main() returned %d\0A\00"
define i32 @main() {

entry:
	%vtpm.3 = call i32 @Main_main(  )
	%vtpm.4 = getelementptr [25 x i8]* @.str, i32 0, i32 0
	%vtpm.5 = call i32(i8*, ... )* @printf( i8* %vtpm.4, i32 %vtpm.3 )
	ret i32 0
}

