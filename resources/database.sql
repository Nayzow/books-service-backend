CREATE DATABASE library;

CREATE TABLE library.libraries
(
    id BIGINT AUTO_INCREMENT,
    PRIMARY KEY (id)
);

CREATE TABLE library.users
(
    id         BIGINT AUTO_INCREMENT,
    id_library BIGINT       NULL,
    email      VARCHAR(100) NOT NULL,
    username   VARCHAR(200) NOT NULL,
    password   VARCHAR(200) NOT NULL,
    image      VARCHAR(500) NULL DEFAULT 'https://drive.google.com/uc?export=view&id=1kWAD-v4gugA_edk33b0O-KAtQZxVUiuF',
    role       VARCHAR(150) NULL DEFAULT 'utilisateur',
    PRIMARY KEY (id),
    FOREIGN KEY (id_library) REFERENCES libraries (id)
);

CREATE TABLE library.editors
(
    id          BIGINT AUTO_INCREMENT,
    name        VARCHAR(200)  NOT NULL,
    description VARCHAR(3000) NOT NULL,
    image       VARCHAR(300)  NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE library.series
(
    id          BIGINT AUTO_INCREMENT,
    id_editor   BIGINT        NOT NULL,
    name        VARCHAR(200)  NOT NULL,
    description VARCHAR(3000) NOT NULL,
    image       VARCHAR(300),
    PRIMARY KEY (id),
    FOREIGN KEY (id_editor) REFERENCES editors (id)
);

CREATE TABLE library.books
(
    id          BIGINT AUTO_INCREMENT,
    id_serie    BIGINT        NOT NULL,
    tome        INT           NOT NULL,
    title       VARCHAR(150)  NOT NULL,
    author      VARCHAR(300)  NOT NULL,
    illustrator VARCHAR(300)  NOT NULL,
    date        VARCHAR(80)   NOT NULL,
    image       VARCHAR(300)  NOT NULL,
    description VARCHAR(5000) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_serie) REFERENCES series (id)
);

CREATE TABLE library.comments
(
    id      BIGINT AUTO_INCREMENT,
    id_book BIGINT        NOT NULL,
    id_user BIGINT        NOT NULL,
    content VARCHAR(3000) NOT NULL,
    date    VARCHAR(200)  NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_book) REFERENCES books (id),
    FOREIGN KEY (id_user) REFERENCES users (id)
);

CREATE TABLE library.books_statement
(
    id        BIGINT AUTO_INCREMENT,
    id_book   BIGINT       NOT NULL,
    statement varchar(200) NOT NULL DEFAULT 'Neuf',
    PRIMARY KEY (id),
    FOREIGN KEY (id_book) REFERENCES books (id)
);

CREATE TABLE library.borrowings
(
    id                BIGINT AUTO_INCREMENT,
    id_book_statement BIGINT       NULL,
    id_library        BIGINT       NULL,
    duration          VARCHAR(150) NULL,
    date              VARCHAR(150) NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_book_statement) REFERENCES books_statement (id),
    FOREIGN KEY (id_library) REFERENCES libraries (id)
);

-- Ajout des éditeurs
INSERT INTO library.editors (name, description, image)
VALUES ('DC Comics',
        'DC Comics est un éditeur de bandes dessinées américain créé en 1934, connu pour ses super-héros emblématiques tels que Batman, Superman et Wonder Woman, ainsi que pour son univers de bandes dessinées étendu et complexe, connu sous le nom de l''univers DC. Les bandes dessinées publiées par DC Comics offrent des réflexions sur la société, la politique et la psychologie humaine, avec des personnages mémorables tels que Flash, Green Lantern, Catwoman, Joker, Lex Luthor et Darkseid. Les bandes dessinées de DC Comics ont inspiré des générations de fans de comics et continuent de captiver l''imagination des lecteurs aujourd''hui.',
        'https://drive.google.com/uc?export=view&id=1F7Iurdz4P5QX4-OBd_OHoloTSEnj8rUf');
INSERT INTO library.editors (name, description, image)
VALUES ('Marvel',
        'Marvel Comics est un éditeur de bandes dessinées américain connu pour ses super-héros emblématiques tels que Spider-Man, Iron Man, Hulk, Captain America et Thor. Fondé en 1939, Marvel a une longue histoire de publications écrites et dessinées par certains des plus grands talents de l''industrie de la bande dessinée. Les histoires de Marvel sont souvent axées sur l''action, l''aventure et l''humour, avec une orientation plus grand public que DC Comics. Les personnages de Marvel sont extrêmement populaires auprès des fans de comics et sont devenus des icônes de la culture populaire.',
        'https://drive.google.com/uc?export=view&id=1qmmpyv_VLoqUSkzCeGOaul2nFGW3Lcu1');

-- Ajout des séries
INSERT INTO library.series (id_editor, name, description, image)
VALUES (1, 'Batman',
        'Batman est une série de bandes dessinées de super-héros publiée par DC Comics depuis 1939, créée par Bob Kane et Bill Finger. La série suit les aventures de Bruce Wayne, un milliardaire de Gotham City qui, après avoir assisté au meurtre de ses parents lorsqu''il était enfant, a juré de venger leur mort en combattant le crime en tant que Batman. Les histoires de Batman sont écrites et dessinées par certains des plus grands noms de l''industrie de la bande dessinée, et couvrent une grande variété de genres, avec des intrigues complexes, des personnages bien développés, une action intense et des dessins époustouflants. Les principaux personnages de Batman incluent Alfred Pennyworth, James Gordon et plusieurs super-vilains. En somme, la série Batman est un incontournable de la bande dessinée de super-héros.',
        'https://drive.google.com/uc?export=view&id=1v76EY-FiUKUw0C7JRuu-GYd7q9Ysq7ws');
INSERT INTO library.series (id_editor, name, description, image)
VALUES (1, 'Superman',
        'Superman est l''un des super-héros les plus emblématiques de l''industrie de la bande dessinée, et la série de bandes dessinées de super-héros publiée par DC Comics depuis 1938 suit les aventures de Clark Kent, un extraterrestre qui a été envoyé sur Terre alors qu''il était bébé et qui a développé des pouvoirs extraordinaires grâce à l''exposition au soleil jaune de notre planète. Les histoires de Superman, écrites et dessinées par certains des plus grands noms de l''industrie de la bande dessinée, abordent une grande variété de thèmes allant de la science-fiction à la fantasy, en passant par les histoires d''action et les drames familiaux, et présentent des personnages profonds et des dessins saisissants. Les principaux personnages de Superman incluent Lois Lane et Lex Luthor, et d''autres personnages récurrents incluent la famille Kent et la Ligue de justice d''Amérique.',
        'https://drive.google.com/uc?export=view&id=1Hlt2fm9dCAWPQqMzxuRm-0DZUgWUl3wz');
INSERT INTO library.series (id_editor, name, description, image)
VALUES (2, 'Wolverine',
        'Wolverine est une série de bandes dessinées de super-héros publiée par Marvel Comics depuis 1982, créé par Len Wein et John Romita Sr. Il s''agit d''un personnage mutant de l''univers des X-Men qui possède des capacités de guérison accélérée et des griffes en adamantium. Les histoires de Wolverine sont souvent sombres et violentes, explorant les aspects les plus sombres de la nature humaine. Les principaux personnages de Wolverine incluent le professeur Charles Xavier et les autres membres des X-Men, ainsi que des ennemis récurrents tels que Sabretooth, Omega Red et Lady Deathstrike. En somme, la série Wolverine est une incontournable de la bande dessinée de super-héros, offrant des histoires sombres, des personnages mémorables et une action épique.',
        'https://drive.google.com/uc?export=view&id=17iS1eFU09u5jZGuGGqxeqWh_rwaDkgNI');
INSERT INTO library.series (id_editor, name, description, image)
VALUES (2, 'Spiderman',
        'Spider-Man est une série de bandes dessinées de super-héros publiée par Marvel Comics depuis 1962, créée par Stan Lee et Steve Ditko. La série suit les aventures de Peter Parker, un étudiant ordinaire qui acquiert des pouvoirs extraordinaires après avoir été mordu par une araignée radioactive. Les histoires de Spider-Man sont connues pour leur combinaison unique de drame, d''humour et d''action, avec des personnages attachants et des dessins dynamiques. Les principaux personnages incluent Mary Jane Watson, Harry Osborn, et les ennemis emblématiques tels que le Bouffon Vert, le Docteur Octopus et Venom, ajoutant de la profondeur et de la complexité à la série. En somme, Spider-Man est un classique de la bande dessinée de super-héros, ayant inspiré des générations de fans de comics.',
        'https://drive.google.com/uc?export=view&id=1DPviGN0Oh2Qw98CklBmYeElqdzx0WbYc');
