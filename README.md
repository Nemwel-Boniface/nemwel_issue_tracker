# Nemwel Issue Tracker

Nemwel's Issue Tracker is a valuable tool for managing and organizing various challenges and requests that arise during a project's lifecycle. It provides a structured way to capture, track, and resolve issues, ultimately leading to increased efficiency, improved collaboration, and better project outcomes.

This application will help me practice:
1. The REST framework by implementing CRUD operations for adding, deleting, and updating data.
2. Writing integrated unit tests using the [Minitest](https://guides.rubyonrails.org/testing.html) library for unit tests for my app controllers.
3. The Ruby on Rails [MVC](https://www.bogotobogo.com/RubyOnRails/RubyOnRails_Model_View_Controller_MVC.php). pattern, focusing on Models and Controllers to handle business logic and data processing.
4. Project documentation by writing a detailed README upon completion to help others understand and use my project.
5. Project deployment making use of [render](https://render.com/) which will host my application.

## How to test the application

1. Sign up for a new account or log in using existing credentials.

[Screencast from 27-05-2025 01:44:04 ALASIRI.webm](https://github.com/user-attachments/assets/7a300ca3-c53e-4078-8e97-b58c978c3e2b)

2. Create a new project from the Projects section. You can create, view, update, and delete projects.

[Screencast from 27-05-2025 03:59:34 ALASIRI.webm](https://github.com/user-attachments/assets/4b76d6a1-9e02-419a-adb5-498797a24c5d)

3. Add multiple issues to any project. Perform full CRUD operations on issues: create, update, delete.
4. Drag and drop the issues depending on its status

[Screencast from 27-05-2025 11:23:23 ALASIRI.webm](https://github.com/user-attachments/assets/009f4123-46ad-49a3-881d-b9864ae11ed2)

5. Navigate to the Reports section to view interactive charts displaying issue statistics by status

[Screencast from 28-05-2025 10:20:24 ASUBUHI.webm](https://github.com/user-attachments/assets/74a4363c-60d6-47ae-a778-1e7c284b81a4)

6. Export all project issues in your preferred format: Excel (.xlsx) for spreadsheet analysis. PDF (.pdf) for downloadable, printable summaries.

[Screencast from 28-05-2025 11:29:35 ASUBUHI.webm](https://github.com/user-attachments/assets/a6850a5d-0a18-4f7e-866f-506e69dbd2bc)

## Video demonstrations
I created video demos of the application and the links will be as follows:



## Future Features
Development of this application follows a Kanban Board, which helps track tasks across different stages i.e Done, In Progress, In Review, and Pending. You can view the board and stay updated on ongoing improvements through [this GitHub project](https://github.com/users/Nemwel-Boniface/projects/10).


| Feature                      | Description                                                                                                            | Status       |
|------------------------------|------------------------------------------------------------------------------------------------------------------------|--------------|
| Simplistic Admin View        | Allow the admin to see stats like total projects, users, issues, and active collaborations.                          | Not Started  |
| Team Collaboration           | Enable users to create teams for a project and invite collaborators with specific roles and permissions.              | Not Started  |
| Task Assignment              | Allow users to assign issues or tasks to specific team members and track individual responsibilities.                  | Not Started  |
| Real-Time Collaboration      | Support real-time updates on issue changes, comments, and activity logs within shared projects.                       | Not Started  |
| Role-Based Access Control    | Define user roles such as Admin, Contributor, and Viewer to control access within projects or teams.                  | Not Started  |



Enjoy!


# Built With
 - Ruby on Rails V7
 - PostgreSQL
 - Test-driven development

## Notable Gems Used

- **Devise** – User authentication system.
- **FriendlyID** – Generates SEO-friendly URLs using slugs.
- **Chartkick** – Simple and attractive JavaScript charts.
- **Axlsx** – Generates Excel (.xlsx) files for reports.
- **Prawn** – PDF generation for downloadable reports.
- **Wicked PDF** *(optional alternative)* – PDF generation using HTML templates.
- **RSpec / Minitest** – For writing and running tests.
- **StimulusJS + Turbo (Hotwire)** – Enhances interactivity without full page reloads.


# Additional Tools
  1. Rubocop - Syntactical checks
  2. Ruby Gems

# Getting Started
To get a local copy of the project and run

1. ``git@github.com:Nemwel-Boniface/nemwel_issue_tracker.git``
2. ``cd nemwel_issue_tracker``
3. ``gem install bundler``
4. ``bundle install``
5. ``./bin/dev`` / ``rails s``
6. You can now access your site through ``http://127.0.0.1:3000/`` 

# Database Setup

Before running the application, create a `.env` file in the root directory and add your PostgreSQL credentials:

```env
DATABASE_USERNAME=your_postgres_username
DATABASE_PASSWORD=your_postgres_password
```
## Setup db

1. ``rails db:create``
2. ``rails db:migrate``
3. ``rails db:seed``


## Run your tests

1. ``rake test``
2. ``rails test``

### To run rubocop we use:

1. `rubocop`

### To autocorrect offenses with rubocop we use:
1. `rubocop --auto-correct-all` or
2. `rubocop -A`

Have fun with my Issue Tracker Application!

## Authors

👤 **Nemwel Boniface**

- GitHub: [@Nemwel Boniface](https://github.com/Nemwel-Boniface)
- Twitter: [@Nemwel Boniface](https://twitter.com/nemwel_bonie)
- LinkedIn: [@Nemwel Bonifacej](https://www.linkedin.com/in/nemwel-nyandoro/)



## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Nemwel-Boniface/nemwel_issue_tracker/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments
- Anyone whose code will be used

## 📝 License

This project is [MIT](./MIT.md) licensed.