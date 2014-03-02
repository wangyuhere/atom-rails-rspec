Rails = require '../lib/rails'

describe 'Rails', ->
  rails = new Rails('/f/rails')

  describe 'toggleSpecFile', ->
    it 'returns spec file for tested file', ->
      expect(rails.toggleSpecFile('/f/rails/lib/a.rb')).toBe '/f/rails/spec/lib/a_spec.rb'
      expect(rails.toggleSpecFile('/f/rails/app/models/a.rb')).toBe '/f/rails/spec/models/a_spec.rb'

    it 'returns tested file for spec file', ->
      expect(rails.toggleSpecFile('/f/rails/lib/a.rb')).toBe '/f/rails/spec/lib/a_spec.rb'
      expect(rails.toggleSpecFile('/f/rails/spec/models/a_spec.rb')).toBe '/f/rails/app/models/a.rb'

    it 'returns null for not ruby file', ->
      expect(rails.toggleSpecFile('/f/rails/app/test.json')).toBeNull()

    it 'returns null for ruby file not in app or lib or spec folder', ->
      expect(rails.toggleSpecFile('/f/rails/config/application.rb')).toBeNull()
