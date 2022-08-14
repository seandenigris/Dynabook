Class {
	#name : #DbGtHomeSection,
	#superclass : #GtHomeSection,
	#category : #'Dynabook-GToolkit'
}

{ #category : #stencils }
DbGtHomeSection >> buttonTitled: aString iconFileNamed: iconName tooltip: tipString inspecting: anObject [
	^ GtToolButtonStencil new 
		title: aString;
		icon: (self iconFromFileNamed: iconName);
		iconSize: 50@50;
		action: [ :card | 
			self
				showSpaceWithTitle: aString
				with:
					(GtInspector
						createOn: anObject) maximized
				from: card ];
		description: tipString.
]

{ #category : #private }
DbGtHomeSection >> iconFromFileNamed: aString [
	| result |
	result := GtFileUtility imageElementFromFileReference: BaselineOfDynabook iconFolder / aString.
	^ result
		alignBottomCenter;
		yourself	
]
