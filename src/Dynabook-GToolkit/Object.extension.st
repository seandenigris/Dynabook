Extension { #name : #Object }

{ #category : #'*Dynabook-GToolkit' }
Object >> gtMagritteFor: aView [

	<gtView>
	"We do not compute descriptions because this can be expensive
	and we want the view to be fast."
	self hasMagritteDescription ifFalse: [ ^ aView empty ].

	^ aView explicit
		  title: 'GT Magritte';
		  priority: 105;
		  stencil: [ self asGtMagritteViewModel ];
		  actionButtonIcon: BrGlamorousVectorIcons inspect
		  label: 'Memento'
		  tooltip: 'Inspect Memento'
		  action: [ :aButton :aTab | 
			  aTab viewContentElement
				  allChildrenBreadthFirstDetect: [ :anElement | 
					  anElement userData includesKey:
							  GtMagritteViewModel gtMementoSymbol ]
				  ifFound: [ :anElement | 
					  aButton phlow spawnObject:
							  (anElement userData at: GtMagritteViewModel gtMementoSymbol) ] ]
]
