'use strict'

angular.module('peoplemapApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.people = [
      'adam'
      'brian'
      'john'
      'arthur'
    ]
    $scope.addUser = ->
      $scope.people.push $scope.user
      $scope.user = ''
    $scope.removeUser = (index) ->
      $scope.people.splice(index, 1)
