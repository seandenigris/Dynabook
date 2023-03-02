Class {
	#name : #SdScriptFunctionCall,
	#superclass : #Object,
	#instVars : [
		'functionName',
		'arguments',
		'script',
		'stubMap',
		'stubScript'
	],
	#category : #'Dynabook-SmalltalkCI'
}

{ #category : #accessing }
SdScriptFunctionCall class >> example [
	<gtExample>
	
	| scriptFile |
	scriptFile := Tempfile withSuffix: '.sh'.
	scriptFile writeStreamDo: [ :str |
		str << 'sdPrettyPrint() {
  local arg1=$1
  echo "The answer is $arg1"
}' withUnixLineEndings ].

	^ self new
		script: scriptFile;
		functionName: 'sdPrettyPrint';
		arguments: #('2');
		output.
]

{ #category : #accessing }
SdScriptFunctionCall class >> exampleStub [
	<gtExample>
	
	| scriptFile result |
	scriptFile := Tempfile withSuffix: '.sh'.
	scriptFile writeStreamDo: [ :str |
		str << 'sdPrettyPrint() {
  local arg1=$1
  echo "The answer is $arg1"
}' withUnixLineEndings ].

	result := self new
		script: scriptFile;
		stub: 'sdPrettyPrint' with: 'echo "Stubbed value"';
		functionName: 'sdPrettyPrint';
		arguments: #('3');
		yourself.
		
	result output trimmed should equal: 'Stubbed value'.
	
	^ result
]

{ #category : #accessing }
SdScriptFunctionCall >> arguments [
	^ arguments
]

{ #category : #accessing }
SdScriptFunctionCall >> arguments: anObject [
	arguments := anObject
]

{ #category : #accessing }
SdScriptFunctionCall >> commandString [

	^ String streamContents: [ :str |
		str << 'source ' << self script suForCommand << ' && '.
		
		self stubMap ifNotEmpty: [
			str << 'source ' << self ensureStubScript suForCommand << ' && ' ].
			
		str << self functionName surroundedByDoubleQuotes << ' ' << self arguments suForCommand ]
]

{ #category : #accessing }
SdScriptFunctionCall >> ensureStubScript [

	stubScript ifNil: [ stubScript := Tempfile withSuffix: 'stubs.sh' ].
	
	stubScript writeStreamDo: [ :str |
		self stubMap keysAndValuesDo: [ :k :v |
			str << k << '() {'; lf; 
				<< '  '; << v; lf;
				<< '}'; lf; lf ] ].
			
	^ stubScript
]

{ #category : #accessing }
SdScriptFunctionCall >> functionName [
	^ functionName
]

{ #category : #accessing }
SdScriptFunctionCall >> functionName: anObject [
	functionName := anObject
]

{ #category : #accessing }
SdScriptFunctionCall >> output [

	OSSUnixSubprocess new
		shellCommand: self commandString;
		redirectStderr;
		redirectStdout;
		runAndWaitOnExitDo: [ :command :outString :errString | 
			command isSuccess ifFalse: [ self error: 'tesseract failed with: ' , errString ].
			^ outString ].
]

{ #category : #accessing }
SdScriptFunctionCall >> script [
	^ script
]

{ #category : #accessing }
SdScriptFunctionCall >> script: anObject [
	script := anObject
]

{ #category : #accessing }
SdScriptFunctionCall >> stub: fncName willReturn: aString [

	self stubMap at: fncName put: aString
]

{ #category : #accessing }
SdScriptFunctionCall >> stub: fncName with: aString [ 

	self stubMap at: fncName put: aString
]

{ #category : #accessing }
SdScriptFunctionCall >> stubMap [
	^ stubMap ifNil: [ stubMap := Dictionary new ].
]

{ #category : #accessing }
SdScriptFunctionCall >> stubMap: anObject [
	stubMap := anObject
]

{ #category : #accessing }
SdScriptFunctionCall >> stubScript [
	^ stubScript
]

{ #category : #accessing }
SdScriptFunctionCall >> stubScript: anObject [
	stubScript := anObject
]
