/*Users fake data*/
INSERT INTO Users VALUES(1001, 'CSLuke', 'csluke@outlook.com', '$5$rounds=535000$/ckdaMK/e1Ovw3ds$WvQpZPNivK.VU8WLSI31JMftDZMfufKGQ1YMGcZiaz2', 'Luke', 'Smith',0);
INSERT INTO Users VALUES(1002, 'Vini', 'vini@gmail.com', '$5$rounds=535000$/ckdaMK/e1Ovw3ds$WvQpZPNivK.VU8WLSI31JMftDZMfufKGQ1YMGcZiaz2', 'Vinicious', '',0);

/*Deck fake data*/
INSERT INTO Decks VALUES(11,'Math',TRUE);
INSERT INTO Decks VALUES(12,'Hebrew',FALSE);
INSERT INTO Decks VALUES(13,'German',TRUE);
INSERT INTO Decks VALUES(14,'More Math',FALSE);

/*Deck permissions fake data*/
INSERT INTO DeckRights VALUES(1001, 11, 'User');
INSERT INTO DeckRights VALUES(1002, 11, 'Owner');
INSERT INTO DeckRights VALUES(1001, 12, 'Owner');
INSERT INTO DeckRights VALUES(1001, 13, 'Editor');
INSERT INTO DeckRights VALUES(1001, 14, 'User');

/*Card fake data*/
INSERT INTO Cards VALUES(10001, 11, '2+2=','4');
INSERT INTO Cards VALUES(10002, 11, '3-17=','-14');
INSERT INTO Cards VALUES(10003, 12, 'אמר','he said');

/*Friends fake data*/
INSERT INTO Friends VALUES(1001, 1002);

