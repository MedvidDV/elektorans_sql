<?php
declare(strict_types=1);

class Fixtures
{
    /**
     * @var PDO $connection
     */
    private static $connection;

    /**
     * @return PDO
     */
    public function getConnection(): PDO
    {
        if (null === self::$connection) {
            self::$connection = new PDO('mysql:dbname=CherkasyElektroTrans;host=127.0.0.1:3357', 'elektro', 'elektro', []);
            self::$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }

        return self::$connection;
    }

    /**
     * @return void
     */
    public function generate(): void
    {
        $connection = $this->getConnection();

        try {
            $connection->beginTransaction();
            $this->cleanup();
            $connection->commit();

            $connection->beginTransaction();
            $this->generateEmloyees(100);
            $this->generateTransport(100);
            $this->generateSalary(10000);
            $this->generateIncome(200000);
            $connection->commit();
        } catch (Exception $e) {
            $connection->rollBack();
            echo $e->getMessage();
        }
    }

    private function cleanup(): void
    {
        $connection = $this->getConnection();

        $connection->exec(
            'TRUNCATE TABLE salary');
        $connection->exec(
            'ALTER TABLE salary AUTO_INCREMENT = 1');
        $connection->exec(
            'TRUNCATE TABLE income');
        $connection->exec(
            'ALTER TABLE income AUTO_INCREMENT = 1');
        $connection->exec(
            'DELETE FROM employee WHERE employee_id > 14');
        $connection->exec(
            'ALTER TABLE employee AUTO_INCREMENT = 15');
        $connection->exec(
            'DELETE FROM transport WHERE transport_id > 15');
        $connection->exec(
            'ALTER TABLE transport AUTO_INCREMENT = 16');
    }

    /**
     * @return string
     */
    private function getRandomNames(): string
    {
        static $randomName = ['Adam', 'Alex', 'Aaron', 'Ben', 'Carl', 'Dan', 'David', 'Edward', 'Fred', 'Frank', 'George', 'Hal', 'Hank', 'Ike', 'John', 'Jack', 'Joe', 'Larry', 'Monte', 'Matthew', 'Mark', 'Nathan', 'Otto', 'Paul', 'Peter', 'Roger', 'Roger', 'Steve', 'Thomas', 'Tim', 'Ty', 'Victor', 'Walter'];
        return $randomName[array_rand($randomName)];
    }

    /**
     * @return string
     */
    private function getRandomLastNames(): string
    {
        static $randomLastName = ['Anderson', 'Ashwoon', 'Aikin', 'Bateman', 'Bongard', 'Bowers', 'Boyd', 'Cannon', 'Cast', 'Deitz', 'Dewalt', 'Ebner', 'Frick', 'Hancock', 'Haworth', 'Hesch', 'Hoffman', 'Kassing', 'Knutson', 'Lawless', 'Lawicki', 'Mccord', 'McCormack', 'Miller', 'Myers', 'Nugent', 'Ortiz', 'Orwig', 'Ory', 'Paiser', 'Pak', 'Pettigrew', 'Quinn', 'Quizoz', 'Ramachandran', 'Resnick', 'Sagar', 'Schickowski', 'Schiebel', 'Sellon', 'Severson', 'Shaffer', 'Solberg', 'Soloman', 'Sonderling', 'Soukup', 'Soulis', 'Stahl', 'Sweeney', 'Tandy', 'Trebil', 'Trusela', 'Trussel', 'Turco', 'Uddin', 'Uflan', 'Ulrich', 'Upson', 'Vader', 'Vail', 'Valente', 'Van Zandt', 'Vanderpoel', 'Ventotla', 'Vogal', 'Wagle', 'Wagner', 'Wakefield', 'Weinstein', 'Weiss', 'Woo', 'Yang', 'Yates', 'Yocum', 'Zeaser', 'Zeller', 'Ziegler', 'Bauer', 'Baxster', 'Casal', 'Cataldi', 'Caswell', 'Celedon', 'Chambers', 'Chapman', 'Christensen', 'Darnell', 'Davidson', 'Davis', 'DeLorenzo', 'Dinkins', 'Doran', 'Dugelman', 'Dugan', 'Duffman', 'Eastman', 'Ferro', 'Ferry', 'Fletcher', 'Fietzer', 'Hylan', 'Hydinger', 'Illingsworth', 'Ingram', 'Irwin', 'Jagtap', 'Jenson', 'Johnson', 'Johnsen', 'Jones', 'Jurgenson', 'Kalleg', 'Kaskel', 'Keller', 'Leisinger', 'LePage', 'Lewis', 'Linde', 'Lulloff', 'Maki', 'Martin', 'McGinnis', 'Mills', 'Moody', 'Moore', 'Napier', 'Nelson', 'Norquist', 'Nuttle', 'Olson', 'Ostrander', 'Reamer', 'Reardon', 'Reyes', 'Rice', 'Ripka', 'Roberts', 'Rogers', 'Root', 'Sandstrom', 'Sawyer', 'Schlicht', 'Schmitt', 'Schwager', 'Schutz', 'Schuster', 'Tapia', 'Thompson', 'Tiernan', 'Tisler'];
        return $randomLastName[array_rand($randomLastName)];
    }

