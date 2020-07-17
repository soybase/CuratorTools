# Set current working database
# ------------------------------------------------------------

USE dbCuratorTools;

# Dump of table tblUsers
# ------------------------------------------------------------

DROP TABLE IF EXISTS tblUsers;

CREATE TABLE tblUsers (
  id INT(11) unsigned NOT NULL AUTO_INCREMENT,
  fname VARCHAR(64) NULL,
  lname VARCHAR(64) NULL,
  email VARCHAR(64) NULL,
  password CHAR(64) NULL,
  role VARCHAR(32) NULL,
  status VARCHAR(16) NULL,
  session_key CHAR(64) NULL,
  history JSON NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table tblAssemblies
# ------------------------------------------------------------

DROP TABLE IF EXISTS tblAssemblies;

CREATE TABLE tblAssemblies (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(64) DEFAULT NULL,
  source text,
  sequence_length int(11) DEFAULT NULL,
  structure_count int(11) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table tblErrors
# ------------------------------------------------------------

DROP TABLE IF EXISTS tblErrors;

CREATE TABLE tblErrors (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  study_id int(11) DEFAULT NULL,
  line_number int(11) DEFAULT NULL,
  category varchar(32) DEFAULT NULL,
  assembly_reference char(1) DEFAULT NULL,
  snp_chromosome text,
  snp_position text,
  snp_reference text,
  snp_alternate text,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table tblStructures
# ------------------------------------------------------------

DROP TABLE IF EXISTS tblStructures;

CREATE TABLE tblStructures (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  assembly_id int(11) DEFAULT NULL,
  name varchar(32) DEFAULT NULL,
  chunk_start int(11) DEFAULT NULL,
  chunk_length int(11) DEFAULT NULL,
  sequence_length int(11) DEFAULT NULL,
  sequence longtext,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table tblStudies
# ------------------------------------------------------------

DROP TABLE IF EXISTS tblStudies;

CREATE TABLE tblStudies (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  assembly_id int(11) DEFAULT NULL,
  name varchar(64) DEFAULT NULL,
  source text,
  vcf_meta mediumtext,
  vcf_header mediumtext,
  vcf_first_snp mediumtext,
  vcf_fields json DEFAULT NULL,
  vcf_chunks json DEFAULT NULL,
  snp_count int(11) DEFAULT NULL,
  cultivar_count int(11) DEFAULT NULL,
  structures json DEFAULT NULL,
  cultivars json DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table tblSimilarityJobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS tblSimilarityJobs;

CREATE TABLE tblSimilarityJobs (
  id int(11) NOT NULL AUTO_INCREMENT,
  study_id int(11) NOT NULL,
  sequences json DEFAULT NULL,
  cultivars json DEFAULT NULL,
  status varchar(32) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table tblSimilarityJobResults
# ------------------------------------------------------------

DROP TABLE IF EXISTS tblSimilarityJobResults;

CREATE TABLE tblSimilarityJobResults (
  id int(11) NOT NULL AUTO_INCREMENT,
  similarity_job_id int(11) NOT NULL,
  cultivar_key int(11) NOT NULL,
  results json DEFAULT NULL,
  PRIMARY KEY (id),
  KEY SIMILARITY_JOB_ID_INDEX (similarity_job_id),
  KEY CULTIVAR_KEY_INDEX (cultivar_key)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
