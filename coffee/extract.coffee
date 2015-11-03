# Extract strings from source code

fs = require('fs')
glob = require('glob')
Extractor = require('angular-gettext-tools').Extractor


class CliExtractor

    constructor: (argv) ->
        this._initArgs(argv)
        this.extractor = new Extractor(
            markerName: argv['marker-name']
        )
        
    _initArgs: (argv) ->
        if not argv.output
            throw new Error('dest parameter missing')
        this.output = argv.output
        this.files = argv._
    
    run: () ->
        console.log('Started parsing...')
        for fileGlob in this.files
            for fileName in glob.sync(fileGlob)
                console.log('- ', fileName)
                content = fs.readFileSync(fileName, 'utf8')
                this.extractor.parse(fileName, content)
        console.log('Finished parsing')
        fs.writeFileSync(
            this.output,
            this.extractor.toString(),
            null,
            (error) ->
                if (err)
                    throw err
        )
        console.log('Saved to file', this.output);


module.exports = CliExtractor
