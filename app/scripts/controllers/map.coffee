app = angular.module('peoplemapApp')

app.controller 'MapCtrl',
  ['$window', '$scope', ($window, $scope) ->
    $scope.centerOn =
      latitude: 59.9189046
      longitude: 19.1343786
    $scope.currentPosition =
      coords:
        longitude: '?'
        latitude: '?'
      options:
        icon: 'http://mt.google.com/vt/icon/name=icons/spotlight/star_L_8x.png&scale=2'
        labelContent: "You're here"

    $scope.googleMap = {}
    $scope.zoom = 3

    $scope.getLocation = ->
      $window.navigator.geolocation.getCurrentPosition(onPositionAcquired, onPositionError)

    onPositionAcquired = (position) ->
      $scope.$apply ->
        $scope.currentPosition.coords = position.coords
        $scope.googleMap.getGMap().panTo(convertCoords(position.coords))
        $scope.googleMap.getGMap().setZoom(6)

    convertCoords = (coords) ->
      new google.maps.LatLng(coords.latitude, coords.longitude)

    onPositionError = (error) ->
      console.error error
  ]

app.directive 'usersMap', ->
  restrict: 'E'
  scope:
    users: '='
    places: '='
  templateUrl: 'views/_users_map.html'

app.directive 'currentPosition', ->
  restrict: 'E'
  templateUrl: 'views/_current_position.html'
  scope:
    position: '='
