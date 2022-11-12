drop database if exists TickKingProject;
create database if not exists TickKingProject;
use TickKingProject;
DROP TABLE if exists Users cascade;
DROP TABLE if exists Awards cascade;
DROP TABLE if exists AwardsWon cascade;
DROP TABLE if exists Friends cascade;
DROP TABLE if exists Notifications cascade;
DROP TABLE if exists Decks cascade;
DROP TABLE if exists DeckRights cascade;
DROP TABLE if exists Cards cascade;
DROP TABLE if exists Frequencies cascade;

CREATE TABLE Users (
	UserID		INT			NOT NULL AUTO_INCREMENT,
	UserName	VARCHAR(15)	NOT NULL,
	Email		VARCHAR(25)	NOT NULL,	
    Passcode	CHAR(128) NOT NULL,
    FirstName	VARCHAR(15)	NOT NULL,
    LastName	VARCHAR(15),
    Streak		INT,
    PRIMARY KEY (UserID));

CREATE TABLE Awards(
	AwardID		INT			PRIMARY KEY,
    AwardName	VARCHAR(25)	NOT NULL,
    AwardDesc	VARCHAR(100),
    PointVal	INT			NOT NULL,
    Requirement	VARCHAR(100));

CREATE TABLE AwardsWon(
	UserID		INT		NOT NULL,
	AwardID		INT		NOT NULL,
	NumTimesWon	INT		NOT NULL,
CONSTRAINT PK_AwardsWon	PRIMARY KEY (UserID, AwardID),
CONSTRAINT FK_AwardsWon1 FOREIGN KEY (UserID) REFERENCES Users(UserID),
CONSTRAINT FK_AwardsWon2 FOREIGN KEY (AwardID) REFERENCES Awards(AwardID));

CREATE TABLE Friends(
	UserID		INT		NOT NULL,
	FriendID	INT		NOT NULL,
CONSTRAINT PK_Friends	PRIMARY KEY (UserID, FriendID),
CONSTRAINT FK_Friends1 FOREIGN KEY (UserID) REFERENCES Users(UserID),
CONSTRAINT FK_Friends2 FOREIGN KEY (FriendID) REFERENCES Users(UserID));

-- missing notification table


CREATE TABLE Decks(
	DeckID		INT			PRIMARY KEY,
	DeckName	VARCHAR(15)	NOT NULL,
    isPublic	BOOLEAN		NOT NULL);

CREATE TABLE DeckRights(
	UserID		INT		NOT NULL,
	DeckID		INT		NOT NULL,
	Rights 		ENUM('Owner','Editor','User') NOT NULL,
CONSTRAINT PK_DeckRights PRIMARY KEY (UserID, DeckID),
CONSTRAINT FK_DeckRights1 FOREIGN KEY (UserID) REFERENCES Users(UserID),
CONSTRAINT FK_DeckRights2 FOREIGN KEY (DeckID) REFERENCES Decks(DeckID));



CREATE TABLE Cards(
	CardID		INT		PRIMARY KEY,
    DeckID		INT		NOT NULL,
    Prompt		VARCHAR(100)	NOT NULL,
    Answer		VARCHAR(100)	NOT NULL,
CONSTRAINT FK_Cards FOREIGN KEY (DeckID) REFERENCES Decks(DeckID));


CREATE TABLE Frequencies(
	UserID		INT		NOT NULL,
	CardID		INT		NOT NULL,
	AvgScore	DOUBLE(5,4),
    EFactor		DOUBLE(5,4),
    NextDate	DATE,
    Count		INT,
    isActive	BOOLEAN	NOT NULL,
CONSTRAINT PK_Frequencies PRIMARY KEY (UserID, CardID),
CONSTRAINT FK_Frequencies1 FOREIGN KEY (UserID) REFERENCES Users(UserID),
CONSTRAINT FK_Frequencies2 FOREIGN KEY (CardID) REFERENCES Cards(CardID));
