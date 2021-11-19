drop database if exists AliceInWonderland;
create database if not exists AliceInWonderland;
use AliceInWonderland;

create table student(
	uname varchar(40) NOT NULL,
    passw varchar(40) NOT NULL,
    fname varchar(30) NOT NULL,
    lname varchar(30) NOT NULL,
    class int not null,
    wordsAccessed int NOT NULL,
    definitionsAccess int NOT NULL,
    avgQuizScore decimal(2,2) NOT NULL,
    PRIMARY KEY (uname)
);

create table story(
	title varchar(300) NOT NULL,
    content LONGTEXT NOT NULL,
    PRIMARY KEY (title)
);

create table word(
	actualWord varchar(500) NOT NULL,
    audio varchar(500) NOT NULL,
    title varchar(300) NOT NULL,
    FOREIGN KEY (title) REFERENCES story(title), 
    PRIMARY KEY (actualWord)
);

create table quiz(
	keyword varchar(100) NOT NULL,
    FOREIGN KEY (keyword) REFERENCES word(actualWord),
    PRIMARY KEY (keyword)
);

create table question(
	keyword varchar(100) NOT NULL,
	statement varchar(500) NOT NULL,
    questionNumber int NOT NULL,
    FOREIGN KEY (keyword) REFERENCES quiz(keyword),
    PRIMARY KEY (questionNumber)
);

create table answer(
	answerText varchar(100) NOT NULL,
	answerStatus varchar(40) NOT NULL,
    questionNumber int NOT NULL,
    FOREIGN KEY (questionNumber) REFERENCES question(questionNumber), 
    PRIMARY KEY (questionNumber, answerText)
);



