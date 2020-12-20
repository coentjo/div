Class {
	#name : #Gerecht,
	#superclass : #Object,
	#instVars : [
		'anagram',
		'means',
		'country',
		'latLong'
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
	^ anagram
]

{ #category : #accessing }
Gerecht >> anagram: aString [ 
	anagram := aString
]

{ #category : #accessing }
Gerecht >> country [
	^ country
]

{ #category : #accessing }
Gerecht >> from: aString [ 
	country := aString 
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
	^ means
]

{ #category : #accessing }
Gerecht >> means: aString [ 
	means := aString 
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
