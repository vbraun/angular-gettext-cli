# Act on command line arguments

option = require('./argparser.js')
usage = require('./help.js')
Extractor = require('./extract.js')
Compiler = require('./compile.js')
    

app = {}

app[option.HELP] = () ->
    usage()

app[option.EXTRACT] = () ->
    console.log('Running extract phase', this._args)
    extractor = new Extractor(this._args)
    extractor.run()
    
app[option.COMPILE] = () ->
    console.log('Running compile phase', this._args)
    compiler = new Compiler(this._args)
    compiler.run()
    
app['_args'] = option.args
app['_handler'] = app[option.subcommand]
app['run'] = () -> this._handler()

            
module.exports = app
