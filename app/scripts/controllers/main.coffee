'use strict'

app = angular.module('peoplemapApp')

app.controller 'MainCtrl', ($scope, $rootScope) ->
  $scope.people = [
    name: 'jan'
    location: 'kozieglowy'
    coordinates: {}
  ,
    name: 'john'
    location: 'warsaw'
    coordinates: {}
  ,
    name: 'janusz'
    location: 'gdansk'
    coordinates: {}
  ]

  $scope.places = [
    name: 'netguru HQ'
    location: '27 Grudnia 3, 61-737 Poznań'
    coordinates: {}
  ,
    name: 'netguru Gdansk'
    location: 'Grunwaldzka 472, 80-236 Gdańsk'
    coordinates: {}
  ,
    name: 'netguru Warsaw'
    location: 'Henryka Dembińskiego 16B, 01-644 Warsaw'
    coordinates: {}
  ,
    name: 'netguru Zielona Gora'
    location: 'ul. Kazimierza Wielkiego 7/5, 65-047 Zielona Góra'
    coordinates: {}
  ]

  $scope.$on 'user:added', (name, user) ->
    $scope.people.push user

  $scope.geocoder = new google.maps.Geocoder()
  $scope.setCoordinates = (location, object) ->
    $scope.geocoder.geocode { address: location }, (results, status) ->
      if status is google.maps.GeocoderStatus.OK
        $scope.$apply ->
          object.coordinates =
            latitude: results[0].geometry.location.lat()
            longitude: results[0].geometry.location.lng()
          return
      else
        console.error "Geocode was not successful for the following reason: " + status

  $scope.onPeopleChanged = (newValue, oldValue, scope) ->
    angular.forEach scope.people, (value, key) ->
      $scope.setCoordinates(value.location, value) unless value.coordinates?.latitude?
  $scope.onPlaceChanged = (newValue, oldValue, scope) ->
    angular.forEach scope.places, (value, key) ->
      $scope.setCoordinates(value.location, value) unless value.coordinates?.latitude?


  $scope.$watchCollection('people', $scope.onPeopleChanged)
  $scope.$watchCollection('places', $scope.onPlaceChanged)

  $scope.removeUser = (index) ->
    $scope.people.splice(index, 1)

app.directive 'userForm', ->
  restrict: 'E'
  templateUrl: 'views/_user_form.html'
  controller: ($scope, $rootScope) ->
    $scope.addUser = ->
      $scope.user.coordinates = {}
      $scope.$emit 'user:added', $scope.user
      $scope.user = {}
      $scope.userForm.$setPristine()

  scope: '=user'

app.directive 'usersTable', ->
  restrict: 'E'
  templateUrl: 'views/_users_table.html'