INSERT INTO library.series (id_editor, name, description, image)
VALUES (2, 'Hulk',
        'L''Incroyable Hulk est une série de comics créée par Stan Lee et Jack Kirby pour Marvel Comics. Le premier numéro est sorti en 1962. Le personnage principal est Bruce Banner, un scientifique qui se transforme en une créature verte et puissante appelée Hulk lorsqu''il est en colère ou stressé. L''histoire suit les aventures de Hulk alors qu''il lutte contre les forces du mal tout en cherchant à contrôler sa colère et à trouver un remède pour sa condition. Les thèmes abordés dans les histoires incluent la responsabilité, l''isolement et la dualité de l''être humain. La série a connu de nombreux artistes et scénaristes au fil des ans, et a inspiré plusieurs adaptations cinématographiques, séries télévisées et jeux vidéo.',
        'https://drive.google.com/uc?export=view&id=1qYwy-GyXGGqiFnazrCDtldvf5kxnyIJN');
INSERT INTO library.series (id_editor, name, description, image)
VALUES (1, 'Wonder Woman',
        'Wonder Woman est une série de comics de DC Comics créée en 1941 par William Moulton Marston. Elle suit les aventures de Diana, une princesse amazone avec des pouvoirs extraordinaires, envoyée dans le monde des hommes pour défendre la justice et la paix. La série met en lumière la force, le courage et l''intelligence des femmes, avec le personnage de Wonder Woman devenant un symbole de l''émancipation féminine et de l''égalité des sexes. Adapté dans différents médias, Wonder Woman reste l''un des personnages les plus populaires de DC Comics.',
        'https://drive.google.com/uc?export=view&id=1NJfh8JKDVJKEIH57CKCXUaAS7ijKMDA3');
INSERT INTO library.series (id_editor, name, description, image)
VALUES (2, 'Ironman',
        'Iron Man est une série de comics de Marvel Comics créée par Stan Lee, Larry Lieber, Don Heck et Jack Kirby en 1963. Elle suit les aventures de Tony Stark, un milliardaire de génie qui se construit une armure de haute technologie après avoir été gravement blessé. En tant qu''Iron Man, il utilise ses compétences scientifiques et technologiques pour lutter contre le crime et les menaces contre le monde, tout en affrontant ses propres démons intérieurs. La série a exploré des thèmes tels que la responsabilité, le pouvoir et la technologie, tout en devenant l''un des piliers de l''univers Marvel. Elle a également été adaptée dans différents médias, notamment des films à succès au box-office.',
        'https://drive.google.com/uc?export=view&id=1JbEhKBKMfabQnD-BH2k00ADU-nGwHKSi');


-- Ajout des livres Batman
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (1, 1, 'Batman: Year One', 'Frank Miller', 'David Mazzucchelli', '1988',
        'https://readcomiconline.li/Uploads/Etc/5-6-2016/59173923.jpg',
        'Bruce Wayne a passé son adolescence et son début à l''âge adulte à parcourir le monde afin de perfectionner son corps et son esprit pour en faire la machine de combat et d''enquête parfaite. Mais maintenant qu''il revient à Gotham City, il doit trouver un moyen de concentrer sa passion et de rendre justice à sa ville. Retraçant les premières tentatives de Batman pour lutter contre l''injustice en tant que justicier costumé, nous le regardons choisir une apparence de chauve-souris géante, créer un lien précoce avec un jeune lieutenant James Gordon, jouer par inadvertance un rôle dans la naissance de Catwoman et aider à faire tomber un système politique corrompu qui infeste Gotham.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (1, 2, 'Batman: The Dark Knight Returns', 'Frank Miller', 'Frank Miller', '2010',
        'https://readcomiconline.li/Uploads/Etc/8-9-2016/5134021534237.jpg',
        'Ce chef-d''œuvre de la narration de bandes dessinées donne vie à un monde sombre... et à un homme encore plus sombre. Frank Miller réinvente complètement la légende de Batman dans sa saga d''un futur proche Gotham City en ruine, dix ans après la retraite du Dark Knight.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (1, 3, 'Batman: The Killing Joke', 'Alan Moore', 'Brian Bolland', '1988',
        'https://2.bp.blogspot.com/-EYx4gB4mH0o/Vs0QF_yZQHI/AAAAAAAAB98/vX_9_htQ-p0/s1600-Ic42/2.jpg',
        'Pour la première fois, l''origine du Joker est révélée dans cette histoire de folie et de persévérance humaine. Cherchant à prouver que n''importe quel homme peut être poussé au-delà de son point de rupture et devenir fou, le Joker tente de rendre le commissaire Gordon fou. Après avoir tiré et paralysé de façon permanente sa fille Barbara (alias Batgirl), le Joker kidnappe le commissaire et attaque son esprit dans l''espoir de briser l''homme. Mais refusant d''abandonner, Gordon maintient sa santé mentale avec l''aide de Batman dans le but de vaincre le fou.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (1, 4, 'Batman: Hush', 'Jeph Loeb', 'Jim Lee', 'Janvier 2003',
        'https://readcomiconline.li/Uploads/Etc/5-2-2016/2646391hush.jpg',
        'Batman sauve un jeune garçon qui a été kidnappé par Killer Croc qui a été embauché par Poison Ivy. Alors qu''il poursuit Catwoman, Batman est grièvement blessé en tombant d''un immeuble. Il fait équipe avec Catwoman et suit Poison Ivy à Metropolis et combat Superman qui est sous le contrôle de Poison Ivy. Batman est capable d''aider Superman à reprendre le contrôle de lui-même et à arrêter Poison Ivy alors que Hush regarde de côté.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (1, 5, 'Batman: The Long Halloween', 'Jeph Loeb', 'Tim Sale', 'Octobre 1996 - Octobre 1997',
        'https://readcomiconline.li/Uploads/Etc/3-7-2016/9971621152Untitled-1.jpg',
        'Caped Crusader se joint au capitaine de police Jim Gordon et au procureur de district Harvey Dent pour obtenir la marchandise sur le chef de la mafia Carmine Falcone. Pendant ce temps, un mystérieux tueur en série cible les membres du gang de Falcone. Contrastant avec cette histoire inspirée par le parrain, les premières apparitions d''adversaires de Batman vêtus de couleurs vives comme le Joker et Catwoman.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (1, 6, 'Batman: The Court of Owls', 'Scott Snyder', 'Greg Capullo', '2012',
        'https://readcomiconline.li/Uploads/Etc/7-24-2016/7691031534210.jpg',
        'ne nouvelle ère pour The Dark Knight et Gotham City commence ici par l''écrivain Scott Snyder (AMERICAN VAMPIRE, BATMAN: GATES OF GOTHAM) et l''artiste Greg Capullo. Batman et la Bat-Family poursuivent leur quête pour protéger les habitants de Gotham - et maintenant Bruce Wayne lui-même entre dans le jeu !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (1, 7, 'Batman: Death of the Family', 'Scott Snyder', 'Greg Capullo', '2013',
        'https://readcomiconline.li/Uploads/Etc/7-7-2016/8232081534239.jpg',
        'Après s''être fait trancher le visage, le Joker fait son retour terrifiant à Gotham City dans cette épopée des numéros 13 à 17 qui a secoué Batman dans son cœur ! Mais même pour un homme qui a commis une vie de meurtre, il est plus dangereux que jamais. Comment Batman peut-il protéger sa ville et ses proches ?');

