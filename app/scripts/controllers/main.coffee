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

app.directive 'userForm', ->
  restrict: 'E'
  templateUrl: 'views/_user_form.html'

app.directive 'usersTable', ->
  restrict: 'E'
  templateUrl: 'views/_users_table.html'
