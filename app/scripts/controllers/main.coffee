'use strict'

app = angular.module('peoplemapApp')

app.controller 'MainCtrl', ($scope) ->
  $scope.people = [
    name: 'jan'
    location: 'poznan'
  ,
    name: 'john'
    location: 'warsaw'
  ]

  $scope.geocoder = new google.maps.Geocoder()
  $scope.setCoordinates = (location, object) ->
    $scope.geocoder.geocode { address: location }, (results, status) ->
      if status is google.maps.GeocoderStatus.OK
        object.coordinates = results[0].geometry.location
      else
        console.error "Geocode was not successful for the following reason: " + status

  $scope.onPeopleChanged = (newValue, oldValue, scope) ->
    angular.forEach scope.people, (value, key) ->
      $scope.setCoordinates(value.location, value) unless value.coordinates?

  $scope.$watchCollection('people', $scope.onPeopleChanged)

  $scope.addUser = ->
    $scope.people.push $scope.user
    $scope.user = {}

  $scope.removeUser = (index) ->
    $scope.people.splice(index, 1)

app.directive 'userForm', ->
  restrict: 'E'
  templateUrl: 'views/_user_form.html'

app.directive 'usersTable', ->
  restrict: 'E'
  templateUrl: 'views/_users_table.html'