-- Ajout des livres Superman
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (2, 1, 'Superman: Secret Origin', 'Geoff Johns', 'Gary Frank', 'Novembre 2009 - Octobre 2010',
        'https://readcomiconline.li/Uploads/Etc/4-29-2016/5502062837Untitled-1.jpg',
        'Superman: Secret Origin est un récit en six numéros de l''histoire de Clark Kent de Smallville à Metropolis, racontée par l''équipe d''étoiles de Geoff Johns et Gary Frank.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (2, 2, 'Superman: Red Son', 'Mark Millar', 'Dave Johnson, Kilian Plunkett', 'Août 2003 - Octobre 2003',
        'https://readcomiconline.li/Uploads/Etc/4-8-2016/747752837Untitled-12.jpg',
        'Dans cette histoire de paranoïa de la guerre froide, le vaisseau spatial transportant le bébé Superman atterrit dans l''Union soviétique des années 1950, où il grandit pour devenir un symbole du pouvoir soviétique.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (2, 3, 'Superman: Birthright', 'Mark Waid', 'Leinil Francis Yu', 'Septembre 2003 - Septembre 2004',
        'https://readcomiconline.li/Uploads/Etc/4-8-2016/7126952837Untitled-11.jpg',
        'The story begins with Superman''s iconic origin: the destruction of planet Krypton. Jor-El laments the fact that his world accomplished "miracles no one will remember" while preparing infant Kal-El''s voyage. Kal-El''s shuttle pod fires into space moments before the planet''s destruction. Jor-El and wife Lara regret that they will never know if Kal-El survives the journey.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (2, 4, 'Superman: For Tomorrow', 'Brian Azzarello', 'Jim Lee', 'Février 6, 2013',
        'https://readcomiconline.li/Uploads/Etc/10-7-2019/77985143071123.jpg',
        'Dans cette épopée de Brian Azzarello et Jim Lee, un événement cataclysmique a frappé la Terre. Des millions de personnes ont disparu sans laisser de trace. Personne n''est épargné - pas même Superman ! Mais comment des millions de personnes ont-elles pu disparaître sans laisser de trace - et Superman pourrait-il en être la cause ?');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (2, 5, 'Superman: Earth One', 'J. Michael Straczynski', 'Shane Davis', '2010',
        'https://readcomiconline.li/Uploads/Etc/3-30-2016/72242428.jpg',
        'A series of original graphic novels, and the first (Volume One) of DC Comics'' Earth One imprint, which brings us a new and modernized take on the origin of Superman.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (2, 6, 'Superman: All-Star Superman', 'Grant Morrison', 'Frank Quitely', 'Janvier 2006 - Octobre 2008',
        'https://readcomiconline.li/Uploads/Etc/11-4-2015/4203222Untitled-1.jpg',
        'Superman sauve Leo Quintum, chef du DNA P.R.O.J.E.C.T., et ses assistants d''un autre des plans ignobles de Lex Luthor. Avec Luthor derrière les barreaux, il semble que les forces du bien triomphent à nouveau. Mais cela masque la plus grande réalisation de Luthor... la mort de Superman lui-même');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (2, 7, 'Superman: Doomsday Clock', 'Geoff Johns', 'Gary Frank', 'Novembre 22, 2017',
        'https://readcomiconline.li/Uploads/Etc/11-22-2017/9901543071289.jpg',
        'DC Comics vous présente une maxi-série de 12 numéros de l''équipe acclamée par la critique de l''écrivain Geoff Johns, de l''artiste Gary Frank et du coloriste Brad Anderson. Vous n''êtes pas préparés à ce qui vous attend dans ces pages, bons lecteurs.');

-- Ajout des livres Wolverine
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (3, 1, 'Wolverine: Weapon X', 'Larry Hama', 'Adam Kubert', 'Mars 1995 - Juin 1995',
        'https://readcomiconline.li/Uploads/Etc/5-17-2016/1100638807Untitled-1.jpg',
        'Jean et Logan envoient une mission suicide par le Conseil humain, voyageant dans une sentinelle pour détruire la grande muraille de l''océan Atlantique. Au cours de leur mission, ils affrontent l''impétueux Havok mais il est battu et téléporté à des kilomètres. Ils ont accompli leur mission en permettant une évacuation humaine massive. Après, le conseil humain est attaqué par Magma, un assassin mutant envoyé par Apocalypse, cette attaque provoque la colère de Brian Braddock qui établit un bombardement radioactif massif sur l''Amérique du Nord comme l''attaque finale au règne vicieux d''Apocalypse.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (3, 2, 'Wolverine: Old Man Logan', 'Mark Millar', 'Steve McNiven', '2009',
        'https://readcomiconline.li/Uploads/Etc/10-18-2016/284601534245.jpg',
        'Le meilleur de ce qu''il fait, Wolverine est l''un des mutants les plus dangereux, mystérieux et aventureux de Marvel U. Wolverine est plein d''action incessante et énervée qui prend la fureur de notre mutant le plus populaire des films X-Men. et accomplileurs crans');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (3, 3, 'Wolverine: Enemy of the State', 'Jimmie Robinson', 'Carmine Di Giandomenico', 'Janvier 2007',
        'https://readcomiconline.li/Uploads/Etc/3-22-2017/67476743071447.jpg',
        'What if the world''s deadliest killing machine was never de-programmed? Over half a year has passed since the Hand took control of Wolverine, forcing him to assassinate one great hero after another. Now only a handful of super-powered beings are left to stop him.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (3, 4, 'Wolverine: Origins', 'Daniel Way', 'Steve Dillon', 'Juin 2006 - Septembre 2010',
        'https://readcomiconline.li/Uploads/Etc/6-14-2016/84243988071.jpg',
        'Mille ans après que les humains ont été tués par l''intelligence artificielle, un homme est ramené à la vie : David Adams, qui a créé la technologie qui a détruit son peuple. Maintenant, avec l''aide de l''androïde Chloé qui l''a ressuscité, David tentera de restaurer l''humanité et d''arrêter les seigneurs de l''IA qu''il a créés. David se lance dans la plus grande bataille de sa vie, cherchant la rédemption tout en découvrant si l''humanité peut ou devrait avoir un avenir. Une nouvelle épopée de science-fiction pour les fans de Little Bird et Descender du célèbre écrivain Clay McLeod Chapman (Absolute Carnage: Separation Anxiety) et de l''illustrateur Jakub Rebelka (Judas), basée sur un concept d''Arash Amel (A Private War), Joseph Oxford ( Moi + Elle) et Lee Toland Krieger (L''âge d''Adaline).');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (3, 5, 'Wolverine: The Best There Is', 'Charlie Huston', 'Tim Bradstreet, Juan Jose Ryp',
        'Février 2011 - Février 2012', 'https://readcomiconline.li/Uploads/Etc/9-17-2016/6055241534255.jpg',
        'Lorsque Wolverine fait face à un problème de type méchant, il y a de fortes chances qu''il utilise ses griffes d''Adamantium pour y trouver une solution mortelle. Que se passe-t-il, cependant, lorsqu''il fait face à un adversaire qui devient un problème beaucoup plus grave s''il est tué ? Entrez: Contagion, un nouvel ajout audacieux à la galerie des voyous de Wolverine. Mais d''abord, Logan doit affronter les défenseurs de Contagion, l''équipage bien nommé connu sous le nom d''Unkillables.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (3, 6, 'Wolverine: Savage Wolverine', 'Frank Cho', 'Frank Cho', 'Mars 2013 - Novembre 2014',
        'https://readcomiconline.li/Uploads/Etc/4-18-2016/49457455591.jpg',
        'Wolverine se réveille pour se retrouver transporté au pays sauvage et étiqueté ennemi public numéro un ! Sans aucun souvenir de la façon dont il est arrivé là-bas, et Shanna la diablesse sa seule alliée, Logan doit percer le mystère qui sommeille au cœur de la Terre sauvage avant qu''il ne trouve un moyen de le tuer en premier. En janvier, Wolverine n''est que bagarres, bébés et brachiosaures, et vous ne verrez jamais la fin - ou l''avenir de l''univers Marvel');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (3, 7, 'Wolverine: Firebreak', 'Mike Carey', 'Scott Kolins', 'Février 2008',
        'https://readcomiconline.li/Uploads/Etc/11-9-2018/61778843071958.jpg',
        'Tout le monde sait que Wolverine est un traqueur expert, mais qu''en est-il quand il a été aveuglé ? Le combattant canadien doit mener une famille en vacances hors des bois, en utilisant seulement ses 4 sens restants et l''aide de cette même famille. Les choses se compliquent cependant avec la visite d''Advanced Idea Mechanics.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (3, 8, 'Wolverine: Death of Wolverine', 'Charles Soule', 'Steve McNiven', 'Novembre 2014 - Décembre 2014',
        'https://readcomiconline.li/Uploads/Etc/10-31-2015/19485812.jpg',
        'TROIS MOIS À MOURIR, la perte du facteur de guérison de Wolverine – tout cela a conduit à l''événement X-Men le plus important de la décennie. Logan a passé plus d''un siècle à être le meilleur dans ce qu''il fait... mais même les meilleurs finissent par disparaître. Au fil des ans, Logan a été un guerrier, un héros, un renégat, un samouraï, un enseignant et bien plus encore. Mais maintenant, le plus grand héros X-Men jouera un rôle qu''il n''a jamais joué auparavant dans cet événement hebdomadaire spécial présenté par les superstars de l''industrie Charles Soule et Steve McNiven.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (3, 9, 'Wolverine: Netsuke', 'George Pratt', 'George Pratt', 'Novembre 2002 - Février 2003',
        'https://readcomiconline.li/Uploads/Etc/10-11-2018/73819743071478.jpg',
        'Wolverine est de retour au Japon ! Invoqué par l''esprit de sa bien-aimée Mariko, Logan retourne dans l''enceinte de la famille Yashida. L''attend un netsuke laissé par Mariko, une bascule à l''ancienne de l''âge des samouraïs féodaux. Et une fois que Logan l''a ramassé, il est transporté dans l''ancien Japon des années 1100 ! Lisez pour l''art et le scénario à couper le souffle de George Pratt!');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (3, 10, 'Wolverine: Infinity Watch', 'Gerry Duggan', 'Andy MacDonald', 'Février 2019',
        'https://readcomiconline.li/Uploads/Etc/2-22-2019/22333543071305.jpg',
        'ENFIN RÉVÉLÉ ! COMMENT WOLVERINE A OBTENU LA PIERRE INFINITY ! Wolverine est enfin revenu, débarrassé des griffes maléfiques de Soteira… mais attendez, n''avait-il pas une Pierre d''Infinité ? Comment est-ce arrivé?! Et n''était-il pas apparu partout pendant un petit moment? Les réponses que vous cherchez sont enfin révélées alors que Logan devient cosmique aux côtés du dieu préféré des mensonges et des histoires, Loki Laufeyson !');

