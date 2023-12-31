<a href="https://hotelpro.fly.dev/" target="_blank">Hotel Pro Deployed Site</a>

# ![image](https://github.com/karanm645/HotelPro/assets/79548116/7975b5df-1584-4075-b328-609ef24aa2a8)


<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-this-project">About This Project</a>
      <ul>
        <li>
          <a href="#learning-goals-of-project">Learning Goals of Project</a>
        </li>
      </ul>
      <ul>
        <li><a href="#versions">Versions</a></li>
      </ul>
      <ul>
        <li><a href="#important-gems">Important Gems</a></li>
      </ul>
      <ul>
        <li><a href="#database-design">Database design</a></li>
      </ul>
      <ul>
        <li><a href="#local-setup">Local Setup</a></li>
      </ul>
    </li>
  </ol>
</details>
 
## About This Project
This project is a backend reservation system. As a hotelier + programmer, I found a niche of hotel owners who log reservation details on paper manually and want something simple yet useful to manage their guests and reservations. Update: I've finished basic functionalities such as creating properties and guests, and having a dashboard to check in guests.
  
  
### Learning Goals of Project 
I wanted to start this project from scratch and (1) practice building objects and creating relations (2) integrate CICD (3) and use logic that can simplify how hoteliers check in their guests!

### Versions

- Ruby 3.2.2

- Rails 7.0.6

### Important Gems
Testing: [rspec-rails](https://github.com/rspec/rspec-rails), [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers), [simplecov](https://github.com/simplecov-ruby/simplecov)
 
### Database Design
![image](https://github.com/karanm645/HotelPro/assets/79548116/8e118797-12d7-44cc-97a6-e9f23e94af34)


### Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run migrations: ` rails db:migrate`
5. Create seeds: ` rails db:seed`
