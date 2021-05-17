<?php
    $connection = mysqli_connect("localhost", "mysql", "mysql", "booking_bd");
    if($connection==false){
        echo "Error!";
        echo mysqli_connect_errno();
        exit();
    }

function getData($route, $params = []) {
    global $connection;
    switch ($route) {
        case 'halls': {
            $query =  mysqli_query($connection, "SELECT * FROM halls ORDER BY number");
            while($hall = mysqli_fetch_assoc($query)){
                $hallSportsquery =  mysqli_query($connection, "SELECT sports.id, sports.name FROM sports, typesofsport WHERE (sports.id = typesofsport.sportId AND typesofsport.hallNumber = ".$hall['number'].")");
                while($hallSport = mysqli_fetch_assoc($hallSportsquery)){
                    $hall['sports'][] = $hallSport;
                }
                $data[] = $hall;
            }
            
            return $data;
        }

        case 'bookings': {

            if (empty($params['id'])) {
                $query =  mysqli_query($connection, "SELECT * FROM `$route` ORDER BY id DESC");
                while($booking = mysqli_fetch_assoc($query)){
                    $data[] = $booking;
                }   
            } else {
                $hallId=$params['id'];
                $query =  mysqli_query($connection, "SELECT * FROM bookings WHERE hallNumber=$hallId ");
                    while($booking = mysqli_fetch_assoc($query)){
                        $data[] = $booking;
                    }
            }
            return $data;
        }

        case 'bookingInfo': {
            $bookingId=$params['id'];
            $query =  mysqli_query($connection, "SELECT bookings.id, date, timeFrom, timeTo, hallNumber, cost, dateString, 
            halls.name AS hallName FROM bookings, halls WHERE bookings.id=$bookingId AND bookings.hallNumber = halls.number");
                // while($booking = mysqli_fetch_assoc($query)){
                //     $data[] = $booking;
                // }
            while($booking = mysqli_fetch_assoc($query)){
                $hallSportsQuery =  mysqli_query($connection, "SELECT sports.id, sports.name FROM sports, typesofsport
                WHERE (sports.id = typesofsport.sportId AND typesofsport.hallNumber = ".$booking['hallNumber'].")");
                while($hallSport = mysqli_fetch_assoc($hallSportsQuery)){
                    $booking['sports'][] = $hallSport;
                }
                $data[] = $booking;
            }
            return $data;
        }

        case 'bookingAllInfo': {
            // добавить данные о клиенте
            $bookingId=$params['id'];
            $query =  mysqli_query($connection, "SELECT bookings.id, date, timeFrom, timeTo, hallNumber, cost, dateString,
            halls.name AS hallName,
            sports.name AS sportName, sports.id AS sportId,
            clients.phone AS clientPhone, clients.name AS clientName
            FROM bookings, halls, sports, clients
            WHERE bookings.id=$bookingId AND bookings.hallNumber = halls.number AND bookings.sportId = sports.id AND bookings.clientId = clients.id");
                while($booking = mysqli_fetch_assoc($query)){
                    $data[] = $booking;
                }
            return $data;
        }
    }
}

function postData($route, $params = []) {
    global $connection;
    $newData = null;
    
    switch ($route) {
        case 'bookings': {
            if (empty($params['date']) || empty($params['timeFrom']) || empty($params['timeTo'])) {
                http_response_code(400);
                exit('Request error');    
            }

            $newData = [
                'date' => $params['date'],
                'timeFrom' => $params['timeFrom'],
                'timeTo' => $params['timeTo'],
                'hallNumber' => $params['hallNumber'],
                'cost' => $params['cost'],
                'dateString' => $params['dateString'],
            ];

            $date=$newData['date'];
            $timeFrom=$newData['timeFrom'];
            $timeTo=$newData['timeTo'];
            $hallNumber=$newData['hallNumber'];
            $cost=$newData['cost'];
            $dateString=$newData['dateString'];
            $addData=mysqli_query($connection, "INSERT INTO `$route` VALUES (DEFAULT, '$date', '$timeFrom', '$timeTo', DEFAULT, '$hallNumber', DEFAULT, DEFAULT, '$cost', DEFAULT, '$dateString')");
            $newData['id'] = mysqli_insert_id($connection);
            $data = $newData;
            return $newData;
        }

        case 'clientInfo': {
            if (empty($params['phone']) || empty($params['client']) || empty($params['sportId']) || empty($params['bookingId'])) {
                http_response_code(400);
                exit('Request error');    
            }
            
            $newData = [
                'phone' => $params['phone'],
                'client' => $params['client'],
                'sportId' => $params['sportId'],
                'bookingId' => $params['bookingId'],
            ];

            $phone=$newData['phone'];
            $clientName=$newData['client'];
            $sportId=$newData['sportId'];
            $bookingId=$newData['bookingId'];
            $addData=mysqli_query($connection, "INSERT INTO clients VALUES (DEFAULT, '$phone', '$clientName')");
            $clientId=mysqli_insert_id($connection);
            $newData['id'] = $clientId;
            $addData=mysqli_query($connection, "UPDATE bookings SET sportId=$sportId, clientId=$clientId WHERE id=$bookingId");
            $data[] = $newData;
            return $newData;
        }
    }
}

function deleteData($route, $params = []) {
    global $connection;
    // $filePath = makeRoutePath($route);
    
    // if (!file_exists($filePath)) {
    //     http_response_code(404);
    //     exit('Not found');    

    // } else 
    if (empty($params['id'])) {
        http_response_code(400);
        exit('Request error');    
    }

    // $dataJSON = file_get_contents($filePath);
    // $data;
    $deletableId = $params['id'];
    $deletableTitle = $params['title'];

    // $dataToDelete = array_find($data, function ($element) use ($deletableId) {
    //     return (int) $element['id'] === (int) $deletableId;
    // });
    $DeleteQuery=mysqli_query($connection, "DELETE FROM `$route` WHERE id=$deletableId ");
    $DeletedData=mysqli_query($connection, "SELECT * FROM `$route` ORDER BY id DESC");
    if (empty($DeletedData)) {
        http_response_code(404);
        exit('Not found');    
    }

    // $resultData = array_filter($data, function ($element) use ($deletableId) {
    //     return (int) $element['id'] !== (int) $deletableId;
    // });

    // $dataToWriteJSON = json_encode($resultData, JSON_UNESCAPED_UNICODE);
    // $writeReslt = file_put_contents($filePath, $dataToWriteJSON);

    // if (!$writeReslt) {
    //     http_response_code(500);
    //     echo 'Internal server error';
    //     exit;
    // }

    return $DeletedData;
}

function makeRoutePath($route) {
    $filenameJson = $route . '.json';
    $dataDirPath = __DIR__ . '/data/';
    return $dataDirPath . $filenameJson;
}

function array_find($haystack, $callback) {
    foreach ($haystack as $element)
        if ($callback($element))
            return $element;
}