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

insert into student(uname, passw, fname, lname, class, wordsAccessed, definitionsAccess, avgQuizScore)
values
    ('aquin', 'pass1', 'Assata', 'Quinchett', 3, 10, 5, .88),
    ('edang', 'pass2', 'Emma', 'Dang', 3, 10, 5, .92),
    ('kjohn', 'pass3', 'Kolbie', 'Johnson', 3, 10, 5, .87),
    ('kmogi', 'pass4', 'Kirtana', 'Mogili', 3, 10, 5, .91),
    ('mjain', 'pass5', 'Maansi', 'Jain', 3, 10, 5, .90),
    ('snair', 'pass6', 'Sid', 'Nair', 3, 10, 5, .89);

create table story(
	title varchar(300) NOT NULL,
    content LONGTEXT NOT NULL,
    PRIMARY KEY (title)
);

insert into story(title, content)
values('Alice in Wonderland', 'The story.');

create table word(
	actualWord varchar(500) NOT NULL,
    audio varchar(500) NOT NULL,
    title varchar(300) NOT NULL,
    /*FOREIGN KEY (title) REFERENCES story(title), */
    PRIMARY KEY (actualWord)
);

insert into word(actualWord, audio, title)
values('welcome', 'welcome.mp3', last_insert_id());


create table quiz(
	keyword varchar(100) NOT NULL,
   /** FOREIGN KEY (keyword) REFERENCES word(actualWord),*/
    PRIMARY KEY (keyword)
);

insert into quiz(keyword)
values(last_insert_id());

create table question(
	keyword varchar(100) NOT NULL,
	sentence varchar(500) NOT NULL,
    questionNumber int NOT NULL,
  /*  FOREIGN KEY (keyword) REFERENCES quiz(keyword),*/
    PRIMARY KEY (questionNumber)
);

insert into question(keyword, sentence, questionNumber)
values('welcome', 'Welcome to the rabbit hole.', LAST_INSERT_ID());

create table answer(
	answerText varchar(100) NOT NULL,
	answerStatus varchar(40) NOT NULL,
    questionNumber int NOT NULL,
   /* FOREIGN KEY (questionNumber) REFERENCES question(questionNumber), */
    PRIMARY KEY (questionNumber, answerText)
);

insert into answer(answerText, answerStatus, questionNumber)
values('welcome', '', 1)
