create database newlog;

use newlog;

drop TABLE project;
create table project(
project_id int(255)   not null primary key  AUTO_INCREMENT,
project_name varchar(50) not null
)AUTO_INCREMENT = 10;


create table module(
module_id int(255) primary key auto_increment,
module_name varchar(50) not null,
pid int(255),
foreign key(pid) references project(project_id)
)AUTO_INCREMENT = 1000;

ALTER TABLE project_test ADD UNIQUE (project_test_name);
ALTER TABLE project ADD UNIQUE (project_name);

INSERT INTO module (module_name,pid,tpid) VALUES ("web",(SELECT project_id from project where project_name="B10") , (SELECT project_test_id from project_test where project_test_name="B10_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("mobile",(SELECT project_id from project where project_name="B10") , (SELECT project_test_id from project_test where project_test_name="B10_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("office",(SELECT project_id from project where project_name="B10") , (SELECT project_test_id from project_test where project_test_name="B10_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("agent",(SELECT project_id from project where project_name="B10") , (SELECT project_test_id from project_test where project_test_name="B10_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("franchisee",(SELECT project_id from project where project_name="B10") , (SELECT project_test_id from project_test where project_test_name="B10_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("webapi",(SELECT project_id from project where project_name="B10") , (SELECT project_test_id from project_test where project_test_name="B10_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("agentapi",(SELECT project_id from project where project_name="B10") , (SELECT project_test_id from project_test where project_test_name="B10_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("officeapi",(SELECT project_id from project where project_name="B10") , (SELECT project_test_id from project_test where project_test_name="B10_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("officenotice",(SELECT project_id from project where project_name="B10") , (SELECT project_test_id from project_test where project_test_name="B10_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("smapi",(SELECT project_id from project where project_name="B10") , (SELECT project_test_id from project_test where project_test_name="B10_test") );

INSERT INTO module (module_name,pid,tpid) VALUES ("ndj_web",(SELECT project_id from project where project_name="B05") , (SELECT project_test_id from project_test where project_test_name="B05_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("ndj_file",(SELECT project_id from project where project_name="B05") , (SELECT project_test_id from project_test where project_test_name="B05_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("ndj_agent",(SELECT project_id from project where project_name="B05") , (SELECT project_test_id from project_test where project_test_name="B05_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("ndj_office",(SELECT project_id from project where project_name="B05") , (SELECT project_test_id from project_test where project_test_name="B05_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("ndj_game",(SELECT project_id from project where project_name="B05") , (SELECT project_test_id from project_test where project_test_name="B05_test") );

INSERT INTO module (module_name,pid,tpid) VALUES ("ak9_web",(SELECT project_id from project where project_name="B05") , (SELECT project_test_id from project_test where project_test_name="B05_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("ak9_agent",(SELECT project_id from project where project_name="B05") , (SELECT project_test_id from project_test where project_test_name="B05_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("ak9_hall",(SELECT project_id from project where project_name="B05") , (SELECT project_test_id from project_test where project_test_name="B05_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("ak9_office",(SELECT project_id from project where project_name="B05") , (SELECT project_test_id from project_test where project_test_name="B05_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("ak9_game",(SELECT project_id from project where project_name="B05") , (SELECT project_test_id from project_test where project_test_name="B05_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("ak9_file",(SELECT project_id from project where project_name="B05") , (SELECT project_test_id from project_test where project_test_name="B05_test") );

INSERT INTO module (module_name,pid,tpid) VALUES ("pay_front",(SELECT project_id from project where project_name="A92") , (SELECT project_test_id from project_test where project_test_name="A92_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("pay_api",(SELECT project_id from project where project_name="A92") , (SELECT project_test_id from project_test where project_test_name="A92_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("pay_office",(SELECT project_id from project where project_name="A92") , (SELECT project_test_id from project_test where project_test_name="A92_test") );

INSERT INTO module (module_name,pid,tpid) VALUES ("pay_front",(SELECT project_id from project where project_name="A93") , (SELECT project_test_id from project_test where project_test_name="A93_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("pay_api",(SELECT project_id from project where project_name="A93") , (SELECT project_test_id from project_test where project_test_name="A93_test") );
INSERT INTO module (module_name,pid,tpid) VALUES ("pay_office",(SELECT project_id from project where project_name="A93") , (SELECT project_test_id from project_test where project_test_name="A93_test") );
