_ = require "underscore"

mypackage = require "../../../package.json"
basepackage = require( "apiaxle-base" ).package

{ ApiaxleController, ListController } = require "../controller"
{ AlreadyExists } = require "../../../lib/error"

class exports.ViewInfo extends ApiaxleController
  @verb = "get"

  desc: -> "Information about this project."

  docs: ->
    """
    ### Returns

    * Package file output.
    """

  path: -> "/v1/info"

  execute: ( req, res, next ) ->
    return @json res,
      base: basepackage
      api: mypackage
