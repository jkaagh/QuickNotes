
//CONFIG
const AddNoteLast = false
const prefix = " - "
const suffix = "\n\n\n"






const fs = require('fs');

// Access the command-line arguments
const args = process.argv.slice(2);
const parameter = args[0];
//   const parameter = "asdf";


// Check if an argument was provided
if (args.length > 0) {
  

  console.log('Parameter:', parameter);
} else {
    console.log('No parameter provided.');
    return
}



// Read the JSON file
const fileContent = fs.readFileSync('../Notes', 'utf8');

// Parse the JSON content
let json = JSON.parse(fileContent);
console.log(json)

// console.log(json.children[0])

const newContent = "" + prefix + parameter + suffix + json.children[0].content + ""

json.children[0].content = newContent

const newFileContent = JSON.stringify(json, null, 2)

fs.writeFileSync('../Notes', newFileContent, 'utf8');