-- Ajout des livres Spiderman
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (4, 1, 'Spider-Man: The Spectacular Spider-Man', 'Stan Lee', 'John Romita Sr.', 'Juillet 1968 - Novembre 1968',
        'https://readcomiconline.li/Uploads/Etc/12-5-2019/92760343071266.jpg',
        'Le nouveau candidat à la mairie, Richard Raleigh, a une étrange emprise sur les masses de New York. Mais mijoter sous l''extérieur urbain est quelque chose de bien plus sinistre et Peter Parker est le seul à le remarquer...');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (4, 2, 'Spider-Man: Kraven s Last Hunt', 'J.M. DeMatteis', 'Mike Zeck', 'Février 1989 - Février 2008',
        'https://readcomiconline.li/Uploads/Etc/7-1-2016/40634328.jpg',
        'L''écrivain J.M. DeMatteis et l''artiste Mike Zeck créent l''ultime histoire de vengeance dans cette collection révolutionnaire et légendaire ! Kraven le chasseur a traqué et tué tous les animaux connus de l''homme. Mais il y a une bête qui lui a échappé. Une carrière qui s''est moquée de lui à chaque tournant : le lanceur de toile rampant connu sous le nom de Spider-Man. Et pour prouver qu''il est le maître du héros, il enfilera son costume et deviendra lui... après l''avoir abattu et enterré six pieds sous terre !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (4, 3, 'Spider-Man: The Clone Saga', 'Howard Mackie, Tom DeFalco', 'Todd Nauck', 'Novembre 2009 - Avril 2010',
        'https://readcomiconline.li/Uploads/Etc/7-31-2016/6450551534278.jpg',
        'Vous l''avez demandé... et maintenant il est là : LA SAGA DES CLONES !!! L''événement le plus controversé de tous les temps de Marvel revient avec une vengeance, présentant la saga des clones telle qu''elle devait à l''origine être racontée ! Des esprits derrière le crossover qui a changé les bandes dessinées pour toujours et l''artiste qui a présenté Spider-Man au président Obama, ce sont six numéros de rebondissements qui choqueront les fans, anciens et nouveaux ! Soyez ici alors que le pire cauchemar de Peter Parker recommence… maintenant avec une fin qu''il faut voir pour y croire !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (4, 4, 'Spider-Man: Maximum Carnage', 'David Michelinie, J.M. DeMatteis, Terry Kavanagh, Tom DeFalco',
        'Alex Saviuk, Ron Lim, Sal Buscema, Tom Lyle, Mark Bagley', 'Juillet 1994',
        'https://readcomiconline.li/Uploads/Etc/6-1-2016/4424008807Untitled-1.jpg',
        'Carnage est de retour et il est prêt à apporter sa marque de meurtre et de chaos à New York. Mais lorsque Carnage adopte des alliés partageant les mêmes idées, cela devient Maximum Carnage. Spider-Man, Venom et d''autres pourront-ils l''arrêter ?');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (4, 5, 'Spider-Man: Blue', 'Jeph Loeb', 'Tim Sale', 'Juillet 2002 - Avril 2003',
        'https://readcomiconline.li/Uploads/Etc/4-22-2016/7973992837Untitled-16.jpg',
        'Jeph Loeb et Tim Sale présentent ce somptueux retour sur une époque charnière pour Amazing Spider-Man - y compris l''introduction du premier amour de Peter, Gwen Stacy; sa relation grandissante avec Mary Jane Watson ; son amitié naissante avec Harry Osborn ; et la bataille finale surprenante de Spider-Man contre le gobelin vert.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (4, 6, 'Spider-Man: Sweet Charity', 'Ron Zimmerman', 'Darick Robertson', 'Août 2002',
        'https://readcomiconline.li/Uploads/Etc/7-30-2018/3644243071647.jpg',
        'Un destin cruel s''abat sur le mur-crawler qui est contraint, grâce à une vente aux enchères de célébrités, de passer un week-end en camping avec son ennemi numéro un : J. Jonah Jameson ! Et pour cet étrange couple, les tiques, les coyotes et les ours sont peut-être le cadet de leurs soucis ! Il semble que quelqu''un avec une haine brûlante pour eux deux voit une opportunité de faire d''une pierre deux coups ! Oui, le Scorpion est de retour - et il est plus fou que jamais !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (4, 7, 'Spider-Man: The Mysterio Manifesto', 'Tom DeFalco', 'Lee Weeks, Bob McLeod', 'Janvier 2001 - Mars 2001',
        'https://readcomiconline.li/Uploads/Etc/11-14-2016/40121931586123.jpg',
        'Le colocataire de Peter, Randy Robertson, le réveille après un sommeil agité. Malgré sa réticence, il sait qu''il doit se lever et trouver quelque chose d''intéressant à photographier pour payer ses factures. Il se dirige vers le toit, vérifie les alentours et se transforme en Spider-Man. Il commence alors à fouiller la ville. Après le tribunal, Matt Murdock se transforme en Daredevil et traverse la ville. Il couvre à peine quelques pâtés de maisons lorsqu''il est attaqué par Spider-Man. DD essaie d''éviter le combat mais n''a pas le choix. Il prépare Spider-Man pour une attaque à longue portée avec son billy club. Il le frappe à la tête, le rend inconscient, le faisant chuter vers la rue. Lorsque DD se précipite pour le surveiller, il n''y a pas de corps.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (5, 1, 'Hulk Comic', 'Steve Moore', 'Steve Parkhouse, Dave Gibbons, David Lloyd, Steve Dillon',
        'March 1979 - May 1980', 'https://readcomiconline.li/Uploads/Etc/3-3-2017/74888843071186.jpg',
        'Après avoir joué pendant de nombreuses années dans le titre phare de Marvel UK, The Mighty World of Marvel, Hulk a reçu sa propre publication hebdomadaire. Le titre comprenait du nouveau matériel Hulk dessiné par Dave Gibbons et Steve Dillon. Ce matériel dépeignait Hulk inarticulé et errant de la série télévisée des années 1970. D''autres travaux originaux comprenaient Nick Fury également dessiné par Steve Dillon et une nouvelle bande de Black Knight qui présentait également Captain Britain.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (5, 2, 'Hulk: Nightmerica', 'Robin Laws', 'Brian Ashmore', 'August 2003 - May 2004',
        'https://readcomiconline.li/Uploads/Etc/6-7-2018/56013443071277.jpg',
        'La quête du lieu sinistre appelé Nightmerica se poursuit alors que Banner et Chrissie recherchent le seul homme qui pourrait détenir la clé de ses nombreux mystères. Mais même Hulk pourra-t-il gérer ce qui se trouve dans la citadelle ?');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (5, 3, 'Indestructible Hulk', 'Mark Waid', 'Leinil Francis Yu', 'January 2013 - May 2014',
        'https://2.bp.blogspot.com/-IiyUgdKJHZQ/VnPWC6XNo5I/AAAAAAAAATw/3hdds8GoGlw/s1600-Ic42/3.jpg',
        'Hulk - Force indestructible plus arme que l''homme. Bannière - l''homme le plus intelligent du monde. Combinés, ils sont l''arme la plus puissante et la plus intelligente de la planète ! Et maintenant! l''Indestructible Hulk est un agent du S.H.I.E.L.D. !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (5, 4, 'Hulk: Unchained', 'Grant Calof, Tom Mandrake', 'Tom Mandrake', 'February 1, 2004',
        'https://readcomiconline.li/Uploads/Etc/3-28-2020/87333943071406.jpg',
        'Du jeu vidéo populaire d''Universial Interactive basé sur les histoires classiques de Marvel Comics, une toute nouvelle mini-série de trois numéros met en vedette Goliath à la peau verte ! Revivez les origines dramatiques de l''un des héros les plus puissants de l''univers Marvel et de l''un des ennemis les plus dangereux : l''Abomination !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (5, 5, 'Hulkverines', 'Greg Pak', 'Ario Anindito', 'February 20 2019',
        'https://readcomiconline.li/Uploads/Etc/2-20-2019/66908143071291.jpg',
        'Enfin! C''est Weapon H contre ses prédécesseurs - Wolverine et Hulk ! Une fois, le programme Weapon X cherchait à recréer les deux plus grands chasseurs du monde. Ils se sont retrouvés avec Weapon H, un homme aux griffes d''Adamantium et au sang gamma. Maintenant, Wolverine et Hulk sont de retour en action - et viennent après la dangereuse création faite en leur nom !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (5, 6, 'Hulk & Thing: Hard Knocks', 'Bruce Jones', 'Jae Lee', 'November 2004 - February 2005',
        'https://readcomiconline.li/Uploads/Etc/6-5-2016/61342426.jpg',
        'Bruce Jones et l''artiste superstar Jae Lee vous proposent la bataille ultime entre Hulk et Thing ! Vous pensez tout savoir sur la relation unique entre les deux cogneurs les plus puissants de Marvel ? Devine encore.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (5, 7, 'King-Size Hulk', 'Jeph Loeb, Roy Thomas, Len Wein', 'Herb Trimpe', 'July 2008',
        'https://readcomiconline.li/Uploads/Etc/8-24-2016/5691421534224.jpg',
        'Trois batailles dans un énorme numéro king-size ! Au premier tour, Hulk affronte She-Hulk! Hulk contre Wendigo pour le deuxième combat ! Et enfin, Hulk se bat contre un mystérieux combattant, que personne ne verra venir !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (5, 8, 'World War Hulk', 'Greg Pak', 'Danny Miki, David Finch, John Romita Jr.', 'August 2007 - January 2008',
        'https://readcomiconline.li/Uploads/Etc/3-22-2016/1440702837Untitled-4.jpg',
        'Exilé par un groupe de "héros" Marvel sur la planète extraterrestre sauvage de Sakaar, Hulk a fait rage, saigné et conquis à travers les pages de l''épopée "Planet Hulk" de l''année dernière, passant d''esclave à gladiateur à roi. Maintenant, Hulk revient sur Terre pour assouvir sa terrible vengeance contre Iron Man, Reed Richards, le Dr Strange et Black Bolt – et tous ceux qui se mettent en travers de son chemin. Plus fort que jamais, accompagné de ses monstrueux alliés gladiateurs Warbound, et possédé par la rage la plus féroce et la plus pure imaginable, Hulk pourrait bien déchirer cette stupide planète en deux.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (5, 9, 'World War Hulks', 'Harrison Wilcox, Scott Reed, Paul Tobin, Jeff Parker', 'Aluir Amancio', 'June 2010',
        'https://readcomiconline.li/Uploads/Etc/7-13-2016/1244281534278.jpg',
        'Après la conclusion époustouflante de FALL OF THE HULKS, des secrets, des mystères et des surprises en abondance sont révélés dans ce spécial de taille géante, écrasant les os et irradié aux rayons gamma mettant en vedette les acteurs clés de la plus grande saga Hulk jamais racontée : A-BOMB, COSMIC HULK, RED SHE-HULK, DOC SAMSON et DEADPOOL ! Quelle est la décision déchirante que Rick Jones doit prendre ? Reste-t-il un héros dans l''abîme sombre de l''esprit déformé de Leonard Samson ? Quelle apparence choquera la sauvage Red She-Hulk ? Une ancienne technologie extraterrestre peut-elle signifier une certaine apocalypse pour le monde ?');

