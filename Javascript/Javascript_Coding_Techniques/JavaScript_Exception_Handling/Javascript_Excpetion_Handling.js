function divide (num, den) {
    try {
        if (den === 0) {
            throw new Error("Denominator cannot be zero");
    }
    console.log("Result of division:", num / den);
    } catch (error) {
        console.error("Error:", error.message);
    } finally {
        console.log("Division operation completed.");
    }
}

try {
    let numerator = 10;
    let denominator = 0;

    if (!isNaN (numerator) && !isNaN(denominator)) {
        divide(numerator, denominator);
    } else {
        throw new Error("Invalid input, please enter integers.");
    }
} catch (error) {
    console.log("Error:", error.message);
}