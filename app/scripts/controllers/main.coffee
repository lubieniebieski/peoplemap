'use strict'

app = angular.module('peoplemapApp')

app.controller 'MainCtrl', ($scope, $rootScope) ->
  $scope.people = [
    name: 'jan'
    location: 'poznan'
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

  $scope.$watchCollection('people', $scope.onPeopleChanged)

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
