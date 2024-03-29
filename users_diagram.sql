CREATE TABLE "roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(10) NOT NULL
);

CREATE TABLE "users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(30) NOT NULL,
  "email" varchar(50) NOT NULL,
  "password" varchar(15) NOT NULL,
  "age" int NOT NULL,
  "rol_id" int NOT NULL
);

CREATE TABLE "levels" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(15)
);

CREATE TABLE "courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(50) NOT NULL,
  "description" varchar(100) NOT NULL,
  "teacher_id" int NOT NULL,
  "level_id" int NOT NULL
);

CREATE TABLE "courses_videos" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(50) NOT NULL,
  "url" varchar(80) NOT NULL,
  "course_id" int NOT NULL
);

CREATE TABLE "categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(40) NOT NULL
);

CREATE TABLE "categories_courses" (
  "categorie_id" int NOT NULL,
  "course_id" int NOT NULL
);

CREATE TABLE "users_courses" (
  "student_id" int NOT NULL,
  "course_id" int NOT NULL
);

ALTER TABLE "users" ADD FOREIGN KEY ("rol_id") REFERENCES "roles" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("student_id") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "users" ("id");

ALTER TABLE "courses_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");

ALTER TABLE "categories_courses" ADD FOREIGN KEY ("categorie_id") REFERENCES "categories" ("id");

ALTER TABLE "categories_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");


//*informacion insertada *//

INSERT INTO roles (name) VALUES ('student'), ('teacher'), ('admin');

INSERT INTO users (name, email, password, age, rol_id) VALUES ('Daniel', 'daniel@gmail.com', '1234', 30, 1) , ('Frida', 'frida@gmail.com', '1254', 23, 2), ('Fernanda', 'fer@gmail.com', '1234', 29, 3);

INSERT INTO levels (name) VALUES ('Beginner'), ('Intermediate'), ('Advance');

INSERT INTO courses (title, description, teacher_id, level_id) VALUES ('Adobe Illustrator', 'Take your first steps in graphic design. Go hand in hand with Adobe certified instructors.', 2 , 1), ('Adobe Photoshop', 'Keep feeding your imagination. Give life to the images that fly in your head.', 2 , 2);

INSERT INTO courses_videos (title, url, course_id) VALUES ('Adobe Illustrator Basic', 'www.online.edumac/courses/cursoillustratorbasic', 1), ('Adobe Photoshop', 'www.online.edumac/courses/cursophotoshpintermedio', 2);

INSERT INTO categories (name) VALUES ('Illustration '), ('Image retouching');

INSERT INTO categories_courses (categorie_id, course_id) VALUES (1, 1), (2, 2);

INSERT INTO users_courses (student_id, course_id) VALUES (1, 1), (1, 2);