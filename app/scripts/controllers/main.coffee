'use strict'

app = angular.module('peoplemapApp')

app.controller 'MainCtrl', ($scope, $rootScope) ->
  $scope.people = [
    name: 'jan'
    location: 'poznan'
  ,
    name: 'john'
    location: 'warsaw'
  ]

  $scope.$on 'user:added', (name, user) ->
    $scope.people.push user

  $scope.geocoder = new google.maps.Geocoder()
  $scope.setCoordinates = (location, object) ->
    $scope.geocoder.geocode { address: location }, (results, status) ->
      if status is google.maps.GeocoderStatus.OK
        $scope.$apply ->
          object.coordinates = results[0].geometry.location
          return
      else
        console.error "Geocode was not successful for the following reason: " + status

  $scope.onPeopleChanged = (newValue, oldValue, scope) ->
    angular.forEach scope.people, (value, key) ->
      $scope.setCoordinates(value.location, value) unless value.coordinates?

  $scope.$watchCollection('people', $scope.onPeopleChanged)

  $scope.removeUser = (index) ->
    $scope.people.splice(index, 1)

app.directive 'userForm', ->
  restrict: 'E'
  templateUrl: 'views/_user_form.html'
  controller: ($scope, $rootScope) ->
    $scope.addUser = ->
      $scope.$emit 'user:added', $scope.user
      $scope.user = {}
      $scope.userForm.$setPristine()

  scope: '=user'

app.directive 'usersTable', ->
  restrict: 'E'
  templateUrl: 'views/_users_table.html'

app.servi
