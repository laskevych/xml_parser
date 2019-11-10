<?php

chdir(__DIR__);
ini_set('max_execution_time', 0);

$dbh = new PDO('mysql:host=app-mysql;port=3306;dbname=db;charset=utf8', 'user', 'password');

$reader = new XMLReader();

$reader->open('15.1-EX_XML_EDR_UO_07.11.2019.xml');

while($reader->read()) {
    if ($reader->localName === 'RECORD' && $reader->nodeType == XMLReader::ELEMENT) {
        $dataXml = $reader->readOuterXml();

        $r = simplexml_load_string($dataXml);
        if (empty($r)) {
            $reader->next();
        }

        $company = [];
        $company['edrpou'] = (string)$r->EDRPOU ?? '';
        $company['name'] = (string)$r->NAME ?? '';
        $company['shortname'] = (string)$r->SHORT_NAME ?? '';
        $company['boss'] = (string)$r->BOSS ?? '';
        $company['address'] = (string)$r->ADDRESS ?? '';
        $company['kved'] = (string)$r->KVED ?? '';
        $company['stan'] = (string)$r->STAN ?? '';

        $founders = [];
        if (!empty($r->FOUNDERS)) {
            foreach ($r->FOUNDERS->FOUNDER as $FOUNDER) {
                $founders[] = (string)$FOUNDER;
            }
        }

        if (empty($company['edrpou'] || empty($company['name']))) {
            file_put_contents('logs.txt', "[error_data]: empty name {$company['name']} or empty edrpou {$company['edrpou']}", FILE_APPEND);
        }

        try {
            $stmt = $dbh->prepare("INSERT INTO companies (`edrpou`,`name`,`shortname`, `boss`, `address`, `kved`, `stan`) 
                                                            VALUES (:edrpou,:name, :shortname, :boss, :address, :kved, :stan)");
            $stmt->execute($company);

            if (!empty($founders)) {
                $stmt = $dbh->prepare("INSERT INTO companies_founders (`company_edrpou`,`founder`) 
                                                            VALUES (:company_edrpou,:founder)");
                foreach ($founders as $founder) {
                    $stmt->execute(array('company_edrpou' => $company['edrpou'], 'founder' => $founder));
                }
            }

        } catch (PDOException $e) {
            file_put_contents('logs.txt', "[error_mysql]: ". $e->getMessage(), FILE_APPEND);
        }

        unset($r);
        $reader->next();
    }
}