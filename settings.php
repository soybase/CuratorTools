<?php
	//****************************************************************************************************************
	//	^--- PHP -- 1A - START of settings
	//****************************************************************************************************************
	$objSettings = new stdClass();
    // lines of SNPs per ajax request
	$objSettings->snp_chunk_size = getenv('CURATORTOOLS_SNP_CHUNK_SIZE') ?: 200;
    // milliseconds between ajax loops
	$objSettings->loop_interval = getenv('CURATORTOOLS_LOOP_INTERVAL') ?: 10;
    // turn console logging on or off
	$objSettings->console_logging = getenv('CURATORTOOLS_CONSOLE_LOGGING') ?: "false";
    // number of snps per insert
	$objSettings->insert_batch_size = getenv('CURATORTOOLS_INSERT_BATCH_SIZE') ?: 20;
    // maximum number of snps to be used for haplotype groups
	$objSettings->haplotype_max = getenv('CURATORTOOLS_HAPLOTYPE_MAX') ?: 100;
    // one persistent database connection per concurrent request
	$objSettings->max_concurrent_requests = getenv('CURATORTOOLS_MAX_CONCURRENT_REQUESTS') ?: 4;
    // database connection settings
	$objSettings->database = new stdClass();
	$objSettings->database->host =     getenv('MYSQL_HOST')     ?? 'localhost';
	$objSettings->database->name =     getenv('MYSQL_DATABASE') ?? 'dbCuratorTools';
	$objSettings->database->user =     getenv('MYSQL_USER')     ?? 'mysqlserver1';
	$objSettings->database->password = getenv('MYSQL_PASSWORD') ?? 'mysqlserver1';

    // current core being used for this request (internal variable used a counter; don't modify)
	$objSettings->core = 0;
	//****************************************************************************************************************
	//	^--- PHP -- 1A - END of settings
	//****************************************************************************************************************
?>
