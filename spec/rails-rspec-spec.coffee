Path = require 'path'
{WorkspaceView} = require 'atom'
RailsRspec = require '../lib/rails-rspec'

describe 'RailsRspec', ->
  activationPromise = null
  currentPath = ->
    atom.workspace.getActiveEditor().getPath()

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    atom.workspace = atom.workspaceView.model
    activationPromise = atom.packages.activatePackage('rails-rspec')

  describe 'when the rails-rspec:toggle-spec-file event is triggered', ->
    it "swtiches to spec file", ->
      atom.workspaceView.openSync 'app/models/user.rb'
      atom.workspaceView.getActiveView().trigger 'rails-rspec:toggle-spec-file'

      waitsForPromise ->
        activationPromise

      waitsFor ->
        atom.workspaceView.getEditorViews().length > 1

      runs ->
        expect(currentPath()).toBe Path.join(__dirname, 'spec/models/user_spec.rb')
