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
INSERT INTO Cards VALUES(10004, 12, 'כאשר','when');
INSERT INTO Cards VALUES(10005, 11, '17 x 3 =','51');
INSERT INTO Cards VALUES(10006, 11, '6-7=','-1');
INSERT INTO Cards VALUES(10007, 13, 'Deutsch','German');
INSERT INTO Cards VALUES(10008, 11, '1+2=','YOUR MOM!');
INSERT INTO Cards VALUES(10009, 12, 'לאכל','To Eat');
INSERT INTO Cards VALUES(10010, 13, 'Ich','I');
INSERT INTO Cards VALUES(10011, 11, '5 / 3 =','1.66667');
INSERT INTO Cards VALUES(10012, 11, '3 ^ 8 =','5661');
INSERT INTO Cards VALUES(10013, 14, 'What is the square of 5?', '25');
INSERT INTO Cards VALUES(10014, 14, 'What is the result of 9 + 6?', '15');
INSERT INTO Cards VALUES(10015, 14, 'What is the cube root of 27?', '3');
INSERT INTO Cards VALUES(10016, 14, 'What is the value of sin(45) (to 2 decimal places)?', '0.71');
INSERT INTO Cards VALUES(10017, 14, 'What is the result of 4 * 3?', '12');
INSERT INTO Cards VALUES(10018, 14, 'What is the value of log(1000) (to 2 decimal places)?', '3');
INSERT INTO Cards VALUES(10019, 14, 'What is the result of 15 - 6?', '9');
INSERT INTO Cards VALUES(10020, 14, 'What is the value of e (to 2 decimal places)?', '2.72');
INSERT INTO Cards VALUES(10021, 14, 'What is the value of pi (to 2 decimal places)?', '3.14');
INSERT INTO Cards VALUES(10022, 13, 'Was bedeutet "ich" auf Englisch?', 'I');
INSERT INTO Cards VALUES(10023, 13, 'Was ist die Hauptstadt von Deutschland?', 'Berlin');
INSERT INTO Cards VALUES(10024, 13, 'Wie lautet die deutsche Übersetzung des Wortes "apple"?', 'Apfel');
INSERT INTO Cards VALUES(10025, 13, 'Wie sagt man "Guten Morgen" auf Englisch?', 'Good morning');
INSERT INTO Cards VALUES(10026, 13, 'Was bedeutet "danke" auf Englisch?', 'Thank you');
INSERT INTO Cards VALUES(10027, 13, 'Wie lautet die deutsche Übersetzung des Wortes "computer"?', 'Computer');
INSERT INTO Cards VALUES(10028, 13, 'Wie sagt man "Ich verstehe nicht" auf Englisch?', 'I don\'t understand');
INSERT INTO Cards VALUES(10029, 13, 'Was bedeutet "bitte" auf Englisch?', 'Please');
INSERT INTO Cards VALUES(10030, 13, 'Wie sagt man "Guten Abend" auf Englisch?', 'Good evening');
INSERT INTO Cards VALUES(10031, 13, 'Was ist die deutsche Übersetzung des Wortes "dog"?', 'Hund');
INSERT INTO Cards VALUES(32, 12, 'פתח', 'open');
INSERT INTO Cards VALUES(33, 12, 'סגור', 'closed');
INSERT INTO Cards VALUES(34, 12, 'רץ', 'run');
INSERT INTO Cards VALUES(35, 12, 'שחק', 'play');
INSERT INTO Cards VALUES(36, 12, 'קפוץ', 'jump');
INSERT INTO Cards VALUES(37, 12, 'צחק', 'laugh');
INSERT INTO Cards VALUES(38, 12, 'צלם', 'photograph');
INSERT INTO Cards VALUES(39, 12, 'שתה', 'drink');
INSERT INTO Cards VALUES(40, 12, 'אכל', 'eat');
INSERT INTO Cards VALUES(41, 12, 'כתב', 'write');
INSERT INTO Cards VALUES(42, 12, 'קרא', 'read');
INSERT INTO Cards VALUES(43, 12, 'למד', 'learn');
INSERT INTO Cards VALUES(44, 12, 'טס', 'fly');
INSERT INTO Cards VALUES(45, 12, 'נוס', 'escape');
INSERT INTO Cards VALUES(46, 12, 'התלבש', 'dress up');
INSERT INTO Cards VALUES(47, 12, 'שמע', 'hear');
INSERT INTO Cards VALUES(48, 12, 'דיבר', 'speak');
INSERT INTO Cards VALUES(49, 12, 'קנה', 'buy');
INSERT INTO Cards VALUES(50, 12, 'מכר', 'sell');
INSERT INTO Cards VALUES(51, 12, 'שכח', 'forget');
INSERT INTO Cards VALUES(52, 12, 'זכר', 'remember');
INSERT INTO Cards VALUES(53, 12, 'בקש', 'ask');
INSERT INTO Cards VALUES(54, 12, 'תן', 'give');
INSERT INTO Cards VALUES(55, 12, 'קח', 'take');
INSERT INTO Cards VALUES(56, 12, 'טייל', 'travel');

/*Friends fake data*/
INSERT INTO Friends VALUES(1001, 1002);

