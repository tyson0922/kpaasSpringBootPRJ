document.addEventListener('DOMContentLoaded', function () {
    console.log('DOM fully loaded and parsed.');

    // Log full DOM to inspect if resultButton exists
    console.log('Full DOM at page load:', document.body.innerHTML);

    // Check if the resultButton is present when DOM is loaded
    const resultButtonCheck = document.getElementById('resultButton');
    if (resultButtonCheck) {
        console.log('Result button is present when DOM is loaded.');
    } else {
        console.error('Result button is NOT present when DOM is loaded.');
    }



// File upload handler
    function handleFileUpload(input) {
        if (input.files && input.files[0]) {
            const file = input.files[0];
            console.log('File selected: ', file.name);

            if (file.type.startsWith('image/')) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    console.log('Image loaded successfully.');
                    const imgElement = document.getElementById('imageToReplace');
                    imgElement.src = e.target.result;

                    const analyzeButton = document.getElementById('analyzeButton');
                    analyzeButton.style.display = 'block';

                    const progressBar = document.getElementById('progressBar');
                    progressBar.style.display = 'none';

                    const resultButton = document.getElementById('resultButton');
                    resultButton.style.display = 'none';
                };
                reader.readAsDataURL(file);
            } else {
                alert("Please upload a valid image file.");
            }
        }
    }

    // Start the analysis
    function startAnalysis() {
        console.log('Analysis started...');
        const analyzeButton = document.getElementById('analyzeButton');
        analyzeButton.style.display = 'none';

        const progressBar = document.getElementById('progressBar');
        progressBar.style.display = 'block';

        const file = document.getElementById('fileInput').files[0];
        if (!file) {
            alert("파일 선택하세요.");
            return;
        }

        console.log('File selected for analysis: ', file.name);

        getBase64fromFile(file).then(function(base64image) {
            console.log('Base64 image ready for API request...');

            setTimeout(function() {
                console.log('Simulated API request success.');

                const highestPrediction = "Laceration"; // Simulated response

                displayResult(`Laceration detected! <a href="laceration.jsp">Details</a>`);
            }, 2000);
        });
    }

    function displayResult(resultText) {
        const resultButton = document.getElementById('resultButton');
        if (resultButton) {
            console.log('Result button found.');
            resultButton.innerHTML = resultText;
            resultButton.style.display = 'block';
        } else {
            console.error('Result button not found in the DOM.');
            console.log('Current DOM:', document.body.innerHTML);  // This will show the full DOM content
        }
    }

    // Convert image to Base64
    function getBase64fromFile(file) {
        return new Promise(function(resolve, reject) {
            const reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = function() {
                resolve(reader.result);
            };
            reader.onerror = function(error) {
                reject(error);
            };
        });
    }

    // Attach event listeners
    document.getElementById('fileInput').addEventListener('change', function() {
        handleFileUpload(this);
    });

    document.getElementById('analyzeButton').addEventListener('click', function() {
        startAnalysis();
    });
});
