const fs = require('fs');

// Read the JSON file
const jsonData = fs.readFileSync('../build/contracts/CustomERC20.json');

// Parse the JSON data into a JavaScript object
const jsonObject = JSON.parse(jsonData);

// Convert the JavaScript object back to a JSON string
const jsonString = JSON.stringify(jsonObject);

fs.writeFileSync("abi.txt",jsonString)