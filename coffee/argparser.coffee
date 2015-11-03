# Parse command line arguments

parseArgs = require('minimist')
parseCommand = require('minimist-subcommand')

HELP = 'help'
EXTRACT = 'extract'
COMPILE = 'compile'

commandDefinition =
    default: HELP
    commands: {}

commandDefinition.commands[HELP] = null
commandDefinition.commands[EXTRACT] = null
commandDefinition.commands[COMPILE] = null

parsedCommand = parseCommand(commandDefinition, process.argv.slice(2));
parsedArgs = parseArgs(parsedCommand.argv);
 
# console.log('sub-command:', parsedCommand.commands);
# console.log('parsed options by minimist:', parsedArgs);

module.exports =
    HELP: HELP
    EXTRACT: EXTRACT
    COMPILE: COMPILE
    subcommand: parsedCommand.commands[0]
    args: parsedArgs
