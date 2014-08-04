app = angular.module('peoplemapApp')

app.controller 'MapCtrl',
  ['$window', '$scope', ($window, $scope) ->
    $scope.centerOn =
      latitude: 59.9189046
      longitude: 19.1343786
    $scope.zoom = 3
  ]
