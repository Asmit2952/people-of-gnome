# People of GNOME

The source for the [The People of GNOME](https://teams.pages.gitlab.gnome.org/Engagement/websites/people-of-gnome)

## About

People of GNOME is a website that contains lists and indexes of all the past and current Contributors of GNOME.
The site is developed with
and maintained using [Jekyll][official-jekyll], a Static Site Generator
developed with Ruby. The site uses following types of files for the content
generation:

 * HTML files with extension `.html`
 * Markdown files with extension `.md`

The data used by the site is stored in the form of following files:

 * YAML files with extension `.yml`
 * JSON files with extension `.json`

## Project Structure

    ...
    ├── .gitlab/                            #contains GitLab template files for bugs and merge requests
    ├── _data/                              #contains site's data files
    │   ├── members/                        #contains all the members/contributors stored in the platform in YML format
    │   ├── navigation.yml                  #links to be added to the site's header and footer sections
    │   ├── member-template.yml             #contains template to add members
    │   ├── projects.json                   #contains all the GNOME projects metadata
    │   ├── badges.json                     #contains metadata of all GNOME Badges/Tags
    │   ├── events.json                     #contains metadata of all GNOME conferences
    │   └── social_networks.json            #contains all kind of supported social networks
    ├── _includes/                          #contains numerous templates like headers and footer
    │   ├── footer.html                     #the footer of the site
    │   ├── header.html                     #the meta data of the site
    │   ├── navbar.html                     #the navbar of the site
    │   ├── scripts.html                    #the scripts used in the site
    │   ├── subheader.html                  #the subheader of the site
    │   ├── contributors/                   #contains templates for the contributors pages
    │   ├── foundation/                     #contains templates for the foundation pages
    │   ├── speakers/                       #contains templates for the speakers pages
    │   └── sections/                       #generic templates reused across the website
    │       ├── members.html                #contains the member widget template
    │       ├── member-badges.html          #contains a sub-widget for displaying a member badges
    │       ├── member-conferences.html     #contains a sub-widget for displaying a member conferences list
    │       └── member-social.html          #contains a sub-widget for displaying a member social networks
    ├── _layouts/     
    │   ├── member.html                     #contains permanent profile page template for each members
    ├── assets/                             #contains site's valuable entities
    │   ├── font/                           #contains site's font: Red Hat Display
    │   ├── img/                            #contains site's images and illustrations
    │   └── scss                            #contains site's preprocessor stylesheets
    │       ├── colorful.scss               #stylesheet for syntax highlighting
    │       ├── index.scss                  #stylesheet for user defined styles
    │       ├── markdown.scss               #stylesheet for styling the markdown content
    │       └── theme.scss                  #stylesheet for website's theme. Generated from Bootstrap
    ├── collections/                        #contains the site's collections
    │   └── _pages/                         #contains site's main pages
    ├── _config.yml                         #contains Jekyll settings for the site
    ├── .gitignore
    ├── .gitlab-ci.yml                      #for GitLab Continuous Integration and Deployment
    ├── 404.html                            #custom not found page. Only works when deployed to GitLab Pages
    ├── CODE_OF_CONDUCT.md
    ├── Gemfile                             #contains gem dependencies for the site.
    ├── Gemfile.lock
    ├── LICENSE.txt
    ├── package-lock.json
    ├── package.json                        #contains node dependencies for the site.
    ├── README.md
    └── setup.sh                            #script for setting up the website

## Adding yourself to the Website

Create a new YAML file on `_data/members/` directory containing the following entries. You can also look at [this template](_data/member-template.yml)

| Field         | Description                                       | Example                 | Type                                                    |
| ------------- |:-------------------------------------------------:| -----------------------:| ------------------------------------------------------- |
| Name          | Your name                                         | John Smith              | string                                                  |
| Nick Name     | Your nick name                                    | ovflowd                | string                                                  |
| Pronoun       | Your pronoun                                      | he\him                  | string                                                  |
| Bio           | Your bio/description                              | Kindness is amazing!    | string                                                  |
| Country       | Your country/favourite emoji                      | 💫                      | emoji                                                   |
| Avatar        | Your Avatar Image                                 | https://imgur.com/image | string/boolean                                          |
| Position      | Your current position at the GNOME Project        | Community Manager       | string                                                  |
| Badges        | All the badges/roles you held at GNOME/Foundation | `['engagement-team']`   | array:entries from `badges.json`                        |
| Status        | If you're a current/active GNOME Contributor      | `true`                  | boolean                                                 |
| Projects      | The Projects/Repositories you're working on       | `['gtk']`               | array:entries from `projects.json`                      |
| Conferences   | The Conferences you participated in               | `['guadec-2018']`       | array:entries from `events.json`                        |
| Socials        | Social media handles                             | `{'twitter': 'handle'}` | collection:key from `social_networks.json`;value:string |

After this, add a new entry and commit the changes with a **Merge Request**. If details are filled in correctly, it will be approved.

## Add Custom Badges/Social Networks and Projects

You're also free to add new Badges and Social Networks and Projects/Repositories, by creating new entries on the `social_networks.json`, `badges.json` and `projects.json`.

## Installing & Running

### Dependencies

- Software Dependencies
  - [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
  - Ruby Development Package (aka ruby-dev)
  - [NodeJS](https://nodejs.org/en/download/)
- Installing Dependencies in **Ubuntu/Debian**
  ```
  sudo apt update
  sudo apt install -y build-essential ruby ruby-dev nodejs npm bash git rsync
  sudo gem update --system '2.7.9' 
  ```
- Installing Dependencies Windows
  - Please use [WSL](https://docs.microsoft.com/en-us/windows/wsl/)
- Installing Dependencies in macOS
  ```
  brew install node rsync
  ```

### Setting up the repository
  
To get the site up and running locally, follow the below steps:

**PS.:** You need to have a full Bash environment. If you're on Windows, please use WSL.

- Create a local clone of the website:
  ```
  git clone https://gitlab.gnome.org/Teams/Engagement/websites/people-of-gnome.git
  ```
- Change into the people-of-gnome directory
  ```
  cd people-of-gnome
  ```
- Perform the following commands to install dependencies and structure the website properly:
  ```
  ./setup.sh
  ```
- Build the site and make it available on your local server
  ```
  ./run.sh
  ```
- Browse [http://localhost:4000](http://localhost:4000) to view the website.

## Project Dependencies

This project relies on the dependencies as well. These dependencies are provided
in the Ruby `Gemfile` or NPM's `package.json`. Following table shows the
list of dependencies used by this project:

Package | Version | File | Source
--- | --- | --- | ---
bootstrap | `4.4.1` | [package.json][package.json] | [GitHub](https://github.com/twbs/bootstrap/)
@fortawesome/fontawesome-free | `5.12.0` | [package.json][package.json] | [GitHub](https://github.com/FortAwesome/Font-Awesome/)
jquery | `3.4.1` | [package.json][package.json] | [GitHub](https://github.com/jquery/jquery)
popper.js | `1.16.1` | [package.json][package.json] | [GitHub](https://github.com/FezVrasta/popper.js/)
slick-carousel | `1.8.1` | [package.json][package.json] | [GitHub](https://github.com/kenwheeler/slick/)
moment | `2.24.0` | [package.json][package.json] | [GitHub](https://github.com/moment/moment/)
node-sass | `4.13.1` | [package.json][package.json] | [GitHub](https://github.com/sass/node-sass/)
jekyll | `3.8.5` | [Gemfile][Gemfile] | [GitHub](https://github.com/jekyll/jekyll/)

Read about adding/updating/removing dependencies on [how to contribute](CONTRIBUTING.MD#addingupdatingremoving-dependencies).

## Pipeline

The pipeline used by the website is the top-level component of continuous
integration, delivery, and deployment.

The pipeline defined by this repository uses the `Ruby2.5` image. The pipeline
consists of a script that runs before the site is tested/deployed. The
script that runs before the test/deployment of the website basically
installs all the `gem/npm dependencies` and then builds the website
before testing/deploying.

`test` stage is performed on all branches but `master`. `deploy` stage on
the other hand is performed only on `master` branch.

## Code of Conduct

This project is an open source project with a contributor community that spans across
the globe. We want everyone in our community to feel safe and encourage the
participation of people from all backgrounds, regardless of
experience level, age, gender, identity, race, religion, or nationality. We
expect all contributors to uphold the [Code of Conduct][code-of-conduct].

## License Information

This project is licensed under the [Creative Commons BY-SA-4.0][license].

<!-- markdown variables -->
[contributing]: /CONTRIBUTING.md
[code-of-conduct]: /CODE_OF_CONDUCT.md
[official-jekyll]: https://jekyllrb.com
[package.json]: package.json
[Gemfile]: Gemfile
[license]: LICENSE.txt
