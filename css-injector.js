templateFile  = "src/GitHub_source.html5" // Template with CSS-injection placeholder
cssFile       = "src/GitHub.min.css"      // CSS source to inject into placeholder
outFile       = "GitHub.html5"     // Final template output file
placeHolder   = "{{CSS-INJECT}}"      // Placeholder string for CSS-injection

var fs = require('fs')
// ------------------------------------------------------------------------------
//                               Load CSS Into Var                               
// ------------------------------------------------------------------------------
try {  
    var CSS = fs.readFileSync(cssFile, 'utf8');
} catch(e) {
    console.log('Error:', e.stack);
    process.exit(1);
}
// ------------------------------------------------------------------------------
//                             Load Template Into Var                            
// ------------------------------------------------------------------------------
try {  
    var Template = fs.readFileSync(templateFile, 'utf8');
} catch(e) {
    console.log('Error:', e.stack);
    process.exit(1);
}
// ------------------------------------------------------------------------------
//                            Inject CSS Into Template                           
// ------------------------------------------------------------------------------
Template = Template.replace(placeHolder, CSS);
// var result = Template.replace(placeHolder, CSS);

try {  
    fs.writeFileSync(outFile, Template, 'utf8');
} catch(e) {
    console.log('Error:', e.stack);
    process.exit(1);
}



