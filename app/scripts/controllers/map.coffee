app = angular.module('peoplemapApp')

app.controller 'MapCtrl',
  ['$window', '$scope', ($window, $scope) ->
    $scope.centerOn =
      latitude: 59.9189046
      longitude: 19.1343786
    $scope.googleMap = {}
    $scope.zoom = 3

    $scope.getLocation = ->
      $window.navigator.geolocation.getCurrentPosition(onPositionAcquired, onPositionError)

    onPositionAcquired = (position) ->
      $scope.$apply ->
        $scope.googleMap.getGMap().panTo(convertCoords(position.coords))
        $scope.googleMap.getGMap().setZoom(10)

    convertCoords = (coords) ->
      new google.maps.LatLng(coords.latitude, coords.longitude)

    onPositionError = (error) ->
      console.error error
  ]
