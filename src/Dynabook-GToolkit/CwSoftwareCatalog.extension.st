Extension { #name : 'CwSoftwareCatalog' }

{ #category : '*Dynabook-GToolkit' }
CwSoftwareCatalog >> transactionstGtViewFor: aView [
  <gtView>
 
  ^ aView forward
      title: 'Transactions';
      object: [ self transactions ];
      view: #entriesGtViewOn:
]