    /**
     * @param int $minAge
     * @param int $maxAge
     * @return int
     * @throws Exception
     */
    private function getRandomAge(int $minAge, int $maxAge): int
    {
        $currentTimestamp = time();
        $minTimestamp = $currentTimestamp - (31556952 * $maxAge);
        $maxTimestamp = $currentTimestamp - (31556952 * $minAge);
        return random_int($minTimestamp, $maxTimestamp);
    }

    /**
     * @param int $minSalary
     * @param int $maxSalary
     * @return float
     * @throws Exception
     */
    private function getRandomSalary(int $minSalary = 9500, int $maxSalary = 17000): float
    {
        return random_int($minSalary, $maxSalary) + random_int(0, 99) / 100;
    }

    /**
     * @param int $minPositionIdx
     * @param int $maxPositionIdx
     * @return int
     * @throws Exception
     */
    private function getRandomPosition(int $minPositionIdx = 2, int $maxPositionIdx = 8): int
    {
        return random_int($minPositionIdx, $maxPositionIdx);
    }

    /**
     * @return string
     * @throws Exception
     */
    private function getRandomUnitNumber(): string
    {
        return (string)random_int(2000, 10000);
    }

    private function getRandomUnitType(): string
    {
        return 'trolleybus';
    }

    /**
     * @return array
     */
    private function getRandomUnit(): array
    {
        $unit = [
            'LAZ' => ['E301'],
            'ZiU' => ['682', '683'],
            'Skoda' => ['14TR'],
            'UMZ' => ['T2'],
            'Bogdan' => ['T701']
        ];

        $manufacturer = array_rand($unit);
        $model = $unit[$manufacturer][array_rand($unit[$manufacturer])];

        return [
            'manufacturer' => $manufacturer,
            'model' => $model
        ];
    }

    /**
     * @param int $employeeCount
     * @throws Exception
     */
    public function generateEmloyees(int $employeeCount): void
    {
        $connection = $this->getConnection();

        // === CREATE EMPLOYEE ===

        $start = microtime(true);

        $firstName = $lastName = $dob = $currentSalary = $positionId = $hireDate = $fireDate = '';
        $statement = $connection->prepare(
        /** @lang MySQL */
            <<<SQL
            INSERT INTO employee (first_name, last_name, dob, current_salary, position_id, hire_date, fire_date) 
            VALUES (:firstName, :lastName, :dob, :currentSalary, :positionId, :hireDate, :fireDate)
SQL
        );
        $statement->bindParam(':firstName', $firstName);
        $statement->bindParam(':lastName', $lastName);
        $statement->bindParam(':dob', $dob);
        $statement->bindParam(':currentSalary', $currentSalary);
        $statement->bindParam(':positionId', $positionId);
        $statement->bindParam(':hireDate', $hireDate);
        $statement->bindParam(':fireDate', $fireDate);

        for ($employeeId = 15; $employeeId < $employeeCount; $employeeId++) {
            $firstName = $this->getRandomNames();
            $lastName = $this->getRandomLastNames();
            $dob = date('Y-m-d', $this->getRandomAge(18, 50));
            $currentSalary = $this->getRandomSalary();
            $positionId = $this->getRandomPosition();
            $hireDate = date('Y-m-d', $this->getRandomAge(5, 30));
            $fireDate = NULL;
            $statement->execute();
        }

        echo 'Create employees: ' . (microtime(true) - $start) . "\n";
    }