-- Ajout des livres Wonder Woman
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (6, 1, 'Wonder Woman: Amazonia', 'William Messner-Loebs', 'Phil Winslade', '1997',
        'https://readcomiconline.li/Uploads/Etc/1-12-2017/67763831586885.jpg',
        'Des héros familiers dans un monde inconnu ! D''un bébé Kal-L débarquant en Russie soviétique au chevalier noir devenant la première lanterne verte au monde en passant par la princesse amazonienne Wonder Woman arrivée à l''époque victorienne, tout est possible dans ELSEWORLDS !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (6, 2, 'Superman vs. Wonder Woman', 'Gerry Conway', 'Jose Luis Garcia-Lopez, Dan Adkins', '1978',
        'https://readcomiconline.li/Uploads/Etc/7-4-2016/8662941534280.jpg',
        'Superman et Wonder Woman of Earth Two s''affrontent alors que Wonder Woman tente de détruire le projet Manhattan et d''empêcher le développement d''armes atomiques tandis que Superman cherche à s''assurer que l''Amérique les développe avant l''Axe. Mais ils doivent mettre leurs différences de côté alors que les agents de l''Axe cherchent à voler des informations vitales sur le projet et à s''assurer que l''Axe développe la bombe atomique en premier.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (6, 3, 'Ame-Comi: Wonder Woman', 'Justin Gray, Jimmy Palmiotti', 'Amanda Conner', 'May 2012 - June 2012',
        'https://readcomiconline.li/Uploads/Etc/7-17-2017/82481743071648.jpg',
        'L''armée américaine a des informations sur une attaque imminente sur une île mystérieuse nommée Themyscira. À part son nom, la seule chose connue de l''île est qu''elle est peuplée d''une race de femmes guerrières. Heureusement, ces Amazones sont également prévenues de l''attaque et se préparent au combat. Une guerrière spéciale, la princesse Diana, peut goûter à la victoire... si seulement elle pouvait convaincre sa mère qu''elle est vraiment prête à se battre !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (6, 4, 'Wonder Woman: Her Greatest Battles', 'Various', 'John Byrne, Cliff Chiang, Jim Lee, George Pérez', 'February 2017',
        'https://readcomiconline.li/Uploads/Etc/6-1-2017/6254824307197.jpg',
        'Le compagnon idéal du film très attendu Wonder Woman de 2017 est ici. Avec les pouvoirs d''un dieu et l''esprit combatif d''une Amazone, Wonder Woman est la plus féroce défenseure de la Terre. Sur Themyscira, Diana a été formée dès sa naissance pour devenir une guerrière. Ses compétences au combat sont inégalées, tout comme ses bracelets pare-balles et son Lasso de vérité. Maintenant, revivez ses plus grands triomphes !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (6, 5, 'Wonder Woman: Our Worlds at War', 'Phil Jimenez', 'Buzz, Cliff Chiang, Jamal Igle', 'September 2001',
        'https://readcomiconline.li/Uploads/Etc/5-30-2017/2834654307167.jpg',
        'Les Amazones viennent de traverser leur propre guerre civile, pour se retrouver au milieu d''une guerre intergalactique. Alors que la guerre fait rage, les Amazones explorent l''histoire de Wonder Woman - de la façon dont Hippolyta a changé l''issue des grandes batailles de la Seconde Guerre mondiale au propre rôle de Diana dans la lutte cosmique actuelle.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (6, 6, 'Wonder Woman: Spirit of Truth', 'Paul Dini', 'Alex Ross', '2001',
        'https://readcomiconline.li/Uploads/Etc/5-6-2016/82017323.jpg',
        'Wonder Woman: Spirit Of Truth trouve la princesse amazone dans une impasse. Malgré ses nobles objectifs et idéaux pour le monde au-delà de Paradise Island, son message de paix, de compréhension et de fraternité est rejeté à cause de la façon dont elle est perçue. Toutes les nations ne sont pas prêtes à l''embrasser - malgré ses nobles actions et ses meilleures intentions. Wonder Woman abat une junte terroriste, envoie des voleurs de haute technologie et d''autres fauteurs de troubles.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (6, 7, 'Wonder Woman: Come Back To Me', 'Amanda Conner, Jimmy Palmiotti', 'Chad Hardin', 'July 17 2019',
        'https://readcomiconline.li/Uploads/Etc/7-18-2019/3946074307175.jpg',
        'Lorsque Steve Trevor est appelé pour un vol d''essai d''un nouvel avion expérimental, il se retrouve perdu dans le triangle des Bermudes - et c''est à Wonder Woman et Etta Candy de suivre sa piste vers une île mystérieuse et sauvage ! Ces histoires écrites par Amanda Conner et Jimmy Palmiotti avec des illustrations de Chad Hardin ont été initialement publiées dans JUSTICE LEAGUE GIANT #3-4 !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (6, 8, 'Wonder Woman and the Star Riders', 'Various', 'Various', 'Janvier 1993',
        'https://readcomiconline.li/Uploads/Etc/10-16-2020/98125643071107.jpg',
        'Cette bande dessinée faisait partie d''un ensemble de quatre bandes dessinées qui était un cadeau gratuit dans une boîte de céréales Cinnamon Mini Buns. Les autres livres étaient Justice League America, Flash et Superman. Cette bande dessinée ne mesure qu''environ quatre pouces de haut et trois pouces de large. Aucun créateur n''est répertorié nulle part dans le livre.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (6, 9, 'Wonder Woman: The Last True Hero', 'William Messner-Loebs', 'Paris Cullins, Lee Moder, Jill Thompson', 'August 4 2020',
        'https://readcomiconline.li/Uploads/Etc/8-5-2020/79886743071171.jpg',
        'En 1992, Wonder Woman est entrée dans une nouvelle ère grâce à l''écrivain primé William Messner-Loebs. Commençant par une rencontre avec Deathstroke et un combat avec son vieil ennemi le Cheetah, la course de Loebs a vu Wonder Woman prise dans l''ombre sombre de l''événement Eclipso et emprisonnée sur une planète sauvage.');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (6, 10, 'Sensational Wonder Woman', 'Stephanie Phillips', 'Meghan Hetrick', 'January 6 2021',
        'https://readcomiconline.li/Uploads/Etc/1-6-2021/4530543071153.jpg',
        'Lors d''une bataille avec le docteur Psycho, Wonder Woman se sacrifie pour arrêter le méchant, seulement pour être frappée par une explosion psychique qui la piège dans une réalité alternative. Avec l''aide de Hawkgirl, Wonder Woman doit se rappeler qui elle est avant qu''il ne soit trop tard.');

