Extension { #name : #DataSeries }

{ #category : #'*Dynabook-GToolkit' }
DataSeries >> chart [
	| aData aBarWidthScale |
	aData := GtPlotterDataGroup new values: self sortDescending associations.
	aData := aData colored: Color blue.
	aData := aData labelled: [ :e | e key ].
	
	aBarWidthScale := GtPlotterLinearScale new 
		domainFrom: 0 
		to: [ 7836 ] value.
	
	^ GtPlotterHorizontalBarChart new
		barHeightData: [ :e | e ];
		barWidthData: [ :e | e value ];
		barWidthScale: aBarWidthScale;
		with: aData
]

{ #category : #'*Dynabook-GToolkit' }
DataSeries >> chartTitled: aString [

	| label |
	label := aString asRopedText
		fontSize: 36;
		bold;
		yourself.
		
	^ BrVerticalPane new
		vMatchParent;
		hMatchParent;
		alignCenter;
		addChild: self chart create;
		addChild: (BlTextElement text: label);
		yourself
]
