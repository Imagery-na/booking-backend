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
            if (empty($params['id'])) {
                $query =  mysqli_query($connection, "SELECT * FROM halls ORDER BY number");
                while($hall = mysqli_fetch_assoc($query)){
                    $hallSportsquery =  mysqli_query($connection, "SELECT sports.id, sports.name FROM sports, typesofsport WHERE (sports.id = typesofsport.sportId AND typesofsport.hallNumber = ".$hall['number'].")");
                    while($hallSport = mysqli_fetch_assoc($hallSportsquery)){
                        $hall['sports'][] = $hallSport;
                    }
                    $data[] = $hall;
                }  
            } else {
                $hallId=$params['id'];
                $query =  mysqli_query($connection, "SELECT * FROM halls WHERE number='$hallId' ");
                while($hall = mysqli_fetch_assoc($query)){
                    $hallSportsquery =  mysqli_query($connection, "SELECT sports.id, sports.name FROM sports, typesofsport WHERE (sports.id = typesofsport.sportId AND typesofsport.hallNumber = '$hallId')");
                    while($hallSport = mysqli_fetch_assoc($hallSportsquery)){
                        $hall['sports'][] = $hallSport;
                    }
                    $data[] = $hall;
                }  
            }
            return $data;
        }

        case 'bookings': {

            if (empty($params['id'])) {
                $query =  mysqli_query($connection, "SELECT * FROM `$route` ORDER BY id DESC");
                while($booking = mysqli_fetch_assoc($query)){
                    $data[] = $booking;
                }   
            } else { //получение бронирований определённого зала
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

        case 'clientBookingsAllInfo': {
            $clientId=$params['id'];
            $query =  mysqli_query($connection, "SELECT bookings.id, date, timeFrom, timeTo, hallNumber, cost, dateString,
            halls.name AS hallName,
            sports.name AS sportName, sports.id AS sportId,
            clients.phone AS clientPhone, clients.name AS clientName
            FROM bookings, halls, sports, clients
            WHERE bookings.hallNumber = halls.number AND bookings.sportId = sports.id AND bookings.clientId = clients.id AND clients.id = $clientId
            LIMIT 500");
                while($booking = mysqli_fetch_assoc($query)){
                    $data[] = $booking;
                }
            return $data;
        }

        case 'bookingsAllInfo': {
            $query =  mysqli_query($connection, "SELECT bookings.id, date, timeFrom, timeTo, hallNumber, cost, dateString,
            halls.name AS hallName,
            sports.name AS sportName, sports.id AS sportId,
            clients.phone AS clientPhone, clients.name AS clientName
            FROM bookings, halls, sports, clients
            WHERE bookings.hallNumber = halls.number AND bookings.sportId = sports.id AND bookings.clientId = clients.id
            LIMIT 500");
                while($booking = mysqli_fetch_assoc($query)){
                    $data[] = $booking;
                }
            return $data;
        }

        case 'sports': {

            if (empty($params['id'])) {
                $query =  mysqli_query($connection, "SELECT * FROM sports ORDER BY id ");
                while($booking = mysqli_fetch_assoc($query)){
                    $data[] = $booking;
                }   
            } else {
                $id=$params['id'];
                $query =  mysqli_query($connection, "SELECT * FROM sports WHERE id=$id ");
                    while($booking = mysqli_fetch_assoc($query)){
                        $data[] = $booking;
                    }
            }
            return $data;
        }

        case 'reportHalls': {
            $query =  mysqli_query($connection, "SELECT hallNumber AS firstCol, COUNT(*) AS secondCol 
            FROM `bookings` 
            GROUP BY hallNumber
            ORDER BY secondCol DESC");
            while($booking = mysqli_fetch_assoc($query)){
                $data[] = $booking;
            }   
            return $data;
        }

        case 'reportSum': {
            $query =  mysqli_query($connection, "SELECT hallNumber AS firstCol, SUM(cost) AS secondCol 
            FROM `bookings` 
            GROUP BY hallNumber");
            while($booking = mysqli_fetch_assoc($query)){
                $data[] = $booking;
            }   
            return $data;
        }

        case 'reportClients': {
            $query =  mysqli_query($connection, "SELECT clients.name AS firstCol, SUM(bookings.cost) AS secondCol
            FROM bookings, clients 
            WHERE bookings.clientId = clients.id 
            GROUP BY bookings.clientId 
            ORDER BY secondCol DESC");
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

        case 'sport/create': {
            if (empty($params['name'])) {
                http_response_code(400);
                exit('Request error');    
            }
            
            $newData = [
                'name' => $params['name'],
            ];

            $name=$newData['name'];
            $addData=mysqli_query($connection, "INSERT INTO sports VALUES (DEFAULT, '$name')");
            $sportId=mysqli_insert_id($connection);
            $newData['id'] = $sportId;
            $data[] = $newData;
            return $newData;
        }

        case 'sport/update': {
            if (empty($params['name']) || empty($params['id'])) {
                http_response_code(400);
                exit('Request error');    
            }
            
            $newData = [
                'name' => $params['name'],
                'id' => $params['id'],
            ];

            $name=$newData['name'];
            $id=$newData['id'];
            $addData=mysqli_query($connection, "UPDATE sports SET name='$name' WHERE id=$id");
            $data[] = $newData;
            return $newData;
        }

        case 'hall/create': {
            if (empty($params['name']) || empty($params['costOfHour'])
            || empty($params['address']) || empty($params['sports'])) {
                http_response_code(400);
                exit('Request error');    
            }
            
            $newData = [
                'name' => $params['name'],
                'costOfHour' => $params['costOfHour'],
                'timeOpen' => $params['timeOpen'],
                'timeClose' => $params['timeClose'],
                'length' => $params['length'],
                'width' => $params['width'],
                'description' => $params['description'],
                'address' => $params['address'],
                'phone' => $params['phone'],
                'regime' => $params['regime'],
                'sports' => $params['sports'],
                'photo' => $params['photo'],
            ];

            $name=$newData['name'];
            $costOfHour=$newData['costOfHour'];
            $timeOpen=$newData['timeOpen'];
            $timeClose=$newData['timeClose'];
            $length=$newData['length'];
            $width=$newData['width'];
            $description=$newData['description'];
            $address=$newData['address'];
            $phone=$newData['phone'];
            $regime=$newData['regime'];
            $sports=$newData['sports'];
            $photo=$newData['photo'];

            $addData=mysqli_query($connection, "INSERT INTO halls VALUES (DEFAULT, '$name', '$costOfHour', '$timeOpen', '$timeClose',
            '$length', '$width', '$description', '$address', '$phone', '$regime', '$photo')");
            $hallNum=mysqli_insert_id($connection);
            $sportsIds = explode(",", $sports);
            foreach ($sportsIds as $sportId) {
                $addData=mysqli_query($connection, "INSERT INTO typesofsport VALUES (DEFAULT, '$hallNum', '$sportId')");
            }
            $newData['number'] = $hallNum;
            $newData['sportsIds'] = $sportsIds;
            $data[] = $newData;
            return $newData;
        }

        case 'hall/update': {
            if (empty($params['name']) || empty($params['number']) || empty($params['sports'])) {
                http_response_code(400);
                exit('Request error');    
            }
            
            $newData = [
                'number' => $params['number'],
                'name' => $params['name'],
                'costOfHour' => $params['costOfHour'],
                'timeOpen' => $params['timeOpen'],
                'timeClose' => $params['timeClose'],
                'length' => $params['length'],
                'width' => $params['width'],
                'description' => $params['description'],
                'address' => $params['address'],
                'phone' => $params['phone'],
                'regime' => $params['regime'],
                'sports' => $params['sports'],
                'photo' => $params['photo'],
            ];

            $number=$newData['number'];
            $name=$newData['name'];
            $costOfHour=$newData['costOfHour'];
            $timeOpen=$newData['timeOpen'];
            $timeClose=$newData['timeClose'];
            $length=$newData['length'];
            $width=$newData['width'];
            $description=$newData['description'];
            $address=$newData['address'];
            $phone=$newData['phone'];
            $regime=$newData['regime'];
            $sports=$newData['sports'];
            $photo=$newData['photo'];

            $addData=mysqli_query($connection, "UPDATE halls SET name='$name', costOfHour='$costOfHour', timeOpen='$timeOpen',
            timeClose='$timeClose', length='$length', width='$width', description='$description', address='$address', phone='$phone',
            regime='$regime', iconPath='$photo' WHERE number='$number' ");
            $sportsIds = explode(",", $sports);
            $DeleteQuery=mysqli_query($connection, "DELETE FROM typesofsport WHERE hallNumber=$number ");
            foreach ($sportsIds as $sportId) {
                $addData=mysqli_query($connection, "INSERT INTO typesofsport VALUES (DEFAULT, '$number', '$sportId')");
            }
            $newData['sportsIds'] = $sportsIds;

            $data[] = $newData;
            return $data;
        }

        case 'booking/create': {
            if (empty($params['hallNumber']) || empty($params['date'])) {
                http_response_code(400);
                exit('Request error');    
            }
            
            $newData = [
                'date' => $params['date'],
                'timeFrom' => $params['timeFrom'],
                'timeTo' => $params['timeTo'],
                //status
                'hallNumber' => $params['hallNumber'],
                //clientId
                'sportId' => $params['sportId'],
                'cost' => $params['cost'],
                // +2 поля
            ];

            $date=$newData['date'];
            $timeFrom=$newData['timeFrom'];
            $timeTo=$newData['timeTo'];
            $hallNumber=$newData['hallNumber'];
            $sportId=$newData['sportId'];
            $cost=$newData['cost'];

            $addData=mysqli_query($connection, "INSERT INTO bookings VALUES (DEFAULT, '$date', '$timeFrom', '$timeTo', DEFAULT, '$hallNumber',
            20, '$sportId', '$cost', DEFAULT, DEFAULT)");
            $bookingId=mysqli_insert_id($connection);
            $newData['id'] = $bookingId;
            $data[] = $newData;
            return $newData;
        }
        // авторизация в админке
        case 'auth': {
            if (empty($params['login']) || empty($params['password'])) {
                http_response_code(400);
                exit('Request error');    
            }
            
            $newData = [
                'login' => $params['login'],
                'password' => $params['password'],
            ];

            $login=$newData['login'];
            $password=$newData['password'];
            $result = false;

            $query =  mysqli_query($connection, "SELECT * FROM users WHERE login='$login' ");
            $newData['query'] = $query;
            while($user = mysqli_fetch_assoc($query)){
                if ($user['password'] == $password) {
                    $result = true;
                }
                // $data[] = $user;
            }
            
            $newData['result'] = $result;
            $data['result'] = $result;
            return $data;
        }
        
        // вход в личный кабинет клиента
        case 'login': {
            if (empty($params['phone'])) {
                http_response_code(400);
                exit('Request error');    
            }
            
            $newData = [
                'phone' => $params['phone'],
            ];

            

            $phone=$newData['phone'];

            $query =  mysqli_query($connection, "SELECT * FROM clients WHERE phone='$phone' ");
            while($client = mysqli_fetch_assoc($query)){
                $clientId = $client['id'];
            }
            $data['id'] = $clientId;
            return $data;
        }
    }
}

function deleteData($route, $params = []) {
    global $connection;
    if (empty($params['id'])) {
        http_response_code(400);
        exit('Request error');    
    }
    $deletableId = $params['id'];
    $DeleteQuery=mysqli_query($connection, "DELETE FROM `$route` WHERE id=$deletableId ");
    if ($route = 'halls') {
        $DeleteQuery=mysqli_query($connection, "DELETE FROM `$route` WHERE number=$deletableId ");
    }
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