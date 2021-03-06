# Booking a Counseling Session Backend
> This is an app that helps you book a counseling session with experts in many areas. It is the backend of a react app. It is an api only app which serves the requests of react app. The front-end of the app can be found [here](https://github.com/DanielMitiku/book-a-counseling-session-frontend.git). 

## Built with
- Ruby on Rails
- Rails JSON API 
- JWT 
- Postgresql 

## Demo

🔥 [Demo](https://book-a-session-rails-react.herokuapp.com/)

## Screenshot

<img src="./screenshot.png">

## RESTful endpoints

  |                   Endpoint                   |           Functionality         | 
  | -------------------------------------------- | ------------------------------- |
  | POST /signup                                 |   Create User                   |
  | POST /auth/login                             |   Login Users                   |
  | GET /users                                   |   Get Users                     |
  | GET /users/:id                               |   Get User                      |
  | PUT /users/:id                               |   Update User                   | 
  | DELETE /users/:id                            |   Delete User                   |
  | GET /users/:user_id/appointments             |   Get Users Appointments        |
  | POST /users/:user_id/appointments            |   Create Users Appointments     |
  | GET /users/:user_id/appointments/:id         |   Get an appointment            |
  | PUT /users/:user_id/appointments/:id         |   Update an appointment Users   |
  | DELETE /users/:user_id/appointments/:id      |   Delete an appointment Users   |
  | GET /counselings                             |   Get Counselings               |
  | GET /counseligs/:id                          |   Get Counseling                |
  | PUT /counselings/:id                         |   Update Counseling             |
  | DELETE /counselings/:id                      |   Delete Counseling             |  


## Get Started 

*Clone the repo to your local machine*
```bash
    git clone https://github.com/DanielMitiku/book-a-counseling-session-backend.git
    cd book-a-counseling-session-backend
```

- Please install Postgres db in your computer and add the appropriate config to the *config/database.yml* file

*Install `gems` packages, migrate database and start development server*

```bash
    bundle install
    rails db:create
    rails db:migrate
    rails s
```

## Examples

- You can use any tool to make requests to the server. In this example, I used httpie.
- To login and receive JWToken as a response, pass your email and password as shown below:

```bash
    http :4000/auth/login email=your_email password=your_password
```

- To get the appointments of a user:

```bash
    http :4000/users/:user_id/appointments Authorization:'Auth_token'
```

## Current Features

- RESTful API as shown in the above table
- User authentication using JWT
- User authorization
- Users can book/remove appointments
- Admins can remove users' appointments
- Admins can add/remove sessions users will book
- Admins can remove users ...

## Features you can add

- API versioning
- making each user have its own timezone ...

## Author

- Github: [Daniel Mitiku](https://github.com/DanielMitiku)
- LinkedIn: [@daniel-wesego](https://www.linkedin.com/in/daniel-wesego/)
- Email: wedanielmitiku@gmail.com

## 🤝 Contributing

- Contributions, issues and feature requests are welcome!

- Feel free to create PR.

## Show your support

- Give a ⭐️ if you like this project and follow me on [Github](https://github.com/DanielMitiku) for more projects like this.

## 📝 License

- This project is [MIT](lic.url) licensed.