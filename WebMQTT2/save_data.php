<?php
$host = "localhost"; // Puedes cambiarlo si tu servidor MySQL no está en localhost
$username = "root";
$password = "";
$database = "mqtt";

$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Verificar si el parámetro 'temperature' está presente en $_POST
if(isset($_POST['temperature'])){
    $temperature = $_POST['temperature'];

    $sql = "INSERT INTO temperature_data (temperatura) VALUES ('$temperature')";

    if ($conn->query($sql) === TRUE) {
        echo "Datos guardados con éxito";
    } else {
        echo "Error al guardar los datos: " . $conn->error;
    }
} else {
    // echo "Parámetro 'temperature' no presente en la solicitud";
}

$conn->close();
?>