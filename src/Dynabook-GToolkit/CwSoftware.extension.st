Extension { #name : 'CwSoftware' }

{ #category : '*Dynabook-GToolkit' }
CwSoftware >> transactionstGtViewFor: aView [
  <gtView>
 
  ^ aView forward
      title: 'Transactions';
      object: [ self transactions ];
      view: #entriesGtViewOn:
]
