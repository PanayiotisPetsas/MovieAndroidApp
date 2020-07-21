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

if (isset($_GET["movieID"])) {
    $movieID = $_GET['movieID'];
}

$sql = "SELECT * FROM movies WHERE movieID = $movieID";

$stmt = $dbConn->query($sql);
$row_count = $stmt->rowCount();

if ($row_count > 0) {

    $row = $stmt->fetch();

    $response["movie"] = array();

    $movie = array();
    $movie["movieID"] = $row["movieID"];
    $movie["movieName"] = $row["movieName"];
    $movie["movieType"] = $row["movieType"];
    $movie["Release Date"] = $row["Release Date"];
    $movie["Rate"] = $row["Rate"];
    $movie["movieDesc"] = $row["movieDesc"];

    array_push($response["movie"], $movie);

// success
    $response["success"] = 1;

// echoing JSON response
    echo json_encode($response);
} else {
    // no movies found
    $response["success"] = 0;
    $response["message"] = "No movies found with that ID";

    // echo no users JSON
    echo json_encode($response);
}
?>