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

  $scope.addUser = ->
    $scope.people.push $scope.user
    $scope.user = ''

  $scope.removeUser = (index) ->
    $scope.people.splice(index, 1)

  startingPoint =
    latitude: 51.9189046
    longitude: 19.1343786

  $scope.map =
    center: startingPoint
    zoom: 5
