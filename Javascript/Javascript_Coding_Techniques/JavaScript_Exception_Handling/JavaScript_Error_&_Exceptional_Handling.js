/**
 * What is JavaScript Error?
 * In JavaScript, an error is a problem that prevents the code from running as expected. Errors can occur during development or while the application is running, 
 * causing the program to stop executing properly. 
 */

// Throwing Custom Errors
function check(age) {
    if (age < 18) {
        throw new Error("Age must be 18 or above");
    }
    console.log("Access granted");
}
try {
    check(16);
} catch (error) { // You can throw custom errors using the throw statement.
    console.error(error.message);
    // Age must be 18 or above
}

// Using Finally for Cleanup
try {
    console.log("Trying...");
    throw new Error("An error occurred");
} catch (error) {
    console.error(error.message);
} finally {
    console.log("Cleaning up...");
} // The final block is executed regardless of whether an error occurred or not.

// Advanced try catch with async/await
async function fetchData() { // uses async to allow asynchronous operations
    try {
        let res = await fetch ("https://api.example.com/data"); // tries to fetch data from the URL "https://api.example.com/data"
        let d = await res.json();
        console.log(d);
    } catch (error) {
        console.error("Error fetching data:", error.message);
    }
}
fetchData(); // OUTPUT: Error fetching data: fetch failed

/**
 * JavaScript Errors Throw and Try to Catch:
    - throw: Creates custom errors and stops code execution.
    - try...catch: Catches and handles errors to prevent crashes.
    - finally: Runs code after try and catch, regardless of errors.
    - Custom Errors: Create custom error types by extending the Error class.
 */

// Creating Custom Error Types
function validateInput(input) {
    if (input < 0) {
        throw new ValidationError("INput must be a positive number.");
    }
    return "Valid input";
}