CREATE DATABASE library;

CREATE TABLE library.users
(
    id BIGINT AUTO_INCREMENT,
    login VARCHAR(200) NOT NULL,
    password VARCHAR(200) NOT NULL,
    role VARCHAR(150) NOT NULL DEFAULT 'utilisateur',
    PRIMARY KEY (id)
);

CREATE TABLE library.editors
(
    id BIGINT AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    image VARCHAR(300) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE library.series
(
    id BIGINT AUTO_INCREMENT,
    id_editor BIGINT NOT NULL,
    name VARCHAR(200),
    image VARCHAR(300),
    PRIMARY KEY (id),
    FOREIGN KEY (id_editor) REFERENCES editors(id)
);

CREATE TABLE library.books
(
    id BIGINT AUTO_INCREMENT,
    id_serie BIGINT NOT NULL,
    tome INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(300) NOT NULL,
    illustrator VARCHAR(300) NOT NULL,
    date VARCHAR(80) NOT NULL,
    image VARCHAR(300) NOT NULL,
    description VARCHAR(5000) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_serie) REFERENCES series(id)
);

CREATE TABLE library.libraries
(
    id BIGINT AUTO_INCREMENT,
    id_user BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_user) REFERENCES users(id)
);

CREATE TABLE library.books_statement (
    id BIGINT AUTO_INCREMENT,
    id_book BIGINT NOT NULL,
    statement varchar(200) NOT NULL DEFAULT 'Neuf',
    PRIMARY KEY (id),
    FOREIGN KEY (id_book) REFERENCES books(id)
);

-- Ajout des éditeurs
INSERT INTO library.editors (name, image) VALUES ('DC Comics',  'https://drive.google.com/uc?export=view&id=19V3mjqeLku58mZJuIgTSQRM__r2Ekd6M');
INSERT INTO library.editors (name, image) VALUES ('Marvel', 'https://drive.google.com/uc?export=view&id=1-t8984O1nJcQlMg3pYwY-lJp-YKOaF0g');

-- Ajout des séries
INSERT INTO library.series (id_editor, name, image) VALUES (1, 'Batman', 'https://drive.google.com/uc?export=view&id=1v76EY-FiUKUw0C7JRuu-GYd7q9Ysq7ws');
INSERT INTO library.series (id_editor, name, image) VALUES (1, 'Superman', 'https://drive.google.com/uc?export=view&id=1Hlt2fm9dCAWPQqMzxuRm-0DZUgWUl3wz');
INSERT INTO library.series (id_editor, name, image) VALUES (2, 'Wolverine', 'https://drive.google.com/uc?export=view&id=17iS1eFU09u5jZGuGGqxeqWh_rwaDkgNI');
INSERT INTO library.series (id_editor, name, image) VALUES (2, 'Spiderman', 'https://drive.google.com/uc?export=view&id=1DPviGN0Oh2Qw98CklBmYeElqdzx0WbYc');