-- Ajout des livres Ironman
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (7, 1, 'The Indomitable Iron Man', 'Alexander Irvine, Duane Swierczynski, Howard Chaykin, Paul Cornell', 'Manuel Garcia, Howard Chaykin, Nelson (Nelson DeCastro), William Rosado', 'Février 2010',
        'https://readcomiconline.li/Uploads/Etc/3-29-2020/96519143071417.jpg',
        'Iron Man se bat avec une sonde spatiale hyper-intelligente déterminée à terraformer la planète ! Et Tony combat Titanium Man tout en répondant aux appels de Stark International ! Tout cela et plus encore dans ce tout nouveau one-shot tout en action et en noir et blanc dans l''esprit des magazines Mighty Marvel d''autrefois, mais TOUT MAINTENANT avec style ! The Iron Mania ne s''arrête jamais un instant sur ces quatre histoires écrites par certains des écrivains les plus en vogue de Marvel !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (7, 2, 'Iron Man: Iron Protocols', 'Rick Spears, Robert Venditti', 'Iban Coello, Mark Nelson', 'December 2009',
        'https://readcomiconline.li/Uploads/Etc/10-17-2016/8239311534225.jpg',
        'Au plus profond d''une base gouvernementale secrète sous la toundra arctique se trouve "l''Arche": une voûte contenant les codes génétiques de toute vie sur Terre. Mais il y a un problème : une Intelligence Artificielle malhonnête a décidé que la meilleure façon de protéger les échantillons était d''éradiquer toutes les créatures vivantes ! Seul Iron Man a les connaissances nécessaires pour arrêter la machine, et il n''a qu''une heure pour le faire ! Rejoignez Robert Venditti, créateur de The Surragates, désormais un film majeur, et l''artiste préféré des fans Nelson (X-FACTOR) alors que le destin du monde est en jeu !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (7, 3, 'Iron Man: I Am Iron Man!', 'Peter David', 'Sean Chen', 'March 2010 - April 2010',
        'https://readcomiconline.li/Uploads/Etc/2-8-2017/511860315861294.jpg',
        'Lorsqu''il est fait prisonnier au Moyen-Orient et contraint de construire un missile pour les insurgés, Tony Stark crée une armure pour le maintenir en vie et lui faire exploser la sortie ! Maintenant, Tony voit la folie de sa cupidité et entreprend de réparer les torts en tant qu''Iron Man !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (7, 4, 'Tony Stark: Iron Man', 'Dan Slott', 'Valerio Schiti', 'Juin 2018',
        'https://readcomiconline.li/Uploads/Etc/6-21-2018/71434043071362.jpg',
        'PRENEZ L''ENVOL AVEC DAN SLOTT & VALERIO SCHITI ! De la pointe des rêves de demain à la pointe de l''imagination, un homme plane toujours à la pointe de l''aventure ! Vous connaissez son nom. Tony Stark est Iron Man. Et Iron Man… est une idée. Toujours en évolution. Évolue constamment. Une idée sans limite ! Envolez-vous avec DAN SLOTT (AMAZING SPIDER-MAN) et VALERIO SCHITI (GUARDIANS OF THE GALAXY) alors qu''ils propulsent l''ultime héros autodidacte vers de nouveaux sommets d''inventivité ! Tony Stark est Iron Man. Le futur c''est maintenant. Accrochez-vous !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (7, 5, 'Iron Man Epic Collection', 'Robert Bernstein, Al Hartley, Stan Lee, Larry Lieber, Don Rico', 'Steve Ditko, Don Heck, Jack Kirby', '2013',
        'https://readcomiconline.li/Uploads/Etc/11-2-2018/53118043071868.jpg',
        'Les premières apparitions de Tony Stark, Iron Man ! Lancé en 1963 sous Tales of Suspense, Iron Man représentait un autre idéal héroïque pour les bandes dessinées Marvel. Tony Stark est un industriel millionnaire de la jet-set, mais après un tragique accident, il enfile le costume en alliage d''aluminium d''Iron Man ! L''origine de l''un des personnages les plus aimés de Marvel !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (7, 6, 'Marvel Adventures Iron Man', 'Fred Van Lente', 'James Cordeiro', 'July 2007 - July 2008',
        'https://readcomiconline.li/Uploads/Etc/2-10-2017/836268315861338.jpg',
        'Qui est IRON MAN, le symbole mondialement connu du méga-conglomérat Stark International ? Et quel terrible secret de son passé force l''inventeur milliardaire TONY STARK à devenir le Golden Guardian ? Découvrez ici!');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (7, 7, 'Iron Man: Bad Blood', 'Bob Layton, David Michelinie', 'Bob Layton', 'September 2000 - December 2000',
        'https://readcomiconline.li/Uploads/Etc/6-21-2016/11552227.jpg',
        'C''est la confrontation finale entre Iron Man et Justin Hammer, par l''équipe créative classique de Bob Layton et David Michelinie ! Pendant des années, Tony Stark s''est battu en duel avec l''industriel maléfique détesté, et maintenant il est temps de régler la querelle une fois pour toutes ! Une tentative d''assassinat presque réussie par le puissant Hit Squad incite l''Avenger blindé à riposter, mais qui tire vraiment les ficelles ?');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (7, 8, 'Iron Man: Legacy', 'Fred Van Lente', 'Steve Kurth, Roy Allan Martinez', '2010',
        'https://readcomiconline.li/Uploads/Etc/9-3-2016/1048021534261.jpg',
        'La deuxième série en cours d''Armored Avenger démarre en fanfare alors que la GUERRE DES HOMMES DE FER commence ici ! Les pires craintes de Tony Stark se réalisent lorsque la technologie volée d''Iron Man est utilisée pour le nettoyage ethnique dans un pays ravagé par la guerre civile. Lorsqu''il défie les ordres du gouvernement américain d''affronter lui-même les assassins blindés, Stark déclenche une conflagration internationale qui menace ses amis, son entreprise et sa vie même - et le met sur une trajectoire de collision avec la Chine et la Russie, et leurs champions, Radioactive Man, Titanium Man et le Crimson Dynamo !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (7, 9, 'Iron Age: Alpha', 'Rob Williams', 'Rebekah Isaacs', 'Août 2011',
        'https://readcomiconline.li/Uploads/Etc/9-18-2016/4956841534275.jpg',
        'La Terre est détruite ! Iron Man est emporté dans le flux temporel où la seule chance de survie est de rassembler les plus grands héros des époques et de changer le cours de l''histoire ! Qui rejoindra Iron Man pour ce voyage à travers toutes les époques de Marvel !');
INSERT INTO library.books (id_serie, tome, title, author, illustrator, date, image, description)
VALUES (7, 10, 'The Invincible Iron Man', 'Gerry Duggan', 'Juan Frigeri', 'Décembre 2022',
        'https://readcomiconline.li/Uploads/Etc/12-14-2022/50027043071144.jpg',
        'Tony Stark, le génie-milliardaire-playboy-philanthrope, a tout perdu : sa richesse… sa renommée… ses amis. Mais Stark ne se rend pas compte qu''il a encore beaucoup plus à perdre, surtout quand les assassins commencent à venir pour lui ! C''est le début de la fin, car le Golden Avenger doit se battre pour sa vie et découvrir ce que signifie vraiment toucher le fond. Rejoignez Gerry Duggan (X-Men) et Juan Frigeri (Avengers) alors qu''ils emmènent Iron Man dans les recoins les plus sombres de l''univers Marvel !');

