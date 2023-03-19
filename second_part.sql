/*
  №1. Используя оператор ALTER TABLE, установите внешний ключ в одной из таблиц.
 */

ALTER TABLE users
    add FOREIGN KEY (id) references clients(id);

/*
 №2. Без оператора JOIN, верните заголовок публикации,
 текст с описанием, идентификатор клиента,
 опубликовавшего публикацию и логин данного клиента.
 */

select posts.title, posts.full_text, users.login,users.pass
from posts
         inner join users on users.id = posts.user_id;

/*
 №3. Выполните поиск по публикациям, автором котоырх является клиент "Mikle".
 */

select posts.title, posts.full_text, users.login,users.pass
from posts
         inner join users on  users.login = 'Mikle'