-- Ajout des livres Batman
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (1, 1, 'Batman: Year One', 'Frank Miller', 'David Mazzucchelli', '1988', 'https://readcomiconline.li/Uploads/Etc/5-6-2016/59173923.jpg', 'Bruce Wayne a passé son adolescence et son début à l''âge adulte à parcourir le monde afin de perfectionner son corps et son esprit pour en faire la machine de combat et d''enquête parfaite. Mais maintenant qu''il revient à Gotham City, il doit trouver un moyen de concentrer sa passion et de rendre justice à sa ville. Retraçant les premières tentatives de Batman pour lutter contre l''injustice en tant que justicier costumé, nous le regardons choisir une apparence de chauve-souris géante, créer un lien précoce avec un jeune lieutenant James Gordon, jouer par inadvertance un rôle dans la naissance de Catwoman et aider à faire tomber un système politique corrompu qui infeste Gotham.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (1, 2, 'Batman: The Dark Knight Returns', 'Frank Miller', 'Frank Miller', '2010', 'https://readcomiconline.li/Uploads/Etc/8-9-2016/5134021534237.jpg', 'Ce chef-d''œuvre de la narration de bandes dessinées donne vie à un monde sombre... et à un homme encore plus sombre. Frank Miller réinvente complètement la légende de Batman dans sa saga d''un futur proche Gotham City en ruine, dix ans après la retraite du Dark Knight.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (1, 3, 'Batman: The Killing Joke', 'Alan Moore', 'Brian Bolland', '1988', 'https://2.bp.blogspot.com/-EYx4gB4mH0o/Vs0QF_yZQHI/AAAAAAAAB98/vX_9_htQ-p0/s1600-Ic42/2.jpg', 'Pour la première fois, l''origine du Joker est révélée dans cette histoire de folie et de persévérance humaine. Cherchant à prouver que n''importe quel homme peut être poussé au-delà de son point de rupture et devenir fou, le Joker tente de rendre le commissaire Gordon fou. Après avoir tiré et paralysé de façon permanente sa fille Barbara (alias Batgirl), le Joker kidnappe le commissaire et attaque son esprit dans l''espoir de briser l''homme. Mais refusant d''abandonner, Gordon maintient sa santé mentale avec l''aide de Batman dans le but de vaincre le fou.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (1, 4, 'Batman: Hush', 'Jeph Loeb', 'Jim Lee', 'Janvier 2003', 'https://readcomiconline.li/Uploads/Etc/5-2-2016/2646391hush.jpg', 'Batman sauve un jeune garçon qui a été kidnappé par Killer Croc qui a été embauché par Poison Ivy. Alors qu''il poursuit Catwoman, Batman est grièvement blessé en tombant d''un immeuble. Il fait équipe avec Catwoman et suit Poison Ivy à Metropolis et combat Superman qui est sous le contrôle de Poison Ivy. Batman est capable d''aider Superman à reprendre le contrôle de lui-même et à arrêter Poison Ivy alors que Hush regarde de côté.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (1, 5, 'Batman: The Long Halloween', 'Jeph Loeb', 'Tim Sale', 'Octobre 1996 - Octobre 1997', 'https://readcomiconline.li/Uploads/Etc/3-7-2016/9971621152Untitled-1.jpg', 'Caped Crusader se joint au capitaine de police Jim Gordon et au procureur de district Harvey Dent pour obtenir la marchandise sur le chef de la mafia Carmine Falcone. Pendant ce temps, un mystérieux tueur en série cible les membres du gang de Falcone. Contrastant avec cette histoire inspirée par le parrain, les premières apparitions d''adversaires de Batman vêtus de couleurs vives comme le Joker et Catwoman.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (1, 6, 'Batman: The Court of Owls', 'Scott Snyder', 'Greg Capullo', '2012', 'https://readcomiconline.li/Uploads/Etc/7-24-2016/7691031534210.jpg', 'ne nouvelle ère pour The Dark Knight et Gotham City commence ici par l''écrivain Scott Snyder (AMERICAN VAMPIRE, BATMAN: GATES OF GOTHAM) et l''artiste Greg Capullo. Batman et la Bat-Family poursuivent leur quête pour protéger les habitants de Gotham - et maintenant Bruce Wayne lui-même entre dans le jeu !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (1, 7, 'Batman: Death of the Family', 'Scott Snyder', 'Greg Capullo', '2013', 'https://readcomiconline.li/Uploads/Etc/7-7-2016/8232081534239.jpg', 'Après s''être fait trancher le visage, le Joker fait son retour terrifiant à Gotham City dans cette épopée des numéros 13 à 17 qui a secoué Batman dans son cœur ! Mais même pour un homme qui a commis une vie de meurtre, il est plus dangereux que jamais. Comment Batman peut-il protéger sa ville et ses proches ?');

-- Ajout des livres Superman
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (2, 1, 'Superman: Secret Origin', 'Geoff Johns', 'Gary Frank', 'Novembre 2009 - Octobre 2010', 'https://readcomiconline.li/Uploads/Etc/4-29-2016/5502062837Untitled-1.jpg', 'Superman: Secret Origin est un récit en six numéros de l''histoire de Clark Kent de Smallville à Metropolis, racontée par l''équipe d''étoiles de Geoff Johns et Gary Frank.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (2, 2, 'Superman: Red Son', 'Mark Millar', 'Dave Johnson, Kilian Plunkett', 'Août 2003 - Octobre 2003', 'https://readcomiconline.li/Uploads/Etc/4-8-2016/747752837Untitled-12.jpg', 'Dans cette histoire de paranoïa de la guerre froide, le vaisseau spatial transportant le bébé Superman atterrit dans l''Union soviétique des années 1950, où il grandit pour devenir un symbole du pouvoir soviétique.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (2, 3, 'Superman: Birthright', 'Mark Waid', 'Leinil Francis Yu', 'Septembre 2003 - Septembre 2004', 'https://readcomiconline.li/Uploads/Etc/4-8-2016/7126952837Untitled-11.jpg', 'The story begins with Superman''s iconic origin: the destruction of planet Krypton. Jor-El laments the fact that his world accomplished "miracles no one will remember" while preparing infant Kal-El''s voyage. Kal-El''s shuttle pod fires into space moments before the planet''s destruction. Jor-El and wife Lara regret that they will never know if Kal-El survives the journey.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (2, 4, 'Superman: For Tomorrow', 'Brian Azzarello', 'Jim Lee', 'Février 6, 2013', 'https://readcomiconline.li/Uploads/Etc/10-7-2019/77985143071123.jpg', 'Dans cette épopée de Brian Azzarello et Jim Lee, un événement cataclysmique a frappé la Terre. Des millions de personnes ont disparu sans laisser de trace. Personne n''est épargné - pas même Superman ! Mais comment des millions de personnes ont-elles pu disparaître sans laisser de trace - et Superman pourrait-il en être la cause ?');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (2, 5, 'Superman: Earth One', 'J. Michael Straczynski', 'Shane Davis', '2010', 'https://readcomiconline.li/Uploads/Etc/3-30-2016/72242428.jpg', 'A series of original graphic novels, and the first (Volume One) of DC Comics'' Earth One imprint, which brings us a new and modernized take on the origin of Superman.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (2, 6, 'Superman: All-Star Superman', 'Grant Morrison', 'Frank Quitely', 'Janvier 2006 - Octobre 2008', 'https://readcomiconline.li/Uploads/Etc/11-4-2015/4203222Untitled-1.jpg', 'Superman sauve Leo Quintum, chef du DNA P.R.O.J.E.C.T., et ses assistants d''un autre des plans ignobles de Lex Luthor. Avec Luthor derrière les barreaux, il semble que les forces du bien triomphent à nouveau. Mais cela masque la plus grande réalisation de Luthor... la mort de Superman lui-même');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (2, 7, 'Superman: Doomsday Clock', 'Geoff Johns', 'Gary Frank', 'Novembre 22, 2017', 'https://readcomiconline.li/Uploads/Etc/11-22-2017/9901543071289.jpg', 'DC Comics vous présente une maxi-série de 12 numéros de l''équipe acclamée par la critique de l''écrivain Geoff Johns, de l''artiste Gary Frank et du coloriste Brad Anderson. Vous n''êtes pas préparés à ce qui vous attend dans ces pages, bons lecteurs.');

-- Ajout des livres Wolverine
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (3, 1, 'Wolverine: Weapon X', 'Larry Hama', 'Adam Kubert', 'Mars 1995 - Juin 1995', 'https://readcomiconline.li/Uploads/Etc/5-17-2016/1100638807Untitled-1.jpg', 'Jean et Logan envoient une mission suicide par le Conseil humain, voyageant dans une sentinelle pour détruire la grande muraille de l''océan Atlantique. Au cours de leur mission, ils affrontent l''impétueux Havok mais il est battu et téléporté à des kilomètres. Ils ont accompli leur mission en permettant une évacuation humaine massive. Après, le conseil humain est attaqué par Magma, un assassin mutant envoyé par Apocalypse, cette attaque provoque la colère de Brian Braddock qui établit un bombardement radioactif massif sur l''Amérique du Nord comme l''attaque finale au règne vicieux d''Apocalypse.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (3, 2, 'Wolverine: Old Man Logan', 'Mark Millar', 'Steve McNiven', '2009', 'https://readcomiconline.li/Uploads/Etc/10-18-2016/284601534245.jpg', 'Le meilleur de ce qu''il fait, Wolverine est l''un des mutants les plus dangereux, mystérieux et aventureux de Marvel U. Wolverine est plein d''action incessante et énervée qui prend la fureur de notre mutant le plus populaire des films X-Men. et accomplileurs crans');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (3, 3, 'Wolverine: Enemy of the State', 'Jimmie Robinson', 'Carmine Di Giandomenico', 'Janvier 2007', 'https://readcomiconline.li/Uploads/Etc/3-22-2017/67476743071447.jpg', 'What if the world''s deadliest killing machine was never de-programmed? Over half a year has passed since the Hand took control of Wolverine, forcing him to assassinate one great hero after another. Now only a handful of super-powered beings are left to stop him.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (3, 4, 'Wolverine: Origins', 'Daniel Way', 'Steve Dillon', 'Juin 2006 - Septembre 2010', 'https://readcomiconline.li/Uploads/Etc/6-14-2016/84243988071.jpg', 'Mille ans après que les humains ont été tués par l''intelligence artificielle, un homme est ramené à la vie : David Adams, qui a créé la technologie qui a détruit son peuple. Maintenant, avec l''aide de l''androïde Chloé qui l''a ressuscité, David tentera de restaurer l''humanité et d''arrêter les seigneurs de l''IA qu''il a créés. David se lance dans la plus grande bataille de sa vie, cherchant la rédemption tout en découvrant si l''humanité peut ou devrait avoir un avenir. Une nouvelle épopée de science-fiction pour les fans de Little Bird et Descender du célèbre écrivain Clay McLeod Chapman (Absolute Carnage: Separation Anxiety) et de l''illustrateur Jakub Rebelka (Judas), basée sur un concept d''Arash Amel (A Private War), Joseph Oxford ( Moi + Elle) et Lee Toland Krieger (L''âge d''Adaline).');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (3, 5, 'Wolverine: The Best There Is', 'Charlie Huston', 'Tim Bradstreet, Juan Jose Ryp', 'Février 2011 - Février 2012', 'https://readcomiconline.li/Uploads/Etc/9-17-2016/6055241534255.jpg', 'Lorsque Wolverine fait face à un problème de type méchant, il y a de fortes chances qu''il utilise ses griffes d''Adamantium pour y trouver une solution mortelle. Que se passe-t-il, cependant, lorsqu''il fait face à un adversaire qui devient un problème beaucoup plus grave s''il est tué ? Entrez: Contagion, un nouvel ajout audacieux à la galerie des voyous de Wolverine. Mais d''abord, Logan doit affronter les défenseurs de Contagion, l''équipage bien nommé connu sous le nom d''Unkillables.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (3, 6, 'Wolverine: Savage Wolverine', 'Frank Cho', 'Frank Cho', 'Mars 2013 - Novembre 2014', 'https://readcomiconline.li/Uploads/Etc/4-18-2016/49457455591.jpg', 'Wolverine se réveille pour se retrouver transporté au pays sauvage et étiqueté ennemi public numéro un ! Sans aucun souvenir de la façon dont il est arrivé là-bas, et Shanna la diablesse sa seule alliée, Logan doit percer le mystère qui sommeille au cœur de la Terre sauvage avant qu''il ne trouve un moyen de le tuer en premier. En janvier, Wolverine n''est que bagarres, bébés et brachiosaures, et vous ne verrez jamais la fin - ou l''avenir de l''univers Marvel');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (3, 7, 'Wolverine: Firebreak', 'Mike Carey', 'Scott Kolins', 'Février 2008', 'https://readcomiconline.li/Uploads/Etc/11-9-2018/61778843071958.jpg', 'Tout le monde sait que Wolverine est un traqueur expert, mais qu''en est-il quand il a été aveuglé ? Le combattant canadien doit mener une famille en vacances hors des bois, en utilisant seulement ses 4 sens restants et l''aide de cette même famille. Les choses se compliquent cependant avec la visite d''Advanced Idea Mechanics.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (3, 8, 'Wolverine: Death of Wolverine', 'Charles Soule', 'Steve McNiven', 'Novembre 2014 - Décembre 2014', 'https://readcomiconline.li/Uploads/Etc/10-31-2015/19485812.jpg', 'TROIS MOIS À MOURIR, la perte du facteur de guérison de Wolverine – tout cela a conduit à l''événement X-Men le plus important de la décennie. Logan a passé plus d''un siècle à être le meilleur dans ce qu''il fait... mais même les meilleurs finissent par disparaître. Au fil des ans, Logan a été un guerrier, un héros, un renégat, un samouraï, un enseignant et bien plus encore. Mais maintenant, le plus grand héros X-Men jouera un rôle qu''il n''a jamais joué auparavant dans cet événement hebdomadaire spécial présenté par les superstars de l''industrie Charles Soule et Steve McNiven.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (3, 9, 'Wolverine: Netsuke', 'George Pratt', 'George Pratt', 'Novembre 2002 - Février 2003', 'https://readcomiconline.li/Uploads/Etc/10-11-2018/73819743071478.jpg', 'Wolverine est de retour au Japon ! Invoqué par l''esprit de sa bien-aimée Mariko, Logan retourne dans l''enceinte de la famille Yashida. L''attend un netsuke laissé par Mariko, une bascule à l''ancienne de l''âge des samouraïs féodaux. Et une fois que Logan l''a ramassé, il est transporté dans l''ancien Japon des années 1100 ! Lisez pour l''art et le scénario à couper le souffle de George Pratt!');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (3, 10, 'Wolverine: Infinity Watch', 'Gerry Duggan', 'Andy MacDonald', 'Février 2019', 'https://readcomiconline.li/Uploads/Etc/2-22-2019/22333543071305.jpg', 'ENFIN RÉVÉLÉ ! COMMENT WOLVERINE A OBTENU LA PIERRE INFINITY ! Wolverine est enfin revenu, débarrassé des griffes maléfiques de Soteira… mais attendez, n''avait-il pas une Pierre d''Infinité ? Comment est-ce arrivé?! Et n''était-il pas apparu partout pendant un petit moment? Les réponses que vous cherchez sont enfin révélées alors que Logan devient cosmique aux côtés du dieu préféré des mensonges et des histoires, Loki Laufeyson !');

-- Ajout des livres Spiderman
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (4, 1, 'Spider-Man: The Spectacular Spider-Man', 'Stan Lee', 'John Romita Sr.', 'Juillet 1968 - Novembre 1968', 'https://readcomiconline.li/Uploads/Etc/12-5-2019/92760343071266.jpg', 'Le nouveau candidat à la mairie, Richard Raleigh, a une étrange emprise sur les masses de New York. Mais mijoter sous l''extérieur urbain est quelque chose de bien plus sinistre et Peter Parker est le seul à le remarquer...');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (4, 2, 'Spider-Man: Kraven s Last Hunt', 'J.M. DeMatteis', 'Mike Zeck', 'Février 1989 - Février 2008', 'https://readcomiconline.li/Uploads/Etc/7-1-2016/40634328.jpg', 'L''écrivain J.M. DeMatteis et l''artiste Mike Zeck créent l''ultime histoire de vengeance dans cette collection révolutionnaire et légendaire ! Kraven le chasseur a traqué et tué tous les animaux connus de l''homme. Mais il y a une bête qui lui a échappé. Une carrière qui s''est moquée de lui à chaque tournant : le lanceur de toile rampant connu sous le nom de Spider-Man. Et pour prouver qu''il est le maître du héros, il enfilera son costume et deviendra lui... après l''avoir abattu et enterré six pieds sous terre !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (4, 3, 'Spider-Man: The Clone Saga', 'Howard Mackie, Tom DeFalco', 'Todd Nauck', 'Novembre 2009 - Avril 2010', 'https://readcomiconline.li/Uploads/Etc/7-31-2016/6450551534278.jpg', 'Vous l''avez demandé... et maintenant il est là : LA SAGA DES CLONES !!! L''événement le plus controversé de tous les temps de Marvel revient avec une vengeance, présentant la saga des clones telle qu''elle devait à l''origine être racontée ! Des esprits derrière le crossover qui a changé les bandes dessinées pour toujours et l''artiste qui a présenté Spider-Man au président Obama, ce sont six numéros de rebondissements qui choqueront les fans, anciens et nouveaux ! Soyez ici alors que le pire cauchemar de Peter Parker recommence… maintenant avec une fin qu''il faut voir pour y croire !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (4, 4, 'Spider-Man: Maximum Carnage', 'David Michelinie, J.M. DeMatteis, Terry Kavanagh, Tom DeFalco', 'Alex Saviuk, Ron Lim, Sal Buscema, Tom Lyle, Mark Bagley', 'Juillet 1994', 'https://readcomiconline.li/Uploads/Etc/6-1-2016/4424008807Untitled-1.jpg', 'Carnage est de retour et il est prêt à apporter sa marque de meurtre et de chaos à New York. Mais lorsque Carnage adopte des alliés partageant les mêmes idées, cela devient Maximum Carnage. Spider-Man, Venom et d''autres pourront-ils l''arrêter ?');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (4, 5, 'Spider-Man: Blue', 'Jeph Loeb', 'Tim Sale', 'Juillet 2002 - Avril 2003', 'https://readcomiconline.li/Uploads/Etc/4-22-2016/7973992837Untitled-16.jpg', 'Jeph Loeb et Tim Sale présentent ce somptueux retour sur une époque charnière pour Amazing Spider-Man - y compris l''introduction du premier amour de Peter, Gwen Stacy; sa relation grandissante avec Mary Jane Watson ; son amitié naissante avec Harry Osborn ; et la bataille finale surprenante de Spider-Man contre le gobelin vert.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (4, 6, 'Spider-Man: Sweet Charity', 'Ron Zimmerman', 'Darick Robertson', 'Août 2002', 'https://readcomiconline.li/Uploads/Etc/7-30-2018/3644243071647.jpg', 'Un destin cruel s''abat sur le mur-crawler qui est contraint, grâce à une vente aux enchères de célébrités, de passer un week-end en camping avec son ennemi numéro un : J. Jonah Jameson ! Et pour cet étrange couple, les tiques, les coyotes et les ours sont peut-être le cadet de leurs soucis ! Il semble que quelqu''un avec une haine brûlante pour eux deux voit une opportunité de faire d''une pierre deux coups ! Oui, le Scorpion est de retour - et il est plus fou que jamais !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description) VALUES (4, 7, 'Spider-Man: The Mysterio Manifesto', 'Tom DeFalco', 'Lee Weeks, Bob McLeod', 'Janvier 2001 - Mars 2001', 'https://readcomiconline.li/Uploads/Etc/11-14-2016/40121931586123.jpg', 'Le colocataire de Peter, Randy Robertson, le réveille après un sommeil agité. Malgré sa réticence, il sait qu''il doit se lever et trouver quelque chose d''intéressant à photographier pour payer ses factures. Il se dirige vers le toit, vérifie les alentours et se transforme en Spider-Man. Il commence alors à fouiller la ville. Après le tribunal, Matt Murdock se transforme en Daredevil et traverse la ville. Il couvre à peine quelques pâtés de maisons lorsqu''il est attaqué par Spider-Man. DD essaie d''éviter le combat mais n''a pas le choix. Il prépare Spider-Man pour une attaque à longue portée avec son billy club. Il le frappe à la tête, le rend inconscient, le faisant chuter vers la rue. Lorsque DD se précipite pour le surveiller, il n''y a pas de corps.');

-- Ajout des états des livres
INSERT INTO library.books_statement (id_book, statement) VALUES (1, 'Neuf');
INSERT INTO library.books_statement (id_book, statement) VALUES (2, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement) VALUES (3, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement) VALUES (4, 'Bon état');
INSERT INTO library.books_statement (id_book, statement) VALUES (5, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement) VALUES (6, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement) VALUES (7, 'Bon état');
INSERT INTO library.books_statement (id_book, statement) VALUES (8, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement) VALUES (9, 'Bon état');
INSERT INTO library.books_statement (id_book, statement) VALUES (10, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement) VALUES (11, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement) VALUES (12, 'Neuf');
INSERT INTO library.books_statement (id_book, statement) VALUES (13, 'Bon état');
INSERT INTO library.books_statement (id_book, statement) VALUES (14, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement) VALUES (15, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement) VALUES (16, 'Bon état');
INSERT INTO library.books_statement (id_book, statement) VALUES (17, 'Neuf');
INSERT INTO library.books_statement (id_book, statement) VALUES (18, 'Neuf');
INSERT INTO library.books_statement (id_book, statement) VALUES (19, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement) VALUES (20, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement) VALUES (21, 'Bon état');
INSERT INTO library.books_statement (id_book, statement) VALUES (22, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement) VALUES (23, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement) VALUES (24, 'Bon état');
INSERT INTO library.books_statement (id_book, statement) VALUES (25, 'Neuf');
INSERT INTO library.books_statement (id_book, statement) VALUES (26, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement) VALUES (27, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement) VALUES (28, 'Bon état');
INSERT INTO library.books_statement (id_book, statement) VALUES (29, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement) VALUES (30, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement) VALUES (31, 'Bon état');