-- Ajout des états des livres
INSERT INTO library.books_statement (id_book, statement)
VALUES (1, 'Neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (2, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (3, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (4, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (5, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (6, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (7, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (8, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (9, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (10, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (11, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (12, 'Neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (13, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (14, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (15, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (16, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (17, 'Neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (18, 'Neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (19, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (20, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (21, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (22, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (23, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (24, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (25, 'Neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (26, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (27, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (28, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (29, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (30, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (31, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (32, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (33, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (34, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (35, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (36, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (37, 'Neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (38, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (39, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (40, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (41, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (42, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (43, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (44, 'Neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (45, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (46, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (47, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (48, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (49, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (50, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (51, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (52, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (53, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (54, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (55, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (56, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (57, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (58, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (59, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (60, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (1, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (2, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (3, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (4, 'Neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (5, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (6, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (7, 'Neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (8, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (9, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (10, 'Neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (11, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (12, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (13, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (14, 'Neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (15, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (16, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (17, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (18, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (19, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (20, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (21, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (22, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (23, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (24, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (25, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (26, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (27, 'Neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (28, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (29, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (30, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (31, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (32, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (33, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (34, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (35, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (36, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (37, 'Neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (38, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (39, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (40, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (41, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (42, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (43, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (44, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (45, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (46, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (47, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (48, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (49, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (50, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (51, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (52, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (53, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (54, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (55, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (56, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (57, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (58, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (59, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (60, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (1, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (2, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (3, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (4, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (5, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (6, 'Neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (7, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (8, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (9, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (10, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (11, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (12, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (13, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (14, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (15, 'Neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (16, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (17, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (18, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (19, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (20, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (21, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (22, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (23, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (24, 'Neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (25, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (26, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (27, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (28, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (29, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (30, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (31, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (32, 'Neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (33, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (34, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (35, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (36, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (37, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (38, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (39, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (40, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (41, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (42, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (43, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (44, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (45, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (46, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (47, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (48, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (49, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (50, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (51, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (52, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (53, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (54, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (55, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (56, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (57, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (58, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (59, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (60, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (1, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (2, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (3, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (4, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (5, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (6, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (7, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (8, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (9, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (10, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (11, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (12, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (13, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (14, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (15, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (16, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (17, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (18, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (19, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (20, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (21, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (22, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (23, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (24, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (25, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (26, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (27, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (28, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (29, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (30, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (31, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (32, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (33, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (34, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (35, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (36, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (37, 'Neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (38, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (39, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (40, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (41, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (42, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (43, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (44, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (45, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (46, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (47, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (48, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (49, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (50, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (51, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (52, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (53, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (54, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (55, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (56, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (57, 'Bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (58, 'Comme neuf');
INSERT INTO library.books_statement (id_book, statement)
VALUES (59, 'Très bon état');
INSERT INTO library.books_statement (id_book, statement)
VALUES (60, 'Comme neuf');

-- Ajout des librairies
INSERT INTO library.libraries (id)
VALUES (1);
INSERT INTO library.libraries (id)
VALUES (2);
INSERT INTO library.libraries (id)
VALUES (3);
INSERT INTO library.libraries (id)
VALUES (4);
INSERT INTO library.libraries (id)
VALUES (5);
INSERT INTO library.libraries (id)
VALUES (6);
INSERT INTO library.libraries (id)
VALUES (7);

-- Ajout des utilisateurs
INSERT INTO library.users (id_library, email, username, password, image)
VALUES (1, 'batman@batmail.com', 'Batman', 'batword',
        'https://drive.google.com/uc?export=view&id=1v76EY-FiUKUw0C7JRuu-GYd7q9Ysq7ws');
INSERT INTO library.users (id_library, email, username, password, image)
VALUES (2, 'superman@supermail.com', 'Superman', 'superword',
        'https://drive.google.com/uc?export=view&id=1Hlt2fm9dCAWPQqMzxuRm-0DZUgWUl3wz');
INSERT INTO library.users (id_library, email, username, password, image)
VALUES (3, 'wolverine@wolvermail.com', 'Wolverine', 'wolverword',
        'https://drive.google.com/uc?export=view&id=17iS1eFU09u5jZGuGGqxeqWh_rwaDkgNI');
INSERT INTO library.users (id_library, email, username, password, image)
VALUES (4, 'superman@spidermail.com', 'Spiderman', 'spiderword',
        'https://drive.google.com/uc?export=view&id=1DPviGN0Oh2Qw98CklBmYeElqdzx0WbYc');
INSERT INTO library.users (id_library, email, username, password, image)
VALUES (5, 'hulk@hulkmail.com', 'Hulk', 'hulkword',
        'https://drive.google.com/uc?export=view&id=1qYwy-GyXGGqiFnazrCDtldvf5kxnyIJN');
INSERT INTO library.users (id_library, email, username, password, image)
VALUES (6, 'wonder-woman@wondermail.com', 'Wonder Woman', 'wonderword',
        'https://drive.google.com/uc?export=view&id=1NJfh8JKDVJKEIH57CKCXUaAS7ijKMDA3');
INSERT INTO library.users (id_library, email, username, password, image)
VALUES (7, 'ironman@ironmail.com', 'Ironman', 'ironword',
        'https://drive.google.com/uc?export=view&id=1JbEhKBKMfabQnD-BH2k00ADU-nGwHKSi');

-- Ajout des emprunts
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (1, 1, '2 semaines', '03/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (6, 1, '3 semaines', '04/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (26, 1, '1 semaine', '05/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (9, 2, '3 semaines', '02/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (23, 2, '2 semaines', '03/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (5, 2, '1 semaine', '02/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (9, 3, '1 semaine', '06/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (25, 3, '3 semaines', '02/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (46, 3, '2 semaines', '03/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (35, 4, '1 semaine', '02/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (45, 4, '2 semaines', '06/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (24, 4, '2 semaines', '03/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (52, 5, '2 semaines', '07/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (16, 5, '4 semaines', '06/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (8, 5, '3 semaines', '08/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (56, 6, '2 semaines', '07/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (22, 6, '4 semaines', '06/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (18, 6, '3 semaines', '08/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (15, 7, '2 semaines', '07/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (48, 7, '4 semaines', '06/04/2023');
INSERT INTO library.borrowings(id_book_statement, id_library, duration, date)
VALUES (35, 7, '3 semaines', '08/04/2023');

-- Ajout des commentaires
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (1, 1, 'Superman, t''as vu la météo aujourd''hui? On dirait que tu vas encore porter ton slip sur ton pantalon',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (1, 2, 'Hey Batman, j''ai vu que t''as mis un nouveau gadget sur ta ceinture. Ça fait quoi, ça sort le popcorn?',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (2, 1, 'Superman, pourquoi tu portes tes sous-vêtements par-dessus tes collants ?', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (2, 2, 'Et toi Batman, pourquoi tu portes une chauve-souris sur la poitrine ?', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (2, 4, 'Wolverine, t''as l''air bien énervé aujourd''hui. Tu t''es coupé les griffes ou quoi?', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (2, 3,
        'Spiderman, comment tu fais pour gérer ta double vie avec autant de fluidité? Moi je suis déjà épuisé juste à l''idée de te regarder',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (3, 1,
        'Superman, j''ai entendu dire que tu voulais changer de look. Tu devrais peut-être t''inspirer de moi et mettre des oreilles de chauve-souris sur ta cape',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (3, 4,
        'Hulk, t''as des problèmes de colère, moi j''ai des problèmes d''argent. Si on faisait un échange de bons procédés?',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (3, 5, 'Spiderman, t''es trop occupé à faire des selfies pour sauver des vies', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (3, 4, 'Et toi Hulk, t''as déjà vu une colère qui a sauvé le monde ?', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (4, 1, 'Wolverine, t''as vraiment besoin de ces griffes en métal pour tuer des gens ?', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (4, 3, 'Au moins moi, je suis capable de voler sans me déguiser en chauve-souris', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (4, 3, 'Superman, tu devrais faire un régime. T''as beau être super fort, t''as aussi une sacrée bedaine',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (4, 2,
        'Spiderman, t''as le pouvoir de grimper aux murs mais pas celui de te raser. Tu devrais peut-être investir dans un rasoir électrique',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (5, 4, 'Je suis le seul héros qui a deux noms de super-héros : Spiderman et Spider-Man', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (5, 1, 'Tu parles beaucoup, mais tu as toujours besoin de l''aide de la "Ligue des justiciers", Superman',
        '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (5, 2,
        'Batman, tu te prends pour un oiseau maintenant? Tu sais que ça ne sert à rien de sauter du haut des immeubles',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (5, 5,
        'Wolverine, tu veux qu''on fasse une partie de bras de fer?',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (5, 3, 'Hulk, t''as déjà essayé le yoga? Je crois que ça t''aiderait à te relaxer', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (5, 4, 'Tu parles à un mec qui a la peau verte et qui devient géant quand il est énervé', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (6, 1, 'Si j''avais un dollar pour chaque fois qu''un vilain m''appelait "souris", je serais riche',
        '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (8, 5, 'Vous pouvez me lancer des tanks dessus, ça ne me dérange pas', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (8, 2, 'Tu veux dire que tu préfères ça à une dispute avec un autre super-héros ?', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (9, 3, 'J''ai entendu dire que ta ceinture de super-héros était faite en Chine, Batman.', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (9, 1, 'Et j''ai entendu dire que tes griffes étaient en plastique, Wolverine.', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (9, 3, 'Au moins, je n''ai pas besoin de porter un costume moulant pour être un héros.', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (10, 4,
        'Hé Hulk, ça doit être difficile pour toi d''aller faire du shopping, vu que tu déchires tous tes vêtements.',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (10, 5,
        'C''est vrai, Spiderman. Et toi, comment fais-tu pour aller aux toilettes avec ta combinaison si serrée ?',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (11, 4, 'Je suis sûr que si on organisait une course entre nous, je gagnerais haut la main.', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (11, 3, 'Je ne suis pas sûr, Batman. Mes griffes me permettent de me déplacer rapidement sur les murs.',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (12, 2,
        'Tu sais ce qui serait cool, Wolverine ? Si on organisait un barbecue tous ensemble. Tu pourrais t''occuper de la viande avec tes griffes.',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (12, 3, 'Désolé, mais je ne mange pas de viande, Superman. Et toi, Spiderman, tu manges des insectes ?',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (13, 4,
        'Je me demande si le dentiste de Hulk a besoin de porter un casque en acier pour se protéger de ses dents.',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (13, 1,
        'Je ne suis pas sûr, mais je sais que tu as besoin de porter un masque pour protéger les gens de tes toiles d''araignée, Spiderman.',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (14, 3,
        'Vous savez ce qui est vraiment cool avec mes griffes, les gars ? Je n''ai jamais besoin d''aller chez le coiffeur.',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (15, 3, 'Superman, je ne sais pas comment tu fais pour rester toujours aussi propre, même après un combat.',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (15, 2, 'Et toi, Wolverine, tu ne sens pas un peu mauvais avec tes griffes en adamantium ?', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (15, 4, 'Hulk, j''espère que tu te laves les mains après avoir touché à tout ce vert.', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (15, 5, 'Spiderman, tu devrais essayer de tisser ta toile autour de tes cernes, ça fera un masque anti-fatigue.',
        '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (15, 5, 'Batman, même avec ta fortune, tu ne peux pas t''acheter un sourire ?', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (16, 3, 'Superman, je pense que tu devrais arrêter de porter tes slips par-dessus ton pantalon.', '04/07/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (16, 2, 'Wolverine, tu es un super héros, mais tu ne peux pas te raser un peu ?', '04/07/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (16, 1, 'Hulk, tu n''as pas un jean qui résiste à tes transformations ?', '04/07/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (16, 5,
        'Batman, tu es un génie, mais tu ne peux pas inventer un moyen de te débarrasser de ton complexe de chauve-souris ?',
        '04/07/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (17, 2, 'Wolverine, tu sais que le rouge et le jaune ne sont plus à la mode depuis longtemps ?', '04/08/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (17, 3, 'Superman, on dirait que tu as hérité de la coupe de cheveux de ton grand-père Kryptonien.',
        '04/08/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (18, 2, 'Hulk, t''es tellement vert que t''en deviens presque sympathique.', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (18, 5, 'J''ai vu plus d''action sur un banc de parc.', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (19, 5, 'Quoi ? Tu veux te battre ? Allez, fais pas ton Wolverine !', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (19, 3, 'Le pire c''est que j''ai même pas besoin de mon armure pour te mettre KO.', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (20, 1, 'Tu sais ce qui est mieux que d''être fort comme Hulk ? Etre intelligent comme moi.', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (20, 5, 'C''est facile de parler quand tu portes un costume de souris.', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (21, 5, 'Hulk smash!', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (21, 1, 'Superman, t''es qu''un caillou. Hulk, il est plus fort que toi!', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (21, 3,
        'C''est vrai que t''as toujours été une tête de mule, Clark. Mais t''inquiètes, tu vas finir par évoluer. Peut-être.',
        '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (22, 2,
        'Logan, tu devrais passer plus de temps à étudier le Japon plutôt que de jouer les coqs avec tes griffes. Tu deviendras peut-être un samouraï.',
        '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (22, 1,
        'Oh oh, t''es vraiment mauvais en géographie, mon pauvre Logan. Le Japon, c''est déjà dans tes souvenirs.',
        '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (23, 2, 'Batman, on peut au moins s''accorder sur une chose : on est tous les deux des orphelins.',
        '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (23, 5,
        'Ouais, mais moi j''ai pas besoin d''avoir des gadgets de luxe pour faire mon boulot. C''est pas donné à tout le monde.',
        '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (23, 3,
        'Les filles, vous êtes toutes les deux tellement impressionnantes. Mais faut reconnaître qu''il y a un peu plus de style chez les X-Men.',
        '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (24, 3,
        'Ha ha, je suis contente que tu aimes mes griffes, chérie. Tu verrais ma combinaison, ça te plairait encore plus.',
        '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (24, 5,
        'Tant que vous n''avez pas de problème avec la couleur jaune poussin de la combinaison de Wolverine, ça va.',
        '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (25, 1, 'Je ne comprends pas comment on peut apprécier des BDs aussi vieillottes', '06/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (25, 3, 'Haha, je suis sûr que tu préfères les histoires de super-héros modernes', '06/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (27, 3, 'Les chauve-souris ne sont pas des héros, juste des animaux nocturnes', '06/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (27, 1,
        'Tu ferais mieux de te méfier, la prochaine fois que tu auras besoin d''aide, je me ferai un plaisir de t''ignorer',
        '06/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (28, 3, 'Le meilleur des X-Men, sans aucun doute', '06/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (28, 5, 'Je ne sais pas, je trouve que sa coupe de cheveux est un peu démodée', '06/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (29, 1, 'Un héros méconnu, mais qui a largement sa place parmi les autres', '06/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (29, 5, 'Oui, et en plus il a une super-pouvoir : la capacité de me faire dormir', '06/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (30, 5, 'Je ne suis pas sûr qu''il soit vraiment un super-héros, il n''a pas de pouvoir', '06/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (30, 2, 'Certes, mais il a la capacité de nous faire rêver avec ses aventures', '06/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (30, 5, 'Encore un mec en slip qui se prend pour un héros...', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (30, 1, 'On se calme Hulk, c''est pas le moment de casser la bibliothèque', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (30, 5, 'Batman, ça te dirait une petite partie de poker pour te changer les idées ?', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (32, 4, 'Hey les gars, vous avez vu ma dernière photo Instagram ?', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (33, 3, 'Spiderman, je suis sûr que t''es même pas capable d''attraper une vraie mouche', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (33, 4, 'Wolverine, je suis sûr que t''es même pas capable de manger une salade', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (34, 1, 'J''ai entendu dire que ta cape était faite en papier mâché, Superman', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (34, 2, 'Au moins, moi je peux voler sans avoir besoin de mes ailes...', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (35, 1, 'Encore un super-héros qui se prend pour un dieu...', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (35, 5, 'C''est toi qui parle, Batman, t''as jamais vu ta tête dans un miroir ?', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (36, 2, 'J''ai beau avoir une force surhumaine, je suis pas sûr de pouvoir te supporter, Hulk', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (36, 4, 'C''est pas faux, il est un peu bruyant ce grand bonhomme vert...', '04/06/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (37, 1, 'Je suis sûr que Batman aurait été un meilleur choix pour les Avengers', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (37, 5, 'Oh s''il te plaît, ne commence pas ce débat encore...', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (38, 5, 'Spiderman, j''aimerais bien t''aider, mais je suis en vacances', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (38, 4, 'Comme si les vacances arrêtaient jamais un Avenger !', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (39, 5, 'Pourquoi tout le monde pense que Hulk est juste une brute sans cerveau ?', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (39, 1, 'Parce que tu fais juste exploser tout ce qui se trouve sur ton chemin ?', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (40, 1, 'J''ai pas aimé ce livre', '03/04/2023');
INSERT INTO library.comments(id_book, id_user, content, date)
VALUES (40, 5, 'Avec toute ta thune, achète toi des super pouvoirs et tu pourra prétendre à devenir un Avenger',
        '03/04/2023');
