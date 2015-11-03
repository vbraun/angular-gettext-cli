# Compile a translated po-file to javascript

fs = require('fs')
glob = require('glob')
Compiler = require('angular-gettext-tools').Compiler


class CliCompiler

    constructor: (argv) ->
        this._initArgs(argv)
        this.compiler = new Compiler(
            format: 'javascript'
            module: 'gettext'
        )
        
    _initArgs: (argv) ->
        if not argv.output
            throw new Error('output parameter missing')
        this.output = argv.output
        this.files = argv._
    
    run: () ->
        console.log('Started compiling...')
        allContent = []
        for fileGlob in this.files
            for fileName in glob.sync(fileGlob)
                console.log('- ', fileName)
                content = fs.readFileSync(fileName, 'utf8')
                allContent.push(content)
        console.log('Finished reading sources')
        fs.writeFileSync(
            this.output,
            this.compiler.convertPo(allContent).toString(),
            null,
            (error) ->
                if (err)
                    throw err
        )
        console.log('Saved to file', this.output);


module.exports = CliCompiler
