# Pinboard

This is the ***Introduction to Ruby on Rails*** project course. Third course project of the *EPFL Extension School* **Web Application Development Program**

## Project Goals

### General notes

A *Use*r indicates someone who _has_ identified themselves within the application by registering and logging in.

A *Visitor* indicates anyone visiting the website that has not identified themselves by registering and logging in _as well as_ Users.

### Option 1: Pin you images

Create an application that allows people to create a virtual pinboard for images and photos that they find online. It will be a similar but more basic experience to the popular website [Pinterest website](https://www.pinterest.com)

Implement the following features in your application, that allow:

1. Visitors to open a simple static HTML page, `about.html`, that includes the title of the project option, a brief description of what the website is for and who built it. _This page does not need to include any of the bootstrap styling indicated below._
2. Visitors to register and log in as a User with their `:email` using a basic sign up and log in form. Use a model named `User` for this task.
3. Users to create Pins that include a `:title`, an `:image_url` for the image that they want to “pin", and a `:tag`, which is a phrase or category relevant to the Pin. Use a model called `Pin` for this task. The Pin needs to be associated with the User that created it.
4. Visitors to view the six most-recently created Pins on the homepage / root path.
5. Visitors to search for Pins with a search term that will match on either `:title` or `:tag` from a form on the homepage. The form should submit in a way that the URL for any particular search can be copied and sent to others.
6. Visitors to view all of the details for a Pin plus all Comments related to that Pin on one view. The `:title` and `:tag` should be displayed as text and the `:image_url` used to display the image at that URL. This view will be linked from the individual Pins displayed on the search results view.
7. Users to edit all details of a Pin by clicking on a link from the “Show pin” view.
8. Users to save new or updated Pins only if a `:title` is provided i.e. `:title` is required, and that a `:tag` is no longer than 30 characters in length, although a `:tag` is optional. Any validation errors should be displayed helpfully for User.
9. Users to add a comment on a “show pin” view when they are signed in. Use a model named `Comment` for this task. The Comment needs to be associated with the Pin that it was created from and the User that created it.
10. Users to add any Pin created by any User to their "personal Pin list" from the show Pin view. It should not be possible to add a Pin more than once. Their personal Pin list should be available on a separate view, listing all of the Pins that they’ve saved. A link to the form to create a new Pin needs to be included on this view.
11. Visitors to have a link to the homepage, the about page, and the login/register view in the header of every view.
12. Users to have a link to the homepage, the about page, and their personal pin list in the header of every view.

## Project requirements

The outlines above don't go into as much detail as previous course projects: this is to assess your ability to interpret the project brief and create the appropriate models, controllers, views, and routes based on the guidelines below. In particular, the project submission must demonstrate all aspects of developing with the Ruby on Rails framework taught in this course, including:

* Use of views, partials, and layouts.
* Use of the Rails asset pipeline for CSS rules and images (see `CSS, JavaScript and app design` below for guidance on what CSS rules you should use)
* Use of the Rails router, including resources.
* Use of controllers, controller actions and the application controller.
* Use of models, associations, and validations.
* Use of automated system and model tests.
* Use of Active Record and database interactions.
* Use of migrations and managing database table structures.

It's also necessary to demonstrate the following principles of software development:

* Good source control management with git.
* Good code structure and reuse.
* Good naming and organisation of automated tests.
* Good code formatting throughout a project codebase.
