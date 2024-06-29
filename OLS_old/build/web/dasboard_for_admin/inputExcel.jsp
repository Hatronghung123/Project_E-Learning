<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Import Mentor Accounts</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to the CSS file -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            padding: 20px;
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }
        .upload-form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .custom-file-upload {
            position: relative;
            overflow: hidden;
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-bottom: 20px;
        }
        .custom-file-upload input[type="file"] {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }
        .submit-btn {
            background-color: #008CBA;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .submit-btn:hover {
            background-color: #007B9A;
        }
    </style>
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