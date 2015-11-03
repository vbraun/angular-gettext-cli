

description = [
    'usage: angular-gettext {extract,compile} --output filename [file1 file2 ...]',
    '',
    'Available subcommands:',
    '    extract     Extract strings from sources and write them to a .pot file',
    '    compile     Compile .po files to javascript',
    '',
    'The input files can also be globs like www/**/*.html',
]


usage = () ->
    console.log(description.join('\n'))


module.exports = usage    
