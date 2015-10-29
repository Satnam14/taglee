# Taglee

[Click here to visit](https://taglee.herokuapp.com)

Taglee is an application which allows Instagram users to search for pictures and videos based on a tag, a start date and an end date. Users can store their search results in an Album and view them at a later time.

## Technology Stack
* MVC Framework - Ruby on Rails
* Database - PostgreSQL
* Host - Heroku
* JavaScript libraries - Backbone.js, jQuery and Underscore.js

## API<sup> * </sup>
New Album can be created with making a POST request to the following address. Name, tag, start date and end date should be provided as parameters. The created ALbum will be returned as a response

`https://taglee.herokuapp.com/api/albums`

Example Parameters -

`"name"=>"Code With Ruby", "tag"=>"ruby", "start"=>"2015-10-05", "finish"=>"2015-10-31`

Pictures and Videos from an album can be retrieved by making a GET request to the following address

`https://taglee.herokuapp.com/api/albums/:id`

* Requires the user to be logged in

## Development

## Future Plans

#### Features
- [ ] Allow users to search through Instagram using a tag, a start date and an end time, view the results and then have the choice to save the album or not.
- [ ] Allow users to insert individual pictures or videos to an album.
- [ ] Allow users to edit existing albums.
- [ ] Allow users to like and comment pictures and videos
- [ ] Allow users to search for other users, visit profiles of other users and see their pictures.

#### User Interface and Frontend
- [ ] Represent Albums using thumbnails of containing pictures.
- [ ] Make interface to view pictures as close as possible to Instagram.
- [ ] Make subview for each picture inside an album. It'll not only improve organisation but also allow to implement newer features with more ease.

#### API and Backend
- [ ] Warm users before hand about lack of content returned by the chosen tag, start date and end date. Handle edge cases such as end date being before start date.
- [ ]
