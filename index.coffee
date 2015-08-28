request = require 'superagent'

module.exports = (Module) ->
	rektArray = ""
	req = request.get "https://raw.githubusercontent.com/seiyria/status-list/master/rekt-list.md"
	req.end (err, res) ->
		rektArray = res.text
						.toString()
						.split "\n"
		rektArray.shift()
		rektArray.pop()

	rektLines= ["You just got ",
				"fukn "
				""]
	class RektModule extends Module
		shortName: 'Rekt'
		helpText:
			default: 'A module for Kurea to tell someone they\'re rekt.'
		usage:
			default: 'rekt [arg]'

		constructor: (moduleManager) ->
			super
			@addRoute 'rekt', (origin, route) =>
				@reply origin, "#{rektLines[Math.floor Math.random()*rektLines.length]}#{rektArray[Math.floor Math.random()*rektArray.length]}"

	RektModule
