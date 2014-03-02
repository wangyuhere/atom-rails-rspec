Path = require 'path'
{WorkspaceView} = require 'atom'
RailsRspec = require '../lib/rails-rspec'

describe 'RailsRspec', ->
  activationPromise = null
  currentPath = ->
    atom.workspace.getActiveEditor().getPath()

  toggleFile = (file) ->
    atom.workspaceView.openSync file
    atom.workspaceView.getActiveView().trigger 'rails-rspec:toggle-spec-file'

    waitsForPromise ->
      activationPromise

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    atom.workspace = atom.workspaceView.model
    activationPromise = atom.packages.activatePackage('rails-rspec')

  describe 'when the rails-rspec:toggle-spec-file event is triggered', ->
    it 'swtiches to spec file', ->
      toggleFile 'app/models/user.rb'

      runs ->
        expect(currentPath()).toBe Path.join(__dirname, 'spec/models/user_spec.rb')

    it 'does nothing for not rspec related file', ->
      file = 'app/config.json'
      toggleFile file

      runs ->
        expect(currentPath()).toBe Path.join(__dirname, file)