    /**
     * @param int $transportCount
     * @throws Exception
     */
    public function generateTransport(int $transportCount): void
    {
        /** @var PDO $connection */
        $connection = $this->getConnection();

        // === CREATE TRANSPORT ===

        $start = microtime(true);

        $unitType = $manufacturer = $model = $yearMake = $unitNumber = '';
        $statement = $connection->prepare(
        /** @lang MySQL */
            <<<SQL
            INSERT INTO transport (unit_type, manufacturer, model, year_make, unit_number) 
            VALUES (:unitType, :manufacturer, :model, :yearMake, :unitNumber)
            ON DUPLICATE KEY UPDATE year_make = VALUES(year_make);
SQL
        );
        $statement->bindParam(':unitType', $unitType);
        $statement->bindParam(':manufacturer', $manufacturer);
        $statement->bindParam(':model', $model);
        $statement->bindParam(':yearMake', $yearMake);
        $statement->bindParam(':unitNumber', $unitNumber);

        for ($transportId = 16; $transportId < $transportCount; $transportId++) {
            $unit = $this->getRandomUnit();
            $unitType = $this->getRandomUnitType();
            $manufacturer = $unit['manufacturer'];
            $model = $unit['model'];
            $yearMake = date('Y', $this->getRandomAge(1,20));
            $unitNumber = $this->getRandomUnitNumber();
            $statement->execute();
        }

        echo 'Create transport: ' . (microtime(true) - $start) . "\n";
    }

    /**
     * @param int $entryCount
     * @throws Exception
     */
    public function generateSalary(int $entryCount): void
    {
        /** @var PDO $connection */
        $connection = $this->getConnection();

        // === CREATE SALARY ENTRIES ===

        $start = microtime(true);
        $paymentDate = $employeeId = $paymentAmount = '';
        $statement = $connection->prepare(
            /** @lang MySQL */
            <<<SQL
            INSERT INTO salary (date, employee_id, payment) 
            VALUES (:paymentDate, :employeeId, :payment) 
SQL
        );
        $statement->bindParam(':paymentDate', $paymentDate);
        $statement->bindParam(':employeeId', $employeeId);
        $statement->bindParam(':payment', $paymentAmount);

        $salaryStatement = $connection->query('SELECT employee_id, current_salary FROM employee');
        $currentSalaryByEmployee = $salaryStatement->fetchAll(PDO::FETCH_ASSOC);
        $employeeCount = count($currentSalaryByEmployee);
        $currentTimeStamp = time();

        for ($salaryRecordId = 0; $salaryRecordId < $entryCount; $salaryRecordId++)
        {
            $paymentDate = date('Y-m-d', $currentTimeStamp - intdiv($salaryRecordId, $employeeCount) * 2592000);
            $employeeId = $salaryRecordId % $employeeCount + 1;
            $paymentAmount = $currentSalaryByEmployee[$salaryRecordId % $employeeCount]['current_salary'] * (random_int(75, 125) / 100);
            $statement->execute();
        }

        echo 'Create Salary Records: ' . (microtime(true) - $start) . "\n";
    }

    /**
     * @param int $incomeCount
     * @throws Exception
     */
    public function generateIncome(int $incomeCount): void
    {
        /** @var PDO $connection */
        $connection = $this->getConnection();

        // === CREATE INCOME ENTRIES ===
        $start = microtime(true);
        $dateIncome = $transportId = $employeeId = $income = '';
        $statement = $connection->prepare(
            /** @lang MySQL */
            <<<SQL
            INSERT INTO income (date, transport_id, employee_id, income) 
            VALUES (:dateIncome, :transportId, :employeeId, :income);
SQL
        );

        $statement->bindParam(':dateIncome',  $dateIncome);
        $statement->bindParam(':transportId',  $transportId);
        $statement->bindParam(':employeeId',  $employeeId);
        $statement->bindParam(':income',  $income);

        $driversStatement = $connection->query('SELECT employee_id FROM employee WHERE position_id = 4');
        $transportStatement = $connection->query('SELECT transport_id FROM transport');
        $driverIds = $driversStatement->fetchAll(PDO::FETCH_COLUMN);
        $transportIds = $transportStatement->fetchAll(PDO::FETCH_COLUMN);

        $currentTimeStamp = time();
        $driverCount = count($driverIds);

        for ($incomeRecord = 0; $incomeRecord < $incomeCount; $incomeRecord++)
            {
                if (random_int(1, 5) !== 3)
                {
                    /**
                     * @var $incomeRecord
                     * recursive date with 1 day step
                     */
                    $dateIncome =  date('Y-m-d', $currentTimeStamp - intdiv($incomeRecord, $driverCount) * 86400);
                    $transportId = $transportIds[array_rand($transportIds)];
                    $employeeId = $driverIds[$incomeRecord % $driverCount];
                    $income = random_int(8000, 18000);
                    $statement->execute();
                }
            }

        echo 'Create Income Records: ' . (microtime(true) - $start) . "\n";
    }
}

$fixtureGenerator = new Fixtures();
$fixtureGenerator->generate();