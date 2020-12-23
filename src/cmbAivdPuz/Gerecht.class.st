Class {
	#name : #Gerecht,
	#superclass : #Object,
	#instVars : [
		'anagram',
		'means',
		'country',
		'latLong',
		'indexInCol'
	],
	#classInstVars : [
		'latitude',
		'longitude',
		'latitudeLongitude'
	],
	#category : #cmbAivdPuz
}

{ #category : #'instance creation' }
Gerecht class >> for: aAna means: aDish from: aCountry [

	^ self new
		anagram: aAna;
		means: aDish;
		from: aCountry;
		yourself 
]

{ #category : #accessing }
Gerecht >> anagram [

	^ anagram ifNil: [ '-???-' ]
]

{ #category : #accessing }
Gerecht >> anagram: aString [ 
	anagram := aString
]

{ #category : #accessing }
Gerecht >> country [

	^ country ifNil: [ '-???-' ]
]

{ #category : #accessing }
Gerecht >> from: aString [ 
	country := aString 
]

{ #category : #testing }
Gerecht >> gpsYetUnknown [

	^ latLong = nil
]

{ #category : #accessing }
Gerecht >> indexInCol [
	^ indexInCol
]

{ #category : #accessing }
Gerecht >> indexInCol: anInteger [ 
	indexInCol := anInteger 
]

{ #category : #accessing }
Gerecht >> latLong [

	^ latLong
]

{ #category : #accessing }
Gerecht >> latLong: anObject [

	latLong := anObject
]

{ #category : #accessing }
Gerecht >> latitudeLongitude [
	^ latLong 
]

{ #category : #accessing }
Gerecht >> latitudeLongitude: aPoint [ 
	latLong := aPoint 
]

{ #category : #accessing }
Gerecht >> means [

	^ means ifNil: [ '-???-' ]
]

{ #category : #accessing }
Gerecht >> means: aString [ 
	means := aString 
]

{ #category : #testing }
Gerecht >> meansYetUnknow [
	^ means = nil
]

{ #category : #accessing }
Gerecht >> printOn: s [

	s
		nextPutAll: self anagram;
		nextPutAll: ' -> ';
		nextPutAll: self means;
		nextPutAll: ' -> ';
		nextPutAll: self country;
		nextPutAll: ' -> ';
		nextPutAll: self latLong asString
]
