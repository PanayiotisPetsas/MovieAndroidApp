<?php

try {
    // include the file for the database connection
    require_once('connection.php');
    // get database connection
    $dbConn = getConnection();
}
catch (Exception $e) {
    throw new Exception("Connection error " . $e->getMessage(), 0, $e);
}


// get all products from products table
$sql="SELECT * FROM movies";

$stmt = $dbConn->query($sql);
$row_count = $stmt->rowCount();
// $row_count.' rows selected';

//check if the table has any rows
if ($row_count > 0) {
    // looping through all results
    // products node
    $response["movies"] = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $movie = array();
        $movie["movieID"] = $row["movieID"];
        $movie["movieName"] = $row["movieName"];
        $movie["movieType"] = $row["movieType"];
        $movie["Release Date"] = $row["Release Date"];
        $movie["Rate"] = $row["Rate"];
        $movie["movieDesc"] = $row["movieDesc"];

        // push single product into final response array
        array_push($response["movies"], $movie);

    }
    // success
    $response["success"] = 1;

    // echoing JSON response
    echo json_encode($response);
} else {
    // no movies found
    $response["success"] = 0;
    $response["message"] = "No movies found";

    // echo no users JSON
    echo json_encode($response);
}
?>