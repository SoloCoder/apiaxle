# always run as test
process.env.NODE_ENV = "test"

_ = require "underscore"

{ ApiaxleProxy } = require "../apiaxle-proxy"
{ AppTest } = require "apiaxle-base"

{ GetCatchall } = require "../app/controller/catchall_controller"

class exports.ApiaxleTest extends AppTest
  @appClass = ApiaxleProxy

  stubCatchall: ( cb ) -> @getStub GetCatchall::, "_httpRequest", cb

  stubCatchallSimple: ( status, body, headers={} ) ->
    @stubCatchall ( options, api, key, cb ) =>
      @fakeIncomingMessage status, body, headers, ( err, res ) =>
        return cb err, res, body
