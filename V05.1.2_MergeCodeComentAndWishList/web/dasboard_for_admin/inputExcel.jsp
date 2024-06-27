<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Import Mentor Accounts</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to the CSS file -->
</head>
<body>
    <div class="container">
        <h2>Import Mentor Accounts</h2>
        <form action="manageAccount" method="post" enctype="multipart/form-data" class="upload-form">
            <label for="file-upload" class="custom-file-upload">
                <input type="file" id="file-upload" name="file" accept=".xlsx">
            </label>
            <input type="submit" value="Submit" class="submit-btn">
        </form>
    </div>
</body>
</html>