'use strict'

###*
 # @ngdoc function
 # @name peoplemapApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the peoplemapApp
###
angular.module('peoplemapApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'adamo'
      'AngularJS'
      'Karma'
    ]
