'use strict'

describe 'Controller: MainCtrl', ->

  # load the controller's module
  beforeEach module 'peoplemapApp'

  MainCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl', {
      $scope: scope
    }

  xit 'has no people on start', ->
    expect(scope.people.length).toBe 0

  it 'add user to the list', ->
    scope.people = []
    scope.user =
      name: 'adam'
      location: 'location'
    scope.addUser()
    expect(scope.people.length).toBe 1
    expect(scope.people[0].name).toEqual 'adam'

  it 'adds and removes user from the list', ->
    scope.people = []
    scope.user =
      name: 'adam'
      location: 'location'
    scope.addUser()
    scope.removeUser 0
    expect(scope.people.length).toBe 0
