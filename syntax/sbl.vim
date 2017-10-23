" Vim syntax file
" Language:	Siebel VBScript + eScript files(ft=sbl)
" Maintainer: Giuseppe Garofalo <giupino.garofalo@gmail.com>
" Maintainer:	
" Last Change:	Tue 17/10/2017 
" 
" Based on sbl vb syntax file by Mayuresh Kadu <mskadu@yahoo.com>
" And needs to be in $VIM_HOME/vimfiles/syntax



" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" VB is case insensitive
" syn case ignore
" Siebel is case sensitive

syn keyword vbStatement var if for with null while and or else case switch break function try catch finally return new

syn keyword vbFunction TheApplication throw this LoadUserAttributes Clib chars float bool undefined String boolean 
syn keyword vbFunction array Blob BlobDescriptor Buffer BusComp BusObject CfgItem Clib CTIData CTIService Date Exception File Math 
syn keyword vbFunction PropertySet RegExp SELib Service WebApplet Number Application Number Boolean


syn keyword vbMethods GetBusObject GetBusComp ClearToQuery SetViewMode ActivateField SetSearchExpr SetSearchSpec ExecuteQuery RaiseErrorText FirstRecord
syn keyword vbMethods NextRecord InvokeMethod ActiveBusObject GetFieldValue GetService NewPropertySet GetProperty SetProperty RaiseError true false CanInvoke
syn keyword vbMethods BusComp ActiveMode BusObject FindActiveXControl FindControl Name ActiveApplet ActiveBusComp ActiveViewName Attach CurrencyCode Detach 
syn keyword vbMethods EnableExceptions FindApplet GetLastErrCode GetLastErrText GetProfileAttr GetSharedGlobal GotoView LoadObjects Login LoginId Logoff
syn keyword vbMethods LookupMessage PositionId PositionName SetPositionId SetPositionName SetProfileAttr SetSharedGlobal ShowModalDialog SWEAlert Trace
syn keyword vbMethods TraceOff TraceOn ActivateMultipleFields Associate CountRecords DeactivateFields DeleteRecord ExecuteQuery2 FirstSelected GetAssocBusComp
syn keyword vbMethods GetFormattedFieldValue GetMultipleFieldValues GetMVGBusComp GetNamedSearch GetPicklistBusComp GetSearchExpr GetSearchSpec GetSortSpec
syn keyword vbMethods GetUserProperty GetViewMode LastRecord NextSelected ParentBusComp Pick PreviousRecord RefineQuery release SetFieldValue 
syn keyword vbMethods SetFormattedFieldValue SetMultipleFieldValues SetNamedSearch SetSortSpec SetUserProperty UndoRecord WriteRecord GetValue SetLabelProperty
syn keyword vbMethods SetValue AddChild Copy getByteValue GetChild GetChildCount GetFirstProperty GetPropertyCount GetType InsertChildAt PropertyExists
syn keyword vbMethods RemoveChild RemoveProperty Reset setByteValue SetType asctime bsearch chdir clearerr clock cosh ctime difftime div ldiv errno fclose feof
syn keyword vbMethods ferror fflush fgetc getc fgetpos fgets flock fopen fprintf fputc putc fputs fread freopen frexp fscanf fseek fsetpos ftell fwrite fgetc
syn keyword vbMethods getc getcwd getenv gmtime ldexp isalnum isalpha isascii iscntrl isdigit isgraph islower isprint ispunct isspace isupper isxdigit div ldiv
syn keyword vbMethods localtime memchr memcmp memcpy memmove memset mkdir mktime fputc putc putenv qsort rand remove rename rewind rmdir rsprintf sinh sprintf
syn keyword vbMethods srand sscanf strchr stricmp strcmpi strcspn strerror strftime strlwr strncat strncmp strncmpi strnicmp strncpy strpbrk strrchr strspn
syn keyword vbMethods strstr strstri system tanh time tmpfile tmpnam toascii ungetc errText errCode

syn keyword vbEvents ForwardOnly ForwardBackward AllView ForwardBackward NewBefore NewAfter NewBeforeCopy 
syn keyword vbEvents NewAfterCopy SalesRepView ManagerView PersonalView OrganizationView GroupView CatalogViewSubOrganizationView 
syn keyword vbEvents CancelOperation ContinueOperation

syn keyword vbTodo contained	TODO

"integer number, or floating point number without a dot.
syn match  vbNumber		"\<\d\+\>"
"floating point number, with dot
syn match  vbNumber		"\<\d\+\.\d*\>"
"floating point number, starting with a dot
syn match  vbNumber		"\.\d\+\>"

" String and Character contstants
syn region  vbString		  start=+"+  end=+"+
syn region  vbString		  start=+'+  end=+'+
syn region  vbComment   start="/\*"  end="\*/" contains=vbTodo
syn match   vbComment	 "//.*" contains=vbTodo
syn region  vbLineNumber	start="^\d" end="\s"
syn match   vbTypeSpecifier  "[a-zA-Z0-9][\$%&!#]"ms=s+1

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_vb_syntax_inits")
  if version < 508
    let did_vb_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink vbLineNumber		Comment
  HiLink vbNumber		Number
  HiLink vbError		Error
  HiLink vbStatement		Statement
  HiLink vbString		String
  HiLink vbComment		Comment
  HiLink vbTodo			Todo
  HiLink vbFunction		Identifier
  HiLink vbMethods		PreProc
  HiLink vbEvents		Special
  HiLink vbTypeSpecifier	Type

  delcommand HiLink
endif

let b:current_syntax = "sbl"

" vim: ts=8